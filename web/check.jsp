<%-- 
    Document   : check
    Created on : 28 Mar, 2020, 9:43:16 AM
    Author     : nibu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
<form class="form-container" action="test" method="POST">
    
     
 
           <%
                    if (session != null) {
                        if (session.getAttribute("user") != null) {
                            String name = (String) session.getAttribute("user");
                            out.print("Hello, " + name + "  Welcome to ur Profile");
                        } else {
                            response.sendRedirect("../../home.html");
                        }
                    }
                %>
                 </form>
    </body>
</html>
