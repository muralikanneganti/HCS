<%@page import="com.java.DB"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
    <script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#myTable').dataTable();
        });
    </script>
</head>
<body style="background-image: url(images/bg1.jpg);">
    <jsp:include page="AEheader.jsp" flush="true"></jsp:include>
    <%
        String name = (String) session.getAttribute("name");
        if (name != null) {
    %>
    <%!
        Connection con;
        Statement st;
        String pname, pid, s4, s5, s6, s7, s8, s1, s2;
        int id;
    %>
    <%
        try {
            pname = (String) session.getAttribute("name");
            pid = (String) session.getAttribute("pid");
            con = DB.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from appointment");
    %>
<center><h2>All Appointments</h2></center>
    <%
        String deleted = (String) session.getAttribute("deleted");
        if (deleted != null) {
            session.removeAttribute("deleted");
            out.println("<center><div class='alert alert-success'>Appointment has been deleted successfully...</div></center>");
        } else {
        }
    %>
<table id="myTable" class="table table-striped" >
    <thead>
        <tr>
            <th>Sr. No.</th><th>Patient ID</th><th>Patient Name</th><th>Doctor ID</th><th>Doctor Name</th><th>Doctor Department</th><th>Doctor Fees</th><th>Appointment Date</th><th>Status</th><th>Added Date</th><th>Action</th>
        </tr>
    </thead>
    <tbody>
        <%
            int count = 0;
            while (rs.next()) {
                count++;
                id = rs.getInt("id");
                pid = rs.getString("pid");
                pname = rs.getString("pname");
                s4 = rs.getString("department");
                s5 = rs.getString("dname");
                s6 = rs.getString("fees");
        %>

        <tr><td><%=count%></td><td><%=pid%></td><td><%=pname%></td><td><%=rs.getString("did")%></td><td><%=s5%></td><td><%=s4%></td><td><%=s6%></td><td><%=rs.getString("status")%></td><td><%=rs.getString("appoint_date_time")%></td><td><%=rs.getString("added_date")%></td><td><a href="DeleteAppointment?id=<%=rs.getInt("id")%>">Delete</a></td></tr>
        <%
                }

            } catch (Exception e) {
                out.println(e);
            }
        %>
    </tbody>
</table>
<center>
    <!--    <a href="AdminHome.jsp">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Logout.jsp">Logout</a>-->
</center>
<%            } else {
        response.sendRedirect("index.jsp");
    }
%>
</body>
</html>
