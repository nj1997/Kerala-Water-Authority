/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(urlPatterns = {"/test"})
public class test extends HttpServlet {

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
            
            String mob=request.getParameter("cars");
          // out.printf(mob);
            
                    
                       HttpSession session = request.getSession(false);
                        session.setAttribute("nibu", mob);
                        
                        //out.print(mob);
                        
    
      response.sendRedirect("Employee/water order/add1.jsp");
      
      
            /* TODO output your page here. You may use following sample code. */
            
          //  out.println("<B><BR>User:" + request.getParameter("user"));
           
//      out.println
//          (" Employee number:" +myName + "</B>");
//    
      //  include(request, response);
    }}
 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

  // </editor-fold>
}

