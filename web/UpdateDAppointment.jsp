<%@page import="com.java.DB"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
String id,pname,doctor,fees,date,time,dept,pid;
%>
<% 
try
{
            dept=request.getParameter("dept");
            doctor=(String)session.getAttribute("dname");
            date=request.getParameter("date");
            time=request.getParameter("time");
	conn=DB.getConnection();
	st=conn.createStatement();
	int i=st.executeUpdate("update Table_Appointment set  App_Date='"+date+"',App_Time='"+time+"' where Dname='"+doctor+"'");
        response.sendRedirect("DAppUpdate.jsp?dname="+doctor+"");
       // out.println("success");
}
catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>