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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nibu
 */
@WebServlet(urlPatterns = {"/agreement"})
public class agreement extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
          
                    try {
                        
                     HttpSession session = request.getSession(false);
        String myName = (String) session.getAttribute("user");
                if (myName!= null) {

                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection Conn;

                    Conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/KWA", "root", "password");
                   
                    
                     String sql3 = "update KWA.waterconnection set status=1 where mobno="+myName;
                      
                    PreparedStatement pst3 = (PreparedStatement) Conn.prepareStatement(sql3);
                   
                         int rs2 = pst3.executeUpdate();
                    
                    
                    
                 
                    
            
                    if ((rs2>0)) {

                       
                        response.sendRedirect("Consumer/WaterConnection/services.jsp");

                    }
                    
                    else{
                        alert("Hello! I am an alert box!!");
                    }
                }

            } catch (Exception ex) {
                out.println("Exception :" + ex.getMessage());
            }
        }
        

    }

  // </editor-fold>

    private void alert(String hello_I_am_an_alert_box) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}

