<%@page import="com.java.DB"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.commons.lang.RandomStringUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
    </head>

    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') no-repeat whitesmoke;">
        <%!
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat();
            String s = sdf.format(date);
        %>
        <div id="wrapper">
            <jsp:include page="Eheader.jsp"></jsp:include>
                <!-- Section: intro -->
                <section id="intro" class="intro" style="margin-top: -110px;width: 100%">
                    <div class="intro-content">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6" style="margin-top: -90px;">
                                    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                        <img src="images/img-1.png" class="img img-responsive" alt="" />
                                    </div><br><br><br><br><br><br>
                                </div>
                                <div class="col-lg-6">

                                    <div class="panel-body" style="margin-top: -80px;width: 100%">
                                        <center><h3>Doctor Registration Form</h3></center><hr>

                                        <form action="DoctorReg.jsp" method="post" role="form" class="contactForm lead">
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                    <div class="form-group">
                                                        <label>Doctor ID</label>
                                                        <input type="text" readonly="" name="did" id="first_name" class="form-control input-md"   title="Patient ID" value="<%
                                                            Random random = new Random();
                                                            Set<Integer> randomNumbers = new HashSet<Integer>();
                                                            while (randomNumbers.size() < 1) {
                                                                randomNumbers.add(new Integer(random.nextInt(999) + 100));
                                                            }
                                                            for (Integer randomNumber : randomNumbers) {
                                                                out.println("DID-" + randomNumber);
                                                            }
                                                           %>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Doctor Name</label>
                                                    <input type="text" pattern="[a-zA-Z][a-zA-Z ]+[a-zA-Z]$" placeholder="Name" name="name"  id="last_name" class="form-control input-md" required="" title="Doctor name can not be blank and should not contain any digit.">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="email"  placeholder="me@example.com" name="email" id="txtEmail" class="form-control input-md" required="" title="Email can not be blank and should contain @ character.">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Password</label>
                                                    <input type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" placeholder="Password" name="pass" class="form-control input-md" required="" title="Password should contain at least 1 Uppercase ,1 Lowercase and digit and minimum of 6 character.">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Doctor Gender</label>
                                                    <select name="gender" class="form-control">
                                                        <option selected="" disabled="">Select Gender</option>
                                                        <option>Male</option>
                                                        <option>Female</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Doctor DOB</label>
                                                    <input type="date" name="dob" id="dob" onchange="calculateAge();" class="form-control input-md" required="">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Doctor Age</label>
                                                    <input type="text" readonly="" placeholder="age" name="age" id="age" class="form-control input-md" required="">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Select Degree</label>
                                                    <select name="degree" class="form-control">
                                                        <option selected="" disabled="" value="">Select Degree</option>
                                                        <option>M.B.B.S</option>
                                                        <option>B.D.S</option>
                                                        <option>B.P.T</option>
                                                        <option>B.Sc Nursing</option>
                                                        <option>B.H.M.S</option>
                                                        <option>B.A.M.S</option>
                                                        <option>RADIOGRAPHY</option>
                                                        <option>D.D.S</option>
                                                        <option>M.D</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Select Department</label>
                                                    <select name="department" id="department" onclick="checkUnit(this.value);" required="" class="form-control">
                                                        <option selected="" disabled="" value="">Select Department</option>
                                                        <%
                                                            try {
                                                                String query = "select * from dept";
                                                                Connection con = DB.getConnection();
                                                                Statement st = con.createStatement();
                                                                ResultSet rs = st.executeQuery(query);
                                                                while (rs.next()) {
                                                        %>
                                                        <option value="<%=rs.getString("deptName")%>"><%=rs.getString("deptName")%></option>
                                                        <%
                                                                }

                                                            } catch (Exception e) {
                                                                out.println(e);
                                                            }
                                                        %>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>

                                            <p id="box1"></p>

                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Contact No.</label>
                                                    <input type="number" required="" placeholder="Contact" name="phone" id="first_name" class="form-control input-md" title="Enter Contact No.">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <textarea title="Enter your Address" placeholder="Enter your Address" class="form-control input-md" required rows="3" cols="20" name="address"></textarea>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                        </div>
                                                    <input type="submit" value="Submit" id="btnValidate" class="btn btn-skin btn-block btn-lg">
                                    </form>
                                    <center>
                                        <a href="ForgotPassword.jsp">Forgot Password?</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="DoctorLogin.jsp">Login Here</a>
                                    </center><hr>
                                </div>

                            </div></div></div>

                </div>


            </section>
        </div>
        <script>

            function checkUnit(str)
            {
                if (str === "")
                {
                    document.getElementById("box1").innerHTML = "";
                    return;
                } else
                {
                    if (window.XMLHttpRequest)
                    {
                        // code for IE7+, Firefox, Chrome, Opera, Safari
                        xmlhttp = new XMLHttpRequest();
                    } else
                    {
                        // code for IE6, IE5
                        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    xmlhttp.onreadystatechange = function()
                    {
                        if (this.readyState === 4 && this.status === 200)
                        {
                            document.getElementById("box1").innerHTML = this.responseText;
                        }
                    };
                    xmlhttp.open("Post", "DoctorDetails.jsp?message=" + str, true);
                    xmlhttp.send();
                }
            }
        </script>
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
