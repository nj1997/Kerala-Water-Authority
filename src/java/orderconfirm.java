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
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
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
@WebServlet(urlPatterns = {"/orderconfirm"})
public class orderconfirm extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        Connection conn = null;

        HttpSession session = request.getSession(false);
        String myName = (String) session.getAttribute("user");
        //out.print(myName);

        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "KWA";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "root";
        String password = "password";

        Statement st;
        try {
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url + dbName, userName, password);
            System.out.println("Connected!");
            //  String pid = request.getParameter("pid");
            Connection Conn;
            Conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/KWA", "root", "password");

            PreparedStatement ps2 = (PreparedStatement) Conn.prepareStatement("SELECT * FROM KWA.water_order where user=" + myName);
            ResultSet rs1 = ps2.executeQuery();
            while (rs1.next()) {
                
                  String  veh= rs1.getString("vehicle_no");
                  out.print(veh);
                  
                   PreparedStatement ps3 = (PreparedStatement) Conn.prepareStatement("SELECT * FROM KWA.vehicle_reg  where vehicle_no=?");
                   ps3.setString(1, veh);
            ResultSet rs2 = ps3.executeQuery();
            while (rs2.next()) {
                   String  idd= rs2.getString("id");
                    out.print(idd);
                
                ArrayList al = null;
                ArrayList pid_list = new ArrayList();
                String query = "select mobno,owner_name,vehicle_no from KWA.vehicle_reg where id="+idd;
                
               

                System.out.println("query " + query);
                st = conn.createStatement();
                ResultSet rs = st.executeQuery(query);

                while (rs.next()) {
                    al = new ArrayList();

//                out.println(rs.getString(1));
//                out.println(rs.getString(2));
//                out.println(rs.getString(3));
//                out.println(rs.getString(4));
                    al.add(rs.getString(1));
                    al.add(rs.getString(2));
                 

                    System.out.println("al :: " + al);
                    pid_list.add(al);
                }

                request.setAttribute("piList", pid_list);
            RequestDispatcher view = request.getRequestDispatcher("orderconfirm.jsp");
                 view.forward(request, response);
                conn.close();
                System.out.println("Disconnected!");
            }}
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
                out.println("Exception :" + ex.getMessage());
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}

