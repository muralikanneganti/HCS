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
        <title>Insert title here</title>
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
            background:url('images/pp2.png') no-repeat center center;
            background-size:cover;

            /* Workaround for some mobile browsers */
            min-height:100%;
        }
        html{
            /* This image will be displayed fullscreen */
            background:url('images/bg1.jpg') no-repeat center center;
            /* Ensure the html element always takes up the full height of the browser window */
            height:100%;
            /* The Magic */
            background-size:cover;
        }
        #navbar3 li a:hover
        {
            color:lightseagreen;
        }
    </style>
</head>
<body style="background-image: url(images/bg1.jpg);">
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
                    <a class="navbar-brand" href="AdminHome.jsp"><img src="images/log.png" style="height: 85px;margin-top: -15px;" alt="Dispute Bills"></a>
                </div>
                <div id="navbar3" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="AdminHome.jsp">Home</a></li>
                        <li><a href="ViewAPatients.jsp">Patients</a></li>
                        <li><a href="DoctorsList.jsp">Doctors</a></li>
                        <li><a href="queries.jsp">View Queries</a></li>
                        <li><a href="ViewFeedback.jsp">Feedback</a></li>
                        <li><a href="ViewAppointment.jsp">Appointments</a></li>

                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">ADD <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <!--                                        <li><a href="AddPatient.jsp">Add Patient</a></li>
                                                                        <li><a href="AddDoctor.jsp">Add Doctor</a></li>-->
                                <li><a href="AddDept.jsp">Add Department</a></li>
                                <li><a href="AddDCost.jsp">Add Disease Cost</a></li>
                            </ul>
                        </li>
                        <li><a href="Logout.jsp">Logout</a></li>
                    </ul>
                </div>
                <!--/.nav-collapse -->
            </div>
            <!--/.container-fluid -->
        </nav>
    </div>
    <%!
        Connection con;
        PreparedStatement ps;
        Statement st;
        ResultSet rs;
        int deptid;
        String deptName, fees;
    %>

<center><h2>Doctor Department's</h2></center>
    <%
        String del = (String) session.getAttribute("del");
        if (del != null) {
            session.removeAttribute("del");
            out.println("<center><h4 class='alert alert-success'>Department has been deleted successfully..</h4></center>");
        } else {
        }
    %><hr>
<table id="myTable" class="table table-striped" >
    <thead>
        <tr>
            <th>ID</th><th>Department-Name</th><th>Fees</th><th>Action</th>
        </tr>
    </thead>
    <tbody>
        <%
            try {
                con = DB.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("select * from dept");
                while (rs.next()) {
                    deptid = rs.getInt("deptid");
                    deptName = rs.getString("deptName");
                    fees = rs.getString("fees");

        %>
        <tr>
            <td><%=deptid%></td><td><%=deptName%></td><td><%=fees%></td>
            <td class="hidden-xs"><button class="btn btn-sm btn-primary" style="background-color: white;"><a href="DelDept?id=<%=rs.getInt(1)%>">Delete</a></button></td>


        </tr>
        <%
                }
                //        HttpSession s1=request.getSession();
                //       s1.setAttribute("id", deptid);

            } catch (Exception e) {
                out.println(e);
            }
        %>
    </tbody>
</table>
<center>
    <!--    <a href="AdminHome.jsp">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Logout.jsp">Logout</a>-->
</center>
</body>
</html>