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

/**
 *
 * @author nibu
 */
@WebServlet(urlPatterns = {"/remove1"})
public class remove1 extends HttpServlet {

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
            String _liter = request.getParameter("cars");
            String _mob = request.getParameter("mobno");
            String _ad = request.getParameter("adress");

            HttpSession session = request.getSession(false);
            String myName = (String) session.getAttribute("user");

            try {
                // if (_mob != null) {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection Conn;

                Conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/KWA", "root", "password");

                PreparedStatement ps2 = (PreparedStatement) Conn.prepareStatement("SELECT * FROM KWA.kwa_register where mobile_number=" + myName);

                ResultSet rs1 = ps2.executeQuery();

                while (rs1.next()) {
                    String panch = rs1.getString("panchayathu");
                     

                    PreparedStatement ps1 = (PreparedStatement) Conn.prepareStatement("insert into water_order(liter,mobno,address,panchayathu,status,user)values(?,?,?,?,1,?)");

                    ps1.setString(2, _mob);
                    ps1.setString(1, _liter);
                    ps1.setString(3, _ad);
                    ps1.setString(4, panch);
                      ps1.setString(5, myName);

                    int rs2 = ps1.executeUpdate();

                    if (rs2 > 0) {

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
