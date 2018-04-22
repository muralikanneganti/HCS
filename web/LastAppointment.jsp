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
    <style>
        .navbar-brand {
            padding: 0px;
        }
        .navbar-brand>img {
            height: 100%;
            padding: 15px;
            width: auto;
        }
        /* EXAMPLE 3

        line height is 20px by default so add 30px top and bottom to equal the new .navbar-brand 80px height  */

        .example3 .navbar-brand {

            height: 80px;
        }
        .example3 .nav >li >a {
            padding-top: 30px;
            padding-bottom: 30px;
        }
        .example3 .navbar-toggle {
            padding: 10px;
            margin: 25px 15px 25px 0;
        }
        body {
            //background:url('images/pp2.png') no-repeat center center;
            background-size:cover;

            /* Workaround for some mobile browsers */
            min-height:100%;
        }
        html{
            /* This image will be displayed fullscreen */
            //background:url('images/bg1.jpg') no-repeat center center;
            /* Ensure the html element always takes up the full height of the browser window */
            height:100%;
            /* The Magic */
            background-size:cover;
        }
        label
        {
            font-size: 14px;
        }
        #navbar3 li a:hover
        {
            color:lightseagreen;
        }
    </style>
</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') repeat left top;">
    <div class="example3">
        <nav class="navbar navbar-inverse navbar-static-top" style="background-color: whitesmoke;">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar3">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="PatientHome.jsp"><img src="images/log.png" style="height:80px" alt="hcs">
                    </a>
                </div>
                <div id="navbar3" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="PatientHome.jsp">Home</a></li>
                        <li><a href="ViewProfile.jsp">Profile</a></li>
                        <li><a href="ViewDoctors.jsp">Doctors</a></li>
                        <li><a href="ViewPReports.jsp">Your Reports</a></li>
                        <li><a href="YourQueries.jsp">Your Queries</a></li>
                        <li><a href="PSymptoms.jsp">Symptom Checker</a></li>
                        <li><a href="BookApointment.jsp">Book Appointment</a></li>
                        <li><a href="PayBill.jsp">Billing</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">More <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="Services.jsp">Services</a></li>
                                <li><a href="About.jsp">About Us</a></li>
                                <li><a href="Contact.jsp">Contact Us</a></li>
                                <li><a href="FeedbackForm.jsp">Feedback</a></li>
                            </ul>
                        </li>
                        <li><a href="index.jsp">Logout</a></li>
                </div>
                <!--/.nav-collapse -->
            </div>
            <!--/.container-fluid -->
        </nav>
    </div>
    <%
        String pid = (String) session.getAttribute("pid");
        if (pid != null) {
    %>
    <%!
        Connection con;
        Statement st;
        String name, id;
        ResultSet rs;
    %>
    <%
        try {
            name = (String) session.getAttribute("name");
            id = request.getParameter("id").trim();
            con = DB.getConnection();
            st = con.createStatement();
            rs = st.executeQuery("select * from appointment where pid='" + id + "'");
            if (rs.next()) {
    %>
<center><h2>Your Previous Appointment</h2></center>
<table id="myTable" class="table table-striped" >
    <thead>
        <tr>
            <th>Sr. No.</th><th>Doctor Name</th><th>Doctor Department</th><th>Doctor Fees</th><th>Appointment Date</th><th>Appointment Time</th><th>Status</th>
        </tr>
    </thead>
    <tbody>
        <%
            int count = 0;
            Connection cons = DB.getConnection();
            Statement sts = cons.createStatement();
            ResultSet rss = sts.executeQuery("select * from appointment where pid='" + id + "'");
            while (rss.next()) {
                count++;
        %>
        <tr><td><%=count%><td><%=rss.getString("dname")%></td><td><%=rss.getString("department")%></td><td><%=rss.getString("fees")%></td><td><%=rss.getString("appoint_date")%></td><td><%=rss.getString("appoint_time")%></td><td><%=rss.getString("status")%></td></tr>
        <%
                    }
                } else {
                    out.println("<center><h1>You have fixed any appointment with any doctor!!</h1><center>");
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>

</table>
<center>
    <!--    <a href="PatientHome.jsp">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Logout.jsp">Logout</a>-->
</center>
<%
    } else {
        response.sendRedirect("index.html");
    }
%>
</body>
</html>
