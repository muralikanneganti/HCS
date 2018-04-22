<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.java.DB"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
            Connection con;
            PreparedStatement ps;
            ResultSet rs;
        %>
        <%
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String date = sdf.format(new Date());
            String id = request.getParameter("pid").trim();
            //out.print(id);
            String name = request.getParameter("pname").trim();
            //out.print(name);
            String dname = request.getParameter("dname");
            String did = request.getParameter("did");
            //String disease = request.getParameter("disease");
            String amount = request.getParameter("amount");
            int flag = 1;
            try {
                Connection con = DB.getConnection();
                ps = con.prepareStatement("insert into patient_bill(pid,pname,did,dname,Bill,date,flag) values (?,?,?,?,?,?,?)");
                ps.setString(1, id);
                ps.setString(2, name);
                ps.setString(3, did);
                ps.setString(4, dname);
                //ps.setString(4, disease);
                ps.setString(5, amount);
                ps.setString(6, date);
                ps.setInt(7, flag);
                int i = ps.executeUpdate();
                if (i > 0) {
                    response.sendRedirect("PayBill.jsp");

                } else {
                    out.println("<h1>Somethong Went Wrong Try Again...</h1>");
                }
            } catch (Exception e) {
                out.print(e);
            }
        %>
    </body>
</html>
