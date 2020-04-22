<%-- 
    Document   : index1
    Created on : 21 Apr, 2020, 1:30:46 PM
    Author     : nibu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <title>Merchant Check Out Page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="GENERATOR" content="Evrsoft First Page">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <body>
        <h1>Merchant Check Out Page</h1>
        <pre>
        </pre>
        <form method="post" action="pgDirect.jsp">
            <table>
                <tbody>
                    <tr hidden="true">
                        <th>S.No</th>
                        <th>Label</th>
                        <th>Value</th>
                    </tr>


                    <tr >
                        <td>1</td>
                        <td><label >ORDER_ID: </label></td>
                        <td> <td><input id="ORDER_ID" tabindex="1" maxlength="20" size="20"
                                        name="ORDER_ID" autocomplete="off"
                                        value="<%

                                            String abcd1 = (String) session.getAttribute("user");
                                                                         //out.print(ab);
                                            Connection Conn;
                                            Class.forName("com.mysql.jdbc.Driver").newInstance();

                                            Conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/KWA", "root", "password");

                                            PreparedStatement ps42 = (PreparedStatement) Conn.prepareStatement("select * from kwa_register where mobile_number=" + abcd1);

                                            ResultSet rs123 = ps42.executeQuery();
                                            while (rs123.next()) {

                                                String idd781 = rs123.getString("reg_id");
                                                        //String pan=rs1.getString("panchayathu");

                                                                             //out.println(idd);
                                                // out.println(pan);
                                                PreparedStatement ps61 = (PreparedStatement) Conn.prepareStatement("select * from paymentlist where consumerid =" + idd781);
                                                ResultSet rs83 = ps61.executeQuery();
                                                while (rs83.next()) {

                                                    String idd951 = rs83.getString("id");
                  out.print(idd951);

              }

          }%>">
                        </td>
                    </tr>

                    <tr > <td>2</td> 
                        <td><label>CUSTID :</label></td>
                        <td><input  id="CUST_ID"  name="CUST_ID" 
                                    value= "<%

                                        String ab = (String) session.getAttribute("user");
                                        //out.print(ab);

                                        Class.forName("com.mysql.jdbc.Driver").newInstance();

                                        Conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/KWA", "root", "password");

                                        PreparedStatement ps = (PreparedStatement) Conn.prepareStatement("select * from kwa_register where mobile_number=" + ab);

                                        ResultSet rs1 = ps.executeQuery();
                                        while (rs1.next()) {

                                            String idd = rs1.getString("reg_id");
                                            //String pan=rs1.getString("panchayathu");

                                            out.println(idd);
                                            // out.println(pan);

                                        }%>"></td>
                    </tr>
                    <tr hidden="true">
                        <td>3</td>
                        <td><label>INDUSTRY_TYPE_ID ::*</label></td>
                        <td><input id="INDUSTRY_TYPE_ID" tabindex="4" maxlength="12" size="12" name="INDUSTRY_TYPE_ID" autocomplete="off" value="Retail"></td>
                    </tr>
                    <tr hidden="true">
                        <td>4</td>
                        <td><label>Channel ::*</label></td>
                        <td><input id="CHANNEL_ID" tabindex="4" maxlength="12"
                                   size="12" name="CHANNEL_ID" autocomplete="off" value="WEB">
                        </td>
                    </tr>
                    <tr>

                        <td><label>Payable Amount  :</label></td>
                        <td><input  name="TXN_AMOUNT"

                                    value= "<%

                                        String abcd = (String) session.getAttribute("user");
                                        //out.print(ab);

                                        Class.forName("com.mysql.jdbc.Driver").newInstance();

                                        Conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/KWA", "root", "password");

                                        PreparedStatement ps4 = (PreparedStatement) Conn.prepareStatement("select * from kwa_register where mobile_number=" + abcd);

                                        ResultSet rs12 = ps4.executeQuery();
                                        while (rs12.next()) {

                                            String idd78 = rs12.getString("reg_id");
                  //String pan=rs1.getString("panchayathu");

                                       //out.println(idd);
                                            // out.println(pan);
                                            PreparedStatement ps6 = (PreparedStatement) Conn.prepareStatement("select * from paymentlist where consumerid =" + idd78);
                                            ResultSet rs8 = ps6.executeQuery();
                                            while (rs8.next()) {

                                                String idd95 = rs8.getString("amount");
                                                    out.print(idd95);

                                                }

                                            }%>">


                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td><input value="CheckOut" type="submit" onclick=""></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>


    <%
        if (session != null) {
            if (session.getAttribute("user") != null) {
                // String amount = request.getParameter("TXN_AMOUNT");
                String name = (String) session.getAttribute("user");
                // session.setAttribute("amount1",amount);
                //out.print("Hello, " + name + "  Welcome to ur Profile");
            } else {
                response.sendRedirect("../../home.html");
            }
        }
    %>


</html>
