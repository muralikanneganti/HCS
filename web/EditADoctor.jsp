<%@page import="com.java.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.commons.lang.RandomStringUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- css -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- template skin -->
        <link id="t-colors" href="css/default.css" rel="stylesheet">
        <title>Smart Health Care System</title>
    </head>

    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') repeat left top;">
        <%
            String name = (String) session.getAttribute("name");
            if (name != null) {
        %>

        <%!
            Connection con;
            PreparedStatement ps;
            ResultSet rs;
            Statement st;
            String dname, email, gender, pass, age, contact, dob, dept, did, fees, address, degree;
        %>
        <%
            try {
                String id = request.getParameter("id");
                //out.print(id);
                con = DB.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("select * from Table_Doctor where Did='" + id + "'");
                if (rs.next()) {
                    did = rs.getString("Did");
                    dname = rs.getString("Dname");
                    email = rs.getString("Email");
                    pass = rs.getString("Pass");
                    gender = rs.getString("Gender");
                    dob = rs.getString("dob");
                    degree = rs.getString("Degree");
                    dept = rs.getString("Department");
                    fees = rs.getString("Fees");
                    contact = rs.getString("Contact");
                    address = rs.getString("Address");
                    age = rs.getString("age");
                }
        %>

        <div id="wrapper">

            <jsp:include page="AHeader.jsp"></jsp:include>
                <!-- Section: intro -->
                <section id="intro" class="intro" style="margin-top: -100px;">
                    <div class="intro-content">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                        <img src="images/img-1.png" class="img img-responsive" alt="" />
                                    </div><br>
                                </div>
                                <div class="col-lg-6">

                                    <div class="panel-body" style="">
                                        <center><h3>Doctor Update Form</h3></center><hr>
                                        <form action="EditDProcess.jsp" method="post" role="form" class="contactForm lead">
                                            <div class="row">
                                                <div class="col-xs-6 col-sm-6 col-md-6">
                                                    <div class="form-group">
                                                        <label>Doctor ID</label>
                                                        <input type="text"  readonly="" name="did" id="first_name" class="form-control input-md"   title="Docor ID" value="<%=did%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Doctor Name</label>
                                                    <input type="text" required="" name="name" id="last_name" class="form-control input-md" value="<%=dname%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="text" required="" name="email" id="last_name" class="form-control input-md" value="<%=email%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Password</label>
                                                    <input type="password" name="pass" required="" id="last_name" class="form-control input-md" value="<%=pass%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Doctor Gender</label>
                                                    <select name="gender" required="" class="form-control">
                                                        <option selected="" value="<%=gender%>"><%=gender%></option>
                                                        <option value="Male">Male</option>
                                                        <option value="Female">Female</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Doctor DOB</label>
                                                    <input type="date" name="dob" value="<%=dob%>" id="dob" onchange="calculateAge();" class="form-control input-md" required="">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Doctor Age</label>
                                                    <input type="text" readonly="" value="<%=age%>" name="age" id="age" class="form-control input-md" required="">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Select Degree</label>
                                                    <select name="degree" class="form-control">
                                                        <option selected="" value="<%=degree%>"><%=degree%></option>
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
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Select Department</label>
                                                    <select class="form-control input-md" required="" name="Department" id="Department">
                                                        <option selected="" value="<%=dept%>"><%=dept%></option>
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
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Fees</label>
                                                    <input type="text" required="" name="fees" id="last_name" class="form-control input-md" value="<%=fees%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Contact No.</label>
                                                    <input type="text" name="phone" required="" id="first_name" class="form-control input-md" title="Enter Contact No." value="<%=contact%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>

                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <textarea required rows="2" class="form-control input-md" cols="20" name="address"><%=address%></textarea>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <input type="submit" value="Update" class="btn btn-skin btn-block btn-lg">
                                            </form>
                                        </div>
                                </div>

                                <%
                                    } catch (Exception e) {
                                        out.println(e);
                                    }
                                %>

                            </div>

                        </div>
                    </div>
                </div>

            </section>
        </div>
        <%
            } else {
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
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
</html>
