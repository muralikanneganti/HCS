<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Smart Health Care System</title>

        <!-- css -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet">
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
                            <li><a href="DoctorsList.jsp">Doctors</a></li>
                            <li><a href="ViewAPatients.jsp">Patient</a></li>
                            <li><a href="About.jsp">About Us</a></li>


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
                                <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                    <img src="images/hospital.jpg" class="img img-responsive" alt="" />
                                </div>
                            </div>
                            <div class="col-lg-6">

                                <div class="panel-body" style="">
                                    <center><img src="images/doctors.jpg" width="510px"></center><hr>
                                    <center><h1>Doctor Added Successfully...</h1><hr>
                                        <a href="AdminHome.jsp">Admin's Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Logout.jsp">Logout</a>
                                    </center>

                                </div>


                            </div></div></div>

                </div>
        </div>

    </section>

</body>

</html>

