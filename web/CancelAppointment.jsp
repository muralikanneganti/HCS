<%@page import="com.java.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Insert title here</title>
    </head>
    <body>
        <%!
            Connection conn;
            Statement st;
            ResultSet rs;
        %>

        <%
            try {

                // String msg="";
                String pid = request.getParameter("pid");
                String did = request.getParameter("did");
                String date = request.getParameter("date");
                //out.println(pid + " " + " " + did + " " + date);
                conn = DB.getConnection();
                st = conn.createStatement();
                int i = st.executeUpdate("update appointment set status='Cancelled' where did='" + did + "' and pid in('" + pid + "') and date='" + date + "'");
                if (i > 0) {
                    response.sendRedirect("ViewDoctorAppointment.jsp");
                } else {
                    out.println("oops");
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>
