<%@page import="com.java.DB"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>View Patients</title>
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
        PreparedStatement ps;
        Statement st;
        ResultSet rs;
        String name, email, gender, service, pass, age, Reg_Date, contact, dob, status, pid, room, address, disease;
    %>
<center><h2>All Patients</h2></center>
    <%
        String delete = (String) session.getAttribute("delete");
        if (delete != null) {
            session.removeAttribute("delete");
            out.println("<center><div class='alert alert-success'>Patient has been removed successfully...</div></center>");
        } else {
        }
        String update = (String) session.getAttribute("update");
        if (update != null) {
            session.removeAttribute("update");
            out.println("<center><div class='alert alert-success'>Patient detail has been updated successfully...</div></center>");
        } else {
        }
    %><hr>
<table id="myTable" class="table table-striped" >
    <thead>
        <tr>
            <th>Sr. No.</th><th>ID</th><th>Name</th><th>Email</th><th>Contact No.</th><th>DOB</th><th>Age</th><th>Gender</th><th>Status</th><th>Address</th><th>Registration Date</th><th>Action</th>
        </tr>
    </thead>
    <tbody>
        <%
            try {
                int count = 0;
                con = DB.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("select * from Table_Patient");
                while (rs.next()) {
                    count++;
                    pid = rs.getString("Pid");
                    name = rs.getString("Pname");
                    email = rs.getString("Email");
                    contact = rs.getString("Contact");
                    dob = rs.getString("Dob");
                    gender = rs.getString("Gender");
                    age = rs.getString("age");
                    status = rs.getString("Pstatus");
                    address = rs.getString("Address");
                    //service = rs.getString("service_type");
                    Reg_Date = rs.getString("Reg_Date");
        %>
        <tr>
            <td><%=count%> <td><%=pid%></td><td><%=name%></td><td><%=email%></td><td><%=contact%></td><td><%=dob%></td><td><%=age%></td><td><%=gender%></td><td><%=status%></td><td><%=address%></td><td><%=Reg_Date%></td>
            <td><a href="EditAPatient.jsp?id=<%=pid%>">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="DeletePatient.jsp?id=<%=pid%>">Delete</a></td>
        </tr>
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