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
        <title>View Contacts</title>
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
        String name, email, contact, comment, subject;
        int id;
    %>
<center><h2>All Users Contact's</h2></center>
    <%
        String deleted = (String) session.getAttribute("deleted");
        if (deleted != null) {
            session.removeAttribute("deleted");
            out.println("<center><div class='alert alert-success'>Contact has been deleted successfully...</div></center>");
        } else {
        }
    %>
<table id="myTable" class="table table-striped" >
    <thead>
        <tr>
            <th>Sr. No.</th><th>User Name</th><th>Email</th><th>Contact No.</th><th>Subject</th><th>Message</th><th>Action</th>
        </tr>
    </thead>
    <tbody>
        <%
            try {
                con = DB.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("select * from contact");
                while (rs.next()) {
                    id = rs.getInt("id");
                    name = rs.getString("name");
                    email = rs.getString("email");
                    contact = rs.getString("Contact");
                    comment = rs.getString("message");
                    subject = rs.getString("subject");
        %>
        <tr>
            <td><%=id%></td><td><%=name%></td><td><%=email%></td><td><%=contact%></td><td><%=subject%></td><td><%=comment%></td><td><a href="DeleteContact?id=<%=rs.getInt("id")%>">Delete</a></td>
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