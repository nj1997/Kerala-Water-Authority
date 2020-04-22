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
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(urlPatterns = {"/servicecheck"})
public class servicecheck extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
         //   Class.forName("com.mysql.jdbc.Driver").newInstance();
                   
                

                    try {
                        
                     HttpSession session = request.getSession(false);
        String myName = (String) session.getAttribute("user");
                if (myName!= null) {

                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection Conn;

                    Conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/KWA", "root", "password");
                   
                    
                     String sql3 = "SELECT * FROM KWA.waterconnection where status=0 and mobno="+myName;
                      
                    PreparedStatement pst3 = (PreparedStatement) Conn.prepareStatement(sql3);
                   
                     ResultSet rs2 = pst3.executeQuery();
                    
                     
                     
                     
                     
                      String sql4 = "SELECT * FROM KWA.waterconnection where status=1 and mobno="+myName;
                      
                    PreparedStatement pst4 = (PreparedStatement) Conn.prepareStatement(sql4);
                   
                     ResultSet rs3 = pst4.executeQuery();
                    
                    
                     
                    
                 
                    
            
                    if ((rs2.next())) {
                        
                     
                        session.setAttribute("user", myName);

                       
                        response.sendRedirect("Consumer/WaterConnection/waterconnection.jsp");

                    }
                    
                    else if(rs3.next()){
                         session.setAttribute("user", myName);
                        
                        response.sendRedirect("Consumer/WaterConnection/loading.jsp");
                        
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
