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
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nibu
 */
@WebServlet(urlPatterns = {"/btn1"})
public class btn1 extends HttpServlet {

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
            String _name = request.getParameter("id");
            out.println(request.getParameter("id"));
            String sql2 = "Select liter,price from Water_details where liter="+_name;
   

            try {
                if (_name != null) {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection Conn;

                    Conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/KWA", "root", "password");

                   
                    PreparedStatement ps1 = (PreparedStatement) Conn.prepareStatement("Insert into water_order values(?,?,?");

                    ps1.setString(1, _name);
                  

                ;
                    int rs2 = ps1.executeUpdate();

                    if (rs2 > 0) {
                      
                       
                        out.println("Success !!");
                        // JOptionPane.showMessageDialog(null,"Registred");
                    } else {
                        out.println("Registration Failed !!");
                    }

                }

            } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
                out.println("Exception :" + ex.getMessage());
            }
        }
    }

  

        }
    
