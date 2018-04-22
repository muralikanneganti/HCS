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
        <title>Appointments</title>
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
    <script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
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
                    <a class="navbar-brand" href="DoctorHome.jsp"><img src="images/log.png" style="height:80px" alt="Dispute Bills">
                    </a>
                </div>
                <div id="navbar3" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"> <a href="DoctorHome.jsp">Home</a></li>
                        <li><a href="DoctorProfile.jsp">Profile</a></li>
                        <li><a href="ViewDoctors.jsp">Doctors</a></li>
                        <li><a href="DoctorAppointment.jsp">Appointments</a></li>
                        <li><a href="ViewReport.jsp">Patient Reports</a></li>
                        <li><a href="ViewQueries.jsp">Patient Queries</a></li>
                        <li><a href="PSymptoms.jsp"> Symptom Checker</a></li>
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
                    </ul>
                </div>
                <!--/.nav-collapse -->
            </div>
            <!--/.container-fluid -->
        </nav>
    </div>
</body>
<%!
    Connection con;
    Statement st;
    String name, id, status, status1;
    ResultSet rs;
%>
<%
    try {
        status = "Confirmed";
        status1 = "Cancelled";
        name = (String) session.getAttribute("name");
        id = (String) session.getAttribute("did");
        con = DB.getConnection();
        st = con.createStatement();
        rs = st.executeQuery("select * from appointment where did='" + id + "'");
        if (rs.next()) {
%>
<center><h2>Appointment List</h2><p style="color:red;font-size: 14px;">[You Can't Update Appointment Action Before 30 minutes of Appointment Time.]</p></center>
    <%
        String update = (String) session.getAttribute("update");
        String update1 = (String) session.getAttribute("update1");
        String update2 = (String) session.getAttribute("update2");
        if (update != null) {
            session.removeAttribute("update");
            out.println("<center><div class='alert alert-info'>" + update + "</div></center>");
        } else {
        }
        if (update1 != null) {
            session.removeAttribute("update1");
            out.println("<center><div class='alert alert-success'>" + update1 + "</div></center>");
        } else {
        }
        if (update2 != null) {
            session.removeAttribute("update2");
            out.println("<center><div class='alert alert-danger'>" + update2 + "</div></center>");
        } else {
        }
    %><hr>
<table id="myTable" class="table table-striped">
    <thead>
        <tr>
            <th>Patient ID</th><th>Patient Name</th><th>Appointment Date</th><th>Appointment Time</th><th>Status</th><th>Action</th>
        </tr>
    </thead>
    <tbody>
        <%
            Connection cons = DB.getConnection();
            Statement sts = cons.createStatement();
            ResultSet rss = sts.executeQuery("select * from appointment where did='" + id + "'");
            while (rss.next()) {
        %>
        <tr>
            <td><%=rss.getString("pid")%></td><td><%=rss.getString("pname")%></td><td><%=rss.getString("appoint_date")%></td><td><%=rss.getString("appoint_time")%></td><td><%=rss.getString("status")%></td>
            <td><a href="AlterAppointment?did=<%=rss.getString("did")%>&&pid=<%=rss.getString("pid")%>&&date=<%=rss.getString("appoint_date_time")%>&&status=<%=status%>">Confirm</a>&nbsp;||&nbsp;<a href="AlterAppointment?did=<%=rss.getString("did")%>&&pid=<%=rss.getString("pid")%>&&date=<%=rss.getString("appoint_date_time")%>&&status=<%=status1%>">Cancel</a></td>
        </tr>
        <%
                    }
                } else {
                    out.println("<center><h1>No patient have fixed appointment with you!!</h1><center>");
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>

</table>
</body>
</html>
