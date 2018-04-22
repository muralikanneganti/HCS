<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Smart Health Care System</title>

        <!-- css -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- template skin -->
        <link id="t-colors" href="css/default.css" rel="stylesheet">
    </head>

    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') repeat left top;">


        <div id="wrapper">

            <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">

                <div class="container navigation">

                    <div class="navbar-header page-scroll">

                        <a class="navbar-brand" href="index.jsp">
                            <a class="navbar-brand" href="index.jsp">
                                <img  src="images/logo.png" alt="" width="350" height="60" style="margin-left: -60px; margin-top: -7px;"/>                </a>
                        </a>

                        </a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="index.jsp">Home</a></li>
                            <li><a href="Services.jsp">Service</a></li>
                            <li><a href="ViewDoctors.jsp">Doctors</a></li>
                            <li><a href="About.jsp">About Us</a></li>
                            <li><a href="Contact.jsp">Contact Us</a></li>
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.container -->
            </nav>
            <%!String deptName, fees;
                int deptid;
            %>

            <%
                deptid = Integer.parseInt(request.getParameter("deptid"));
                // out.println(deptid);
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hcs", "root", "");
//                                                HttpSession s1=request.getSession();
//                                                int deptid=(Integer)s1.getAttribute("id");

                PreparedStatement ps = con.prepareStatement("select * from dept where deptid=" + deptid + "");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    deptid = rs.getInt("deptid");
                    deptName = rs.getString("deptName");
                    fees = rs.getString("fees");
                }

            %>
            <!-- Section: intro -->
            <section id="intro" class="intro">
                <div class="intro-content">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                    <img src="images/img-1.png" class="img img-responsive" alt="" />
                                </div>
                            </div>
                            <div class="col-lg-6">


                                <div class="panel-body">
                                    <center><h3>Update Department</h3></center><hr>
                                        <%                                                String msgs = request.getParameter("msg");
                                            if (msgs != null) {

                                                out.println("<center><h3 style='color:black;'>" + msgs + "</h3></center>");
                                            }

                                        %>
                                    <div class="col-lg-6">
                                        <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                            <img src="images/dept1.png" style="width: 180px;height: 190px;margin-bottom: 9px;" class="img img-responsive" alt="" />
                                        </div>
                                    </div>
                                    <form action="EditDept" method="post" role="form" class="contactForm lead"><br>
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Department Name</label>
                                                    <input type="hidden" name="deptid" value="<%=deptid%>">
                                                    <input required="" type="text" title="Enter Department Name" name="deptName" value="<%=deptName%>"  class="form-control input-md">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>

                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Doctor's Fees</label>
                                                    <input required="" type="text" title="Enter Fees" name="fees" value="<%=fees%>"  class="form-control input-md">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>

                                        </div>
                                        <input type="submit" value="Submit" class="btn btn-skin btn-block btn-lg">
                                    </form>
                                    <center><a href="ViewDept.jsp">View Departments</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </section>

</body>

</html>
