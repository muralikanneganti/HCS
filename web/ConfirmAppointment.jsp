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
                String id = request.getParameter("id");
                conn = DB.getConnection();
                st = conn.createStatement();
                int i = st.executeUpdate("update Table_Appointment set Confirm='Appointment Cofirmed' where Pid='" + id + "'");
                response.sendRedirect("Confirmed.jsp");
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>
