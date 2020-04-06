/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 *
 * @author nibu
 */
@WebServlet(urlPatterns = {"/waterordervh"})
public class waterordervh extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //String _mob = request.getParameter("ab");
            String _veh = request.getParameter("cars");
         
//
            HttpSession session = request.getSession(false);
            String myName = (String) session.getAttribute("abc");
           
            try {
                // if (_mob != null) {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection Conn;
                Conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/KWA", "root", "password");
                
                 PreparedStatement ps2 = (PreparedStatement) Conn.prepareStatement("select * from water_order where mobno="+myName);

                  ResultSet rs1=ps2.executeQuery();
                  while (rs1.next()) {
                      
                      String  idd= rs1.getString("id");
                      //String pan=rs1.getString("panchayathu");
                      
                  out.println(idd);
                  // out.println(pan);
                

                    PreparedStatement ps1 = (PreparedStatement) Conn.prepareStatement("update KWA.water_order set vehicle_no=? where id="+idd);

                    
                    
                    
                    PreparedStatement ps3 = (PreparedStatement) Conn.prepareStatement("UPDATE `KWA`.`water_order` set status=2 where id="+idd);

                
                   // ps1.setString(1,myName);
                    ps1.setString(1,_veh);
                   // ps1.setString(3,pan);
                    //   ps1.setString(4,idd);
                    
                
                  

                    int rs2 = ps1.executeUpdate();
                      int rs3 = ps3.executeUpdate();

                    if (rs2 > 0) {

              
                         response.sendRedirect("waterorderdetails");
                    } else {
                        out.println("Registration Failed !!");
                    }
                  }
                 
                

            } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
                out.println("Exception :" + ex.getMessage());
            }
        }}}
    