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
import static javax.management.Query.lt;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String _name = request.getParameter("id");
            out.println(request.getParameter("id"));

            out.print("");

            try {
                if (_name != null) {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection Conn;

                    Conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/KWA", "root", "password");

                 
                    PreparedStatement ps1 = (PreparedStatement) Conn.prepareStatement("update KWA.water_order set mobno=0 where liter=?");

                    

                    

                    ps1.setString(1, _name);
                  

                    int rs2 = ps1.executeUpdate();
//                    ResultSet rs1 = ps2.executeQuery();

                    if (rs2 > 0) {

//                        String _lt=rs1.getString("Price");
//                        out.print(_lt);
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
