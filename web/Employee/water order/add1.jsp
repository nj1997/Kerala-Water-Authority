<%-- 
    Document   : add1
    Created on : 31 Mar, 2020, 7:39:12 PM
    Author     : nibu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%ResultSet resultset = null;%>
<!DOCTYPE html>
<html>
    <head>
        <title>Water Order Details</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js "  integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script
        src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
    crossorigin="anonymous"></script>
    </head>
    <body>
        
    <nav class="navbar navbar-expand-lg navbar-light bg-light ">
        <div class="container">
            <img style="width: 30%" src="../../img/Banner_Ed1 (1).gif">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>


            <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                <ul class="navbar-nav ml-auto ">
                    <li class="nav-item active">
                        <a class="nav-link" href="Admin/home/Ahome.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Services
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="../../Employee/Search Customer Details/index.jsp">Search Consumer Details</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
                    </li>  
                    <li>

                    </li>
                </ul>
            </div>
        </div>


        <div class="tab">
        </div>
        <div>
            <p><form action="../../logout" method="post">
                <button  type="submit"class="  btn btn-primary">LogOut </button></form></p>
        </div>
    </nav>
        
        
        <form action="../../waterordervh" method="POST">
        <div style="text-align: center">
            <h3>Details of available vehicle</h3>
        </div>
        <div class="row">
            <div class="col" style="margin-left: 50px">
                <div style=" margin-top: 50px">
                    <h5>Customer mobile Number</h5>
                    
                </div >
                <div style="font-size: 50px">
                <%
                        String ab = (String) session.getAttribute("nibu");
                        out.print(ab);
                        

                
                    %>
                    <%
                        
                         HttpSession session1= request.getSession(true);
                        session.setAttribute("abc",ab);
                        %>
            </div>
            </div>
            <div>
                
                
                
                <div class="col" style="margin-top: 25px">
               

                    <%! String driverName = "com.mysql.jdbc.Driver";%>
                    <%!String url = "jdbc:mysql://localhost:3306/KWA";%>
                    <%!String user = "root";%>
                    <%!String psw = "password";%>


 <div class="col"style="margin-top: 30px">
     <div style="margin-top: 50px">
                <h4 style="margin-left: 20px"> Vehicle List</h4>

     </div>

                <div style="margin-left: 20px;">

                    <%
                        try {
                            PreparedStatement ps,ps1 = null;
                             Connection con = null;
                            Class.forName(driverName);
                            con = DriverManager.getConnection(url, user, psw);
                            
                             String sql1 = "SELECT * FROM KWA.water_order where mobno="+ab;
                              ps1 = con.prepareStatement(sql1);
                            ResultSet rs1 = ps1.executeQuery();
                            
                           
                         if( rs1.next()){
                                 String fn = rs1.getString("liter");
                           
                            
                             String sql = "SELECT * FROM KWA.vehicle_reg where liter="+fn;
                            ps = con.prepareStatement(sql);
                            ResultSet rs = ps.executeQuery();
                       
                    %>
                    <div style="margin-top: 25px">

                    <select name="cars"id="lit" style="width: 300px" class="custom-select">
                        <option selected>Select Vehicle</option>
                        <%
                            while (rs.next()) {
                                String fname1 = rs.getString("vehicle_no");
                        %>

                        <option  value="<%=fname1%>"><%=fname1%></option>
                        <%
                            }
                        %>

                    </select>
                    </div>




                    <%
                         }
                        } catch (SQLException sqe) {
                            out.println(sqe);
                        }
                    %>
                </div>



            </div>
                </div>
            </div>
                
            <div class="col" style="margin-top: 100px">

                <input class="btn btn-success btn-block" style="width: 200px" type="submit"value="Submit">
            </div>
                    
             
        </div>
        </form>
                
                
                
                
                
                
                
                
                
                
                
            
    </body>
</html>
