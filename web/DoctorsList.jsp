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
        <title>View Doctors</title>
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
    <%
        try {
            Connection con = DB.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from Table_Doctor ");
    %>
<center><h2>All Doctors</h2></center>
    <%
        String delete = (String) session.getAttribute("delete");
        if (delete != null) {
            session.removeAttribute("delete");
            out.println("<center><div class='alert alert-success'>Doctor has been removed successfully...</div></center>");
        } else {
        }
        String update = (String) session.getAttribute("update");
        if (update != null) {
            session.removeAttribute("update");
            out.println("<center><div class='alert alert-success'>Doctor detail has been updated successfully...</div></center>");
        } else {
        }
    %><hr>
<table id="myTable" class="table table-striped" style="background-color: transparent;">
    <thead>
        <tr>
            <th>Sr. No.</th><th>ID</th><th>Name</th><th>Email</th><th>Gender</th><th>DOB</th><th>Age</th><th>Fees</th><th>Department</th><th>Degree</th><th>Address</th><th>Registration Date</th><th>Action</th>
        </tr>
    </thead>
    <tbody>
        <%
            int count = 0;
            while (rs.next()) {
                count++;
                String s1 = rs.getString("Dname");
                String s2 = rs.getString("Did");
                String s3 = rs.getString("Email");
                String s4 = rs.getString("Gender");
                String s5 = rs.getString("age");
                String dob = rs.getString("dob");
                String s6 = rs.getString("Fees");
                String s7 = rs.getString("Department");
                String s8 = rs.getString("Degree");
                String s9 = rs.getString("Address");
                String s10 = rs.getString("Reg_Date");
        %>

        <tr><td><%=count%></td><td><%=s2%></td><td><%=s1%></td><td><%=s3%></td><td><%=s4%></td><td><%=dob%></td><td><%=s5%></td><td><%=s6%></td><td><%=s7%></td><td><%=s8%></td><td><%=s9%></td><td><%=s10%></td>
            <td><a href="EditADoctor.jsp?id=<%=s2%>">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="DeleteDoctor.jsp?id=<%=s2%>">Delete</a></td></tr>
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
