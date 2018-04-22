<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Smart Health Care System</title>
    </head>

    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg'); background-repeat: repeat;">
        <%
            String pid = (String) session.getAttribute("pname");
            String did = (String) session.getAttribute("dname");
            if (pid != null) {
        %>
        <div id="wrapper">
            <jsp:include page="PHeader.jsp"></jsp:include>

            <!-- Section: intro -->
            <section id="intro" class="intro">
                <div class="intro-content">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                    <img src="images/services2.png" class="img img-responsive" alt="" />
                                </div>
                            </div>
                            <div class="col-lg-6">

                                <div class="panel-body" style="border: 1px solid lightseagreen">
                                    <center><img src="images/banner.jpg" style="width: 100%;"></center><hr>
                                    <center><h6>Hospital Services</h6></center>
                                    <p style="font-size: 16px;">This Hospital is active and consulting medical staff and care providers offer a broad base of primary and specialty care and services including:</p>
                                    <ul style="list-style-type: circle;color: black;font-size: 16px;">
                                        <li><b>Family and internal medicine</b></li>
                                        <li><b>Women's health.</b></li>
                                        <li><b>Surgical services.</b></li>
                                        <li><b>24 hour Emergency Room.</b></li>
                                        <li><b>State-of-the-art diagnostic and lab services.</b></li>
                                        <li><b>clinics.</b></li>
                                        <li><b>Urology clinic.</b></li>
                                        <li><b>Swing bed program.</b></li>
                                        <li><b>Eye (cataract) surgery.</b></li>
                                        <li><b>Chemotherapy.</b></li>
                                        <li><b>Gynecology.</b></li>
                                    </ul>
                                </div>

                            </div>
                        </div></div>
                </div>
                </section>
        </div> 

    
<%
            }
            else if(did!=null){
                %>
                <div id="wrapper">
            <jsp:include page="DHeader.jsp"></jsp:include>

            <!-- Section: intro -->
            <section id="intro" class="intro">
                <div class="intro-content">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                    <img src="images/services2.png" class="img img-responsive" alt="" />
                                </div>
                            </div>
                            <div class="col-lg-6">

                                <div class="panel-body" style="border: 1px solid lightseagreen">
                                    <center><img src="images/banner.jpg" style="width: 100%;"></center><hr>
                                    <center><h6>Hospital Services</h6></center>
                                    <p style="font-size: 16px;">This Hospital is active and consulting medical staff and care providers offer a broad base of primary and specialty care and services including:</p>
                                    <ul style="list-style-type: circle;color: black;font-size: 16px;">
                                        <li><b>Family and internal medicine</b></li>
                                        <li><b>Women's health.</b></li>
                                        <li><b>Surgical services.</b></li>
                                        <li><b>24 hour Emergency Room.</b></li>
                                        <li><b>State-of-the-art diagnostic and lab services.</b></li>
                                        <li><b>clinics.</b></li>
                                        <li><b>Urology clinic.</b></li>
                                        <li><b>Swing bed program.</b></li>
                                        <li><b>Eye (cataract) surgery.</b></li>
                                        <li><b>Chemotherapy.</b></li>
                                        <li><b>Gynecology.</b></li>
                                    </ul>
                                </div>

                            </div>
                        </div></div>
                </div>
                </section>
        </div> 

<%
            }
            else
            {
                %>
                <div id="wrapper">
            <jsp:include page="Eheader.jsp"></jsp:include>

            <!-- Section: intro -->
            <section id="intro" class="intro">
                <div class="intro-content">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                    <img src="images/services2.png" class="img img-responsive" alt="" />
                                </div>
                            </div>
                            <div class="col-lg-6">

                                <div class="panel-body" style="border: 1px solid lightseagreen">
                                    <center><img src="images/banner.jpg" style="width: 100%;"></center><hr>
                                    <center><h6>Hospital Services</h6></center>
                                    <p style="font-size: 16px;">This Hospital is active and consulting medical staff and care providers offer a broad base of primary and specialty care and services including:</p>
                                    <ul style="list-style-type: circle;color: black;font-size: 16px;">
                                        <li><b>Family and internal medicine</b></li>
                                        <li><b>Women's health.</b></li>
                                        <li><b>Surgical services.</b></li>
                                        <li><b>24 hour Emergency Room.</b></li>
                                        <li><b>State-of-the-art diagnostic and lab services.</b></li>
                                        <li><b>clinics.</b></li>
                                        <li><b>Urology clinic.</b></li>
                                        <li><b>Swing bed program.</b></li>
                                        <li><b>Eye (cataract) surgery.</b></li>
                                        <li><b>Chemotherapy.</b></li>
                                        <li><b>Gynecology.</b></li>
                                    </ul>
                                </div>

                            </div>
                        </div></div>
                </div>
                </section>
        </div> 
<%
            }
        %>
</body>

</html>
