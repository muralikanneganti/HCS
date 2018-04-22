<%@page import="com.java.DB"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="//ajax.googleapis.com/ajax/tdbs/jquery/1.9.1/jquery.min.js"></script>
        <!-- Latest compiled and minified CSS -->
    <tdnk rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- jQuery tdbrary -->
        <script src="https://ajax.googleapis.com/ajax/tdbs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            table
            {
                border:2px solid green;

            }
            tr
            {
                padding:5px;
            }
            tr:hover
            {

            }
        </style>
    </head>
    <body>
        <table class="table table-bordered">


            <%

                String sym1 = request.getParameter("sym1");
                String sym2 = request.getParameter("sym2");
                String sym3 = request.getParameter("sym3");
                String sym4 = request.getParameter("sym4");

                String sym5 = request.getParameter("sym5");
                String sym6 = request.getParameter("sym6");
                String sym7 = request.getParameter("sym7");
                String sym8 = request.getParameter("sym8");
                String sym9 = request.getParameter("sym9");
                String sym10 = request.getParameter("sym10");
                String age = request.getParameter("age");
                String gender = request.getParameter("gender");
                //out.println(age + " " + gender);
                //System.out.println(sym1 + " " + sym2 + " " + sym3 + " " + sym4);
                if (sym1 != null) {
                    //out.println(age);
                    Connection con = DB.getConnection();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT distinct disease FROM `symptoms` WHERE locate(symptom,'" + sym1 + "')>0 or locate(symptom,'" + sym2 + "')>0 or locate(symptom,'" + sym3 + "')>0 or locate(symptom,'" + sym4 + "')>0 or locate(symptom,'" + sym5 + "')>0 or locate(symptom,'" + sym6 + "')>0 or locate(symptom,'" + sym7 + "')>0 or locate(symptom,'" + sym8 + "')>0 or locate(symptom,'" + sym9 + "')>0 or locate(symptom,'" + sym10 + "')>0 and gender='" + gender + "' and age_group='" + age + "'");
                    int count = 0;
                    while (rs.next()) {
                        count = count + 1;
            %>
            <tr>
                <td><%=count%></td><td><%=rs.getString(1)%></td>
            </tr>
            <%
                }
            %>
            <%
                String pid = (String) session.getAttribute("pid");
                if (pid != null) {
            %>
            <tr>

                <td></td>
<!--                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="DiagnosisList.jsp?sym1=<%=sym1%>&&sym2=<%=sym2%>&&sym3=<%=sym3%>&&sym4=<%=sym4%>&&sym5=<%=sym5%>&&sym6=<%=sym6%>&&sym7=<%=sym7%>&&sym8=<%=sym8%>&&sym9=<%=sym9%>&&sym10=<%=sym10%>&&age=<%=age%>&&gender=<%=gender%>">View All Diagnosis</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="BookApointment.jsp">Book Appointment</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="AskDoctor.jsp">Ask Doctor</a></td>-->
                <td><a href="BookApointment.jsp">Book Appointment</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="AskDoctor.jsp">Ask Doctor</a></td>
            </tr>
            <%
            } else {

            %>
<!--            <td></td><td><a href="DiagnosisList.jsp?sym1=<%=sym1%>&&sym2=<%=sym2%>&&sym3=<%=sym3%>&&sym4=<%=sym4%>&&sym5=<%=sym5%>&&sym6=<%=sym6%>&&sym7=<%=sym7%>&&sym8=<%=sym8%>&&sym9=<%=sym9%>&&sym10=<%=sym10%>&&age=<%=age%>&&gender=<%=gender%>">View All Diagnosis</a></td>-->
            <%
                }
            %>
            <%
                if (sym1 != null) {
            %>
            <!--<tr>-->
                <!--<td></td><td><a href="view_all_disease.jsp?sym1=<%=sym1%>&'sym2=<%=sym2%>&'sym3=<%=sym3%>&'sym4=<%=sym4%>&'sym5='<%=sym5%>&'sym6=<%=sym6%>&'sym7=<%=sym7%>&'sym8=<%=sym8%>&'sym9='<%=sym9%>&'sym10=<%=sym10%>">View More</a></td>-->
            <!--<td></td>-->
            <!--</tr>-->
            <%
                    } else {

                    }
                } else {
                    out.println("No Data Found.");
                }
            %>
        </table>
    </body>
</html>
