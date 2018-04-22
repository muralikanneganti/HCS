<%@page import="com.java.DB"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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

    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') repeat left top;">
        <%
            String pid = (String) session.getAttribute("pid");
            if (pid != null) {
        %>

        <%!
            Connection con, con1, con2;
            Statement st, st1, st2, st3, st4;
            ResultSet rs, rs1, rs2;
            String dname, bill, pname, name, disease, id;
        %>

        <div id="wrapper">

            <jsp:include page="PHeader.jsp"></jsp:include>
                <!-- Section: intro -->
                <section id="intro" class="intro" style="margin-top: -100px;">
                    <div class="intro-content">
                        <div class="container">
                            <div class="row">

                                <div class="col-lg-6" style="">
                                    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                        <img src="images/img-1.png" class="img img-responsive" alt="" />
                                    </div><br>
                                </div>
                            <%
                                Connection c = DB.getConnection();
                                Statement s = c.createStatement();
                                ResultSet rsx = s.executeQuery("select * from appointment where pid='" + pid + "' and status='Confirmed' order by id desc limit 1");
                                if (rsx.next()) {
                                    String did = rsx.getString("did");
                                    Connection cs = DB.getConnection();
                                    Statement ss = cs.createStatement();
                                    ResultSet rsxs = ss.executeQuery("select * from patient_bill where pid='" + pid + "' and flag=1 order by id desc limit 1");
                                    if (!rsxs.next()) {
                            %>

                            <div class="col-lg-6">

                                <div class="panel-body" style="">
                                    <center><h3>Pay Your Bill</h3></center><hr>

                                    <form action="BillProcess.jsp" method="post" role="form" class="contactForm lead">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <%  id = (String) session.getAttribute("pid");
                                                        //out.println(id);
                                                        name = (String) session.getAttribute("pname");
//                                                        con = DB.getConnection();
//                                                        st1 = con.createStatement();
//                                                        rs1 = st1.executeQuery("select Disease from Table_Patient where Pid='" + id + "'");
//                                                        if (rs1.next()) {
//                                                            disease = rs1.getString(1);
//                                                        }
//                                                        con2 = DB.getConnection();
//                                                        st2 = con2.createStatement();
//                                                        rs2 = st2.executeQuery("select Cost from DiseaseCost where Disease_Name='" + disease + "'");
//                                                        if (rs2.next()) {
//                                                            bill = rs2.getString(1);
//                                                        }
                                                        try {
                                                            con = DB.getConnection();
                                                            st = con.createStatement();
                                                            rs = st.executeQuery("select * from appointment where pid='" + id + "'");
                                                            if (rs.next()) {
                                                    %>
                                                    <label>Patient ID</label>
                                                    <input type='text' name='pid' readonly=""  class='form-control input-md' value="<%=id%>">
                                                    <div class='validation'></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class='form-group'>
                                                    <label>Patient Name</label>
                                                    <input type='text' name='pname' readonly=""  class='form-control input-md' value=" <%=name%> ">
                                                    <div class='validation'></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class='form-group'>
                                                    <label>Consultant Doctor Name</label>
                                                    <input type='text' name='dname' readonly=""  class='form-control input-md' value=" <%=rs.getString("Dname")%> ">
                                                    <div class='validation'></div>
                                                </div>
                                            </div>
                                            <input type='hidden' name='did'  class='form-control input-md' value=" <%=did%> ">
                                            <!--                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                                                            <div class='form-group'>
                                                                                                <label>Disease Name</label>
                                                                                                <input type='text' name='disease' readonly=""  class='form-control input-md' value=" <%=disease%> ">
                                                                                                <div class='validation'></div>
                                                                                            </div>
                                                                                        </div>-->
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class='form-group'>
                                                    <label>Patient Bill</label>
                                                    <input type='text' name='amount' readonly=""  class='form-control input-md' value=" <%=rs.getString("fees")%> ">
                                                    <div class='validation'></div>
                                                </div>
                                            </div>

                                            <input type="submit" value="Pay Bill" class="btn btn-skin btn-block btn-lg">
                                            <%
                                                    } else {

                                                        out.print("<center><h2>You have Not Fixed any Appointment with any Doctor Therefore no bill is generated.</h2></center>");
                                                    }

                                                } catch (Exception e) {
                                                    out.println(e);
                                                }
                                            %>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <%
                                    } else {
                                        out.println("<center><h2>You have paid your last bill, thank you!!!</h2><br><a href='LastBill.jsp'>View your previous bills</a></center>");
                                    }
                                } else {
                                    out.println("<center><h2>Currently no bill have to pay.</h2></center>");
                                }
                            %>
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

</html>
