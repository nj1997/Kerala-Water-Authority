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
import java.util.Date;
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
@WebServlet(urlPatterns = {"/vehicle_reg"})
public class vehicle_reg extends HttpServlet {

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
            String vehicle_no = request.getParameter("vn");
            String _name = request.getParameter("on");
            String aadhar = request.getParameter("an");

            String pl = request.getParameter("place");
            String lit = request.getParameter("liter");

            String _mobileno = request.getParameter("mobno");

            try {
                if (vehicle_no != null) {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection Conn;

                    Conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/KWA", "root", "password");

                    PreparedStatement ps = (PreparedStatement) Conn.prepareStatement("INSERT INTO KWA.vehicle_reg(vehicle_no,owner_name,mobno,liter,password,aadharid,date,place,status)VALUES(?,?,?,?,?,?,?,?,5)");
                    PreparedStatement ps1 = (PreparedStatement) Conn.prepareStatement("INSERT INTO login (username,password,status) VALUES (?,?,5);");

                    java.util.Date utilDate = new Date();
                    java.sql.Date date = new java.sql.Date(utilDate.getTime());

                    //   String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
                    ps.setString(1, vehicle_no);
                    ps.setString(2, _name);

                    ps.setString(3, _mobileno);
                    ps.setString(4, lit);
                    ps.setString(5, _mobileno);
                    ps.setString(6, aadhar);
                    ps.setDate(7, date);
                    ps.setString(8, pl);

                    ps1.setString(1, _mobileno);
                    ps1.setString(2, _mobileno);

                    int rs = ps.executeUpdate();
                    int rs2 = ps1.executeUpdate();

                    if ((rs > 0 && (rs2 > 0))) {

                        // response.sendRedirect("");
                        JOptionPane.showMessageDialog(null, "Registred");
                    } else {
                        out.println("Registration Failed !!");
                    }

                }

            } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
                out.println("Exception :" + ex.getMessage());
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
