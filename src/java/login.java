
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Member;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

    private Object DriverManger;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String _name = request.getParameter("name");
            String pass = request.getParameter("password");

           //admin
            // String check = request.getParameter("ex1");
            try {
                if (_name != null) {

                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection Conn;

                    Conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/KWA", "root", "password");
                    
                    //vehicle cornor
                     String sql5 = "SELECT * FROM KWA.login where username=? and password=? and status=5";
                      
                    PreparedStatement pst5 = (PreparedStatement) Conn.prepareStatement(sql5);
                    pst5.setString(1, _name);
                    pst5.setString(2, pass);
                      ResultSet rs5 = pst5.executeQuery();
                    
                    

                    //customer pannel
                    PreparedStatement ps = (PreparedStatement) Conn.prepareStatement("SELECT * FROM KWA.login where username=? and password=? and  status=2");
                    ps.setString(1, _name);
                    ps.setString(2, pass);
                    ResultSet rs = ps.executeQuery();

                    //Admin Pannel
                    String sql2 = "SELECT * FROM KWA.login where username=? and password=? and status=1";
                      
                    PreparedStatement pst1 = (PreparedStatement) Conn.prepareStatement(sql2);
                    pst1.setString(1, _name);
                    pst1.setString(2, pass);
                      ResultSet rs1 = pst1.executeQuery();
                      
                      
                   
                    
                    //Employee pannel
                     String sql3 = "SELECT * FROM KWA.login where username=? and password=? and status=3";
                      
                    PreparedStatement pst3 = (PreparedStatement) Conn.prepareStatement(sql3);
                    pst3.setString(1, _name);
                    pst3.setString(2, pass);
                     ResultSet rs2 = pst3.executeQuery();
                    
                    
                    
                    //Add Ip Information
                      com.mysql.jdbc.PreparedStatement ps2 = (com.mysql.jdbc.PreparedStatement) Conn.prepareStatement("INSERT INTO KWA.Ip_view (mobno,date,status) VALUES (?,?,0);");
                      String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
                     ps2.setString(1, _name);
                    ps2.setString(2,timeStamp);

                    int rs3=ps2.executeUpdate();
                    
                  

                //    PreparedStatement ps1 = (PreparedStatement) Conn.prepareStatement("INSERT INTO kwa_ip (mobno,date,status) VALUES (?,?,1)");
//                             java.util.Date utilDate = new Date();
//                  java.sql.Date date = new java.sql.Date(utilDate.getTime());
//                  DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
//   LocalDateTime now = LocalDateTime.now();  
////                
//                                      ps1.setString(1, _username);
//		ps1.setString(2,dtf.format(now));
//                  int rs2=ps1.executeUpdate();
                    if ((rs.next())) {

                        HttpSession session = request.getSession(true);
                        session.setAttribute("user", _name);
                        //session.setMaxInactiveInterval(30);
                        response.sendRedirect("Consumer/Home/chome.jsp");

                    }else if(rs1.next()){
                        
                         HttpSession session = request.getSession(true);
                        session.setAttribute("user", _name);
                        //session.setMaxInactiveInterval(30);
                        response.sendRedirect("Admin/home/Ahome.jsp");
                        
                    }else if(rs2.next()){
                          HttpSession session = request.getSession(true);
                        session.setAttribute("user", _name);
                        //session.setMaxInactiveInterval(30);
                        response.sendRedirect("Employee/Ehome/Ehome.jsp");
                    }else if(rs5.next()){
                        HttpSession session = request.getSession(true);
                        session.setAttribute("user", _name);
                        //session.setMaxInactiveInterval(30);
                        response.sendRedirect("Vehicle/home/Vhome.jsp");
                        
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
