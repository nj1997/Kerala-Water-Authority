<%-- 
    Document   : newjsp
    Created on : 25 Mar, 2020, 10:38:27 AM
    Author     : nibu
--%>


<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%ResultSet resultset = null;%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%! String driverName = "com.mysql.jdbc.Driver";%>
        <%!String url = "jdbc:mysql://localhost:3306/KWA";%>
        <%!String user = "root";%>
        <%!String psw = "password";%>
        <form action="#">
            <%
                Connection con = null;
                PreparedStatement ps = null;
                try {
                    Class.forName(driverName);
                    con = DriverManager.getConnection(url, user, psw);
                    String sql = "SELECT * FROM KWA.kwa_empreg;";
                    ps = con.prepareStatement(sql);
                    ResultSet rs = ps.executeQuery();
            %>
            <p>Select Name :
                <select>
                    <%
                        while (rs.next()) {
                            String fname = rs.getString("panchayathu_name");
                    %>
                    <option value="<%=fname%>"><%=fname%></option>
                    <%
                        }
                    %>
                </select>
            </p>
            <%
                } catch (SQLException sqe) {
                    out.println(sqe);
                }
            %>
        </form>

    </body>
</html>
