/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "EditDept", urlPatterns = {"/EditDept"})
public class EditDept extends HttpServlet {

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           int deptid=Integer.parseInt(request.getParameter("deptid"));
           String deptName=request.getParameter("deptName");
           String fees=request.getParameter("fees");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hcs", "root", "");
        PreparedStatement ps=con.prepareStatement("update dept set deptName='"+deptName+"',fees='"+fees+"' where deptid='"+deptid+"'");
        int i=ps.executeUpdate();
        if(i>0)
        {
            String msg="Updated Successfully";
            response.sendRedirect("EditDept.jsp?msg="+msg+"&deptid="+deptid+"");
         //out.println("Updated");
        }
        else
        {
            out.println("Failed");
        }
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
    }

   

}
