
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "register", urlPatterns = {"/register"})
public class register extends HttpServlet {

    private Object DriverManger;

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String _fname = request.getParameter("fname");
             String _lname = request.getParameter("lname");
            String _rationid = request.getParameter("rationid");
            String _mobileno = request.getParameter("mobno");
            String _password = request.getParameter("password");
            String _aadhar = request.getParameter("aadhar");
             String _email = request.getParameter("email");

            try {
                if (_rationid != null) {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection Conn;

                    Conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/KWA", "root", "password");

                    PreparedStatement ps = (PreparedStatement) Conn.prepareStatement("INSERT INTO kwa_register (fname,lname,ration_id,mobile_number,password,aadhar,email,reg_date,status)\n"
                            + "VALUES (?,?,?,?,?,?,?,?,2)");
                    PreparedStatement ps1 = (PreparedStatement) Conn.prepareStatement("INSERT INTO login (username,password,status) VALUES (?,?,2);");

                    java.util.Date utilDate = new Date();
                    java.sql.Date date = new java.sql.Date(utilDate.getTime());

               // String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
                    ps.setString(1, _fname);
                      ps.setString(2, _lname);
                    ps.setString(3, _rationid);
                    ps.setString(4, _mobileno);
                    ps.setString(5, _password);
                    ps.setString(6, _aadhar);
                     ps.setString(7, _email);
                     ps.setDate(8, date);

                    ps1.setString(1, _mobileno);
                    ps1.setString(2, _password);
                    
                     

                    int rs = ps.executeUpdate();
                    int rs2 = ps1.executeUpdate();

                    if ((rs2 > 0) && (rs > 0)) {
                        response.sendRedirect("home.html");

                    } else {
                        out.println("Login Failed !!");

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

  // </editor-fold>
}
