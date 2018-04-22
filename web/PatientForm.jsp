<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Random"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.commons.lang.RandomStringUtils"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Smart Health Care System</title>
        <!-- css -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- template skin -->
        <link id="t-colors" href="css/default.css" rel="stylesheet">

        <script type="text/javascript">
            function check() {
                if ((frm.phone.value).length != 10)
                {
                    alert("Phone Number should be 10 digit only.");
                    return false;
                }
            }
        </script>
    </head>

    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') no-repeat;">
        <%!
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat();
            String s = sdf.format(date);
        %>

        <div id="wrapper">

            <jsp:include page="Eheader.jsp"></jsp:include>
                <!-- Section: intro -->
                <section id="intro" class="intro" style="margin-top: -100px;width: 100%">
                    <div class="intro-content">
                        <div class="container" >
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                        <img src="images/img-1.png" class="img img-responsive" alt=""  style="margin-top: 0px;"/>
                                    </div>
                                </div><br><br><br><br>
                                <div class="col-lg-6" style="margin-top: -60px;">

                                    <div class="panel-body">
                                        <center><h4>Patient Registration Form</h4></center><hr>

                                        <form action="PatientRegistration.jsp" method="post" name="frm" role="form" class="contactForm lead">
                                            <div class="row" style="margin-top: 0px;">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                    <div class="form-group">
                                                        <label>Patient ID</label>
                                                        <input type="text" readonly="" name="pid" id="first_name" class="form-control input-md"   title="Patient ID" value="<%
                                                            Random random = new Random();
                                                            Set<Integer> randomNumbers = new HashSet<Integer>();
                                                            while (randomNumbers.size() < 1) {
                                                                randomNumbers.add(new Integer(random.nextInt(999) + 10));
                                                            }
                                                            for (Integer randomNumber : randomNumbers) {
                                                                out.println("PID-" + randomNumber);
                                                            }
                                                           %>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Patient Name</label>
                                                    <input type="text" placeholder="Name" pattern="[a-zA-Z][a-zA-Z ]+[a-zA-Z]$" name="name" id="last_name" class="form-control input-md" required="" title="Patient name can not be blank and should not contain any digit.">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="email" name="email" placeholder="me@example.com" id="txtEmail" class="form-control input-md" required="" title="Email can not be blank and should contain @ character.">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Password</label>
                                                    <input type="password" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" name="pass" class="form-control input-md" required="" title="Password should contain at least 1 Uppercase ,1 Lowercase and digit and minimum of 6 character.">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Patient Gender</label>
                                                    <select name="gender" class="form-control" required="">
                                                        <option selected="" value="" disabled="">Select Gender</option>
                                                        <option value="Male">Male</option>
                                                        <option value="Female">Female</option>
                                                        <option value="Other">Other</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Patient DOB</label>
                                                    <input type="date" name="dob" id="dob" onchange="calculateAge();" class="form-control input-md" required="">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Patient Age</label>
                                                    <input type="text" readonly="" placeholder="age" name="age" id="age" class="form-control input-md" required="">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Contact No.</label>
                                                    <input type="number" placeholder="Contact" name="phone" id="first_name" class="form-control input-md" required="" title="Phone no. should not contain any alaphabets.">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Marital Status</label>
                                                    <select name="status" class="form-control" required="">
                                                        <option selected="" value="" disabled="">Select Status</option>
                                                        <option>Married</option>
                                                        <option>Divorced</option>
                                                        <option>Single</option>
                                                        <option>Widow</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <textarea title="Enter your Address" placeholder="Address" class="form-control" required rows="3" cols="20" name="address"></textarea>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <!--                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                                                            <div class="form-group">
                                                                                                <label>Select Diagnosis</label>
                                                                                                <select name="disease" class="form-control" required="">
                                                                                                    <option selected="" value="" disabled="">Select Diagnosis</option>
                                                                                                    <option value="Normal Diseases">Normal Diseases</option>
                                                                                                    <option value="Cancer">Cancer</option>
                                                                                                    <option value="Celiac Disease">Celiac Disease</option>
                                                                                                    <option value="Heart Disease">Heart Disease</option>
                                                                                                    <option value="Crohn's & Colitis">Crohn's & Colitis</option>
                                                                                                    <option value="Infectious Diseases">Infectious Diseases</option>
                                                                                                    <option value="Liver Disease">Liver Disease</option>
                                                                                                    <option value="Big Diseases">Big Diseases</option>
                                                                                                    <option value="Private Diseases">Private Diseases</option>
                                                                                                    <option value="Ear, Nose and Throat Diseases">ENT Diseases</option>
                                                                                                    <option value="Other Diseases">Other Diseases</option>
                                                                                                </select>
                                                                                                <div class="validation"></div>
                                                                                            </div>
                                                                                        </div>-->
                                            <!--                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                                                            <div class="form-group">
                                                                                                <label>Service Type</label>
                                                                                                <select name="service" class="form-control" required="">
                                                                                                    <option selected="" value="" disabled="">Service Type</option>
                                                                                                    <option value="In-Patient">In-Patient</option>
                                                                                                    <option value="Out-Patient">Out-Patient</option>
                                                                                                </select>
                                                                                                <div class="validation"></div>
                                                                                            </div>
                                                                                        </div>-->

                                        </div>

                                        <input type="submit" value="Submit" id="btnValidate" class="btn btn-skin btn-block btn-lg" onclick="return check();">
                                    </form>
                                    <center>
                                        <a href="ForgotPass.jsp">Forgot Password?</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="PatientLogin.jsp">Login Here</a>
                                    </center><hr>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>


            </section></div>
        <script>
            function calculateAge() {
                var today = new Date();
                var dateString = document.getElementById('dob').value;
                //alert(dateString);
                var birthDate = new Date(dateString);
                var age = today.getFullYear() - birthDate.getFullYear();
                var m = today.getMonth() - birthDate.getMonth();
                if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
                    age--;
                }
                document.getElementById('age').value = age;
            }
        </script>
    </body>
    <script>
        $(document).ready(function(e) {
    $('#btnValidate').click(function() {
        var sEmail = $('#txtEmail').val();
        if ($.trim(sEmail).length === 0) {
            alert('Please enter valid email address');
            e.preventDefault();
        }
        if (validateEmail(sEmail)) {
            //alert('Email is valid');
        }
        else {
            alert('Invalid Email Address');
            e.preventDefault();
        }
    });
});

function validateEmail(sEmail) {
    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if (filter.test(sEmail)) {
        return true;
    }
    else {
        return false;
    }
}
    </script>
</html>
