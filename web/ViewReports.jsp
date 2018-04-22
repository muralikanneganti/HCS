<%@page import="com.java.DB"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
        <title>Reports</title>
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
        String name, dname, pid, bill, disease, room, gender, age, email;
    %>
<center><h2>All Patients Reports</h2></center>
<table id="myTable" class="table table-striped" >
    <thead>
        <tr>
            <th>PID</th><th>Patient Name</th><th>Email</th><th>Gender</th><th>Consultant Doctor Name</th><th>Diagnosis</th><th>Address</th><th>Total Bill</th>
        </tr>
    </thead>
    <tbody>
        <%
            try {
                con = DB.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("select b.Pid, b.Pname, b.Dname,b.bill,p.Email,p.Gender,p.Reg_Date,p.address from Patient_Bill b INNER JOIN  Table_Patient p ON b.Pid=p.Pid");
                while (rs.next()) {
                    pid = rs.getString("Pid");
                    name = rs.getString("Pname");
                    dname = rs.getString("Dname");
                    //disease = rs.getString("Disease");
                    bill = rs.getString("bill");
                    email = rs.getString("Email");
                    //age = rs.getString("Age");
                    gender = rs.getString("Gender");
        %>
        <tr>
            <td><%=pid%></td><td><%=name%></td><td><%=email%></td><td><%=gender%></td><td><%=dname%></td><td><%=disease%></td><td><%=rs.getString("address")%></td><td><%=bill%></td>
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