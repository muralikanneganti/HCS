<%--
    Document   : login.jsp
    Created on : 12 Feb, 2018, 5:03:10 PM
    Author     : HOME
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Smart Health Care System</title>
        <!-- css -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="css/cubeportfolio.min.css">
        <link href="css/nivo-lightbox.css" rel="stylesheet" />
        <link href="css/default.css" rel="stylesheet" type="text/css" />
        <link href="css/owl.carousel.css" rel="stylesheet" media="screen" />
        <link href="css/owl.theme.css" rel="stylesheet" media="screen" />
        <link href="css/animate.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- boxed bg -->
        <link id="bodybg" href="css/bg1.css" rel="stylesheet" type="text/css" />
        <!-- template skin -->
    </head>

    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') repeat left top;">


        <div id="wrapper">

            <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">

                <div class="top-area">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6 col-md-6" style="margin-left: -60px;">
                                <p class="bold text-left" ><h6>Smart Health Care System</h6></p>
                            </div>
                            <div class="col-sm-6 col-md-6">
                                <div style="float: right; padding: 5px; margin: 5px;margin-top:8px;">
                                    <form action="Search.jsp" method="post"><div style="float: left"><input required="" class="form-control"  placeholder="Search By Patient ID" type="text" name="search"></div>
                                        <div style="margin-right:-18px;margin-left: 10px; display: inline;"><input type="submit" value="Search" class="btn btn-info"></div></div></form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container navigation">

                    <div class="navbar-header page-scroll">

                        <a class="navbar-brand" href="index.jsp">
                            <img  src="images/logo.png" alt="" width="350" height="60" style="margin-left: -60px; margin-top: -10px;"/>
                        </a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse navbar-right navbar-main-collapse" style="margin-top:-50px;">

                        <ul class="nav navbar-nav" style="margin-left:350px;">
                            <li class="active"><a href="index.jsp">Home</a></li>
                            <li><a href="Services.jsp">Service</a></li>
                            <li><a href="ViewDoctors.jsp">Doctors</a></li>
                            <li><a href="Contact.jsp">Contact Us</a></li>
                            <li><a href="About.jsp">About Us</a></li>
                            <li style='margin-top: 12px;background-color: white;'>
                                <div class="dropdown">
                                    <button style='background-color:white;color:black;' class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
                                        Sign Up  <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a href="PatientForm.jsp">Patient Sign Up</a></li>
                                        <li><a href="DoctorForm.jsp">Doctor Sign Up</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li style="margin-left: 15px; margin-top: 12px;"><div class="dropdown">
                                    <button style='background-color:white;color:black;' class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Login
                                        <span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                        <li><a href="PatientLogin.jsp">Patient Login</a></li>
                                        <li><a href="DoctorLogin.jsp">Doctor Login</a></li>
                                        <li><a href="AdminForm.jsp">Administrator Login</a></li>
                                    </ul>
                                </div></li>
                        </ul>

                    </div>
                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.container -->
            </nav>
            <!-- Section: intro -->
            <section id="intro" class="intro">
                <div class="intro-content">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s" style="margin-top: -20px;">
                                    <img src="images/img-1.png" class="img img-responsive" alt="" style="margin-top: 10px; margin-left: 50px;"/>
                                </div>
                            </div><br><br>
                            <div class="col-lg-6">

                                <div class="panel-body" style="margin-top: -20px;">
                                    <center><h3>Administration Login</h3></center><hr>
                                    <div class="col-lg-6">
                                        <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                            <img src="images/adminicon.png" class="img img-responsive" alt="" />
                                        </div>
                                    </div>
                                    <form action="AdminDao" method="post" role="form" class="contactForm lead">
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Administrator Name</label>
                                                    <input type="text" name="Admin_name" id="first_name" class="form-control input-md" required="">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Password</label>
                                                    <input type="password" name="Password" id="last_name" class="form-control input-md" required="">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <input type="submit" value="Submit" class="btn btn-skin btn-block btn-lg">
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </section>
</body>
</html>
