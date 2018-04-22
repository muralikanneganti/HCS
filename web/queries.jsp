<%@page import="java.util.UUID"%>
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
        <title>Queries</title>
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
    <%!
        Connection con;
        PreparedStatement ps;
        Statement st;
        ResultSet rs;
        String pid, pname, age, email, smoking, alcohlic, symtomps, date;
    %>
<center><h2>Patient's Queries</h2></center>
    <%
        String deleted = (String) session.getAttribute("deleted");
        if (deleted != null) {
            session.removeAttribute("deleted");
            out.println("<center><div class='alert alert-success'>Patient query has been deleted successfully...</div></center>");
        } else {
        }
    %>
<table id="myTable" class="table table-striped" >
    <thead>
        <tr>
            <th>Sr. No.</th><th>PID</th><th>Pname</th><th>Age</th><th>Smoking</th><th>Alcohlic</th><th>Query</th><th>Doctor Reply</th><th>Date</th><th>Action</th>
        </tr>
    </thead>
    <tbody>
        <%
            try {
                //String id = (String) session.getAttribute("did");
                String tokes = UUID.randomUUID().toString();
                //out.println(id);
                con = DB.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("select * from queries");
                while (rs.next()) {
                    pid = rs.getString("Pid");
                    pname = rs.getString("Pname");
                    age = rs.getString("age");
                    smoking = rs.getString("smoking");
                    alcohlic = rs.getString("alcohlic");
                    symtomps = rs.getString("query");
                    date = rs.getString("date");
        %>
        <tr>
            <td><%=rs.getInt("id")%></td><td><%=pid%></td><td><%=pname%></td><td><%=age%></td><td><%=smoking%></td><td><%=alcohlic%></td><td><%=symtomps%></td><td><%=rs.getString("doctor_reply")%></td><td><%=date%></td><td><a href="DeleteQueries?id=<%=rs.getInt("id")%>">Delete</a></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </tbody>
</table>
<!--<center><a href="AdminHome.jsp">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Logout.jsp">Logout</a></center>-->
</body>
</html>