/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
@WebServlet(urlPatterns = {"/fgset"})
public class fgset extends HttpServlet {

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
            
             String _fname = request.getParameter("email");
             
                try {
                if (_fname != null) {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection Conn;

                    Conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/KWA", "root", "password");

                    PreparedStatement ps = (PreparedStatement) Conn.prepareStatement("select * from kwa_register where email=?");
                    ps.setString(1, _fname);
                    
                    
                    ResultSet rs = ps.executeQuery();
                    while(rs.next()){
                        
                         String  pass= rs.getString("password");
                         //out.print(pass);
                         
                         
                         
                          // Mention the Recipient's email addess
                        String to =_fname;
                    // Mention the Sender's email address
                    String from = "keralawaterauthority2020@gmail.com";

                    // Mention the SMTP server address. Below Gmail's SMTP server is being used to send email
                    String host = "smtp.gmail.com";

                    // Get system properties
                    Properties properties = System.getProperties();

                    // Setup mail server
                    properties.put("mail.smtp.host", host);
                    properties.put("mail.smtp.port", "587");
                    properties.put("mail.smtp.starttls.enable", "true");
                    properties.put("mail.smtp.auth", "true");

                    // Get the Session object.// and pass username and password
                    Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

                        protected PasswordAuthentication getPasswordAuthentication() {

                            return new PasswordAuthentication("keralawaterauthority2020@gmail.com", "nibujose1997");

                        }

                    });

                    // Used to debug SMTP issues
                    session.setDebug(true);

                    try {
                        // Create a default MimeMessage object.
                        MimeMessage message = new MimeMessage(session);

                        // Set From: header field of the header.
                        message.setFrom(new InternetAddress(from));

                        // Set To: header field of the header.
                        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

                        // Set Subject: header field
                        message.setSubject("Your Password");

                        // Now set the actual message
                        
                        message.setText("Your Password Is :"+pass);
                        
                        //message.setContent("<p>Hello sir,</p>Your <b style=\"color:blue\">Kerala Water Authority</b> registration successfull...<hr><h3><p  align=\"center\" style=\"color:blue\">Stay Home Stay Safe</P></h3> ", "text/html");

                        System.out.println("sending...");
                        // Send message
                        Transport.send(message);
                        System.out.println("Sent message successfully....");
                    } catch (MessagingException mex) {
                        mex.printStackTrace();
                    }
                       
                    }
                     
                    response.sendRedirect("home.html");   
                        
                        

                        
                    } else {
                        out.println("Login Failed !!");

                    }

                }

            catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
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
        
    

