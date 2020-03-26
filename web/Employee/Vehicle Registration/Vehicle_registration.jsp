<%-- 
    Document   : Vehicle_reg
    Created on : 26 Mar, 2020, 12:37:22 PM
    Author     : nibu
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vehicle Registartion</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js "  integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%! String driverName = "com.mysql.jdbc.Driver";%>
        <%!String url = "jdbc:mysql://localhost:3306/KWA";%>
        <%!String user = "root";%>
        <%!String psw = "password";%>

        <nav class="navbar navbar-expand-lg navbar-light fixed-top ">
            <div class="container">
                <img style="width: 30%" src="../../img/Banner_Ed1 (1).gif">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>


                <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                    <ul class="navbar-nav ml-auto ">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Services</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#">Contact</a>
                        </li>  
                    </ul>
                </div>
            </div>
        </nav>

        <section class="container-fluid " >
            <section class="row justify-content-center">
                <section class="col-12 col-sm-6 col-md-3">
                    <form class="form-container" action="../../vehicle_reg" method="POST">
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

                        Vehicle Registration Number
                        <input type="text"class="form-control"name="vn">

                        Owner Namer 
                        <input type="text"class="form-control"name="on">



                        Mobile Number 
                        <input type="text"class="form-control"name="mobno">

                        Aadhar Number 
                        <input type="text"class="form-control"name="an">


                        Panchayathu  

                        <select name="place" class="custom-select">
                            <%
                                while (rs.next()) {
                                    String fname = rs.getString("panchayathu_name");
                            %>

                            <option  value="<%=fname%>"><%=fname%></option>
                            <%
                                }
                            %>

                        </select>

                        <%
                            } catch (SQLException sqe) {
                                out.println(sqe);
                            }
                        %>


                        Liter:
                        <select name="liter" class="custom-select">

                            <option value="1000">1000</option>
                            <option value="2000">2000</option>
                            <option value="3000">3000</option>

                            <option value="4000">4000</option>
                            <option value="5000">5000</option>
                            <option value="10000">10000</option>

                        </select>

                        <div class="fn">
                            <input class="btn btn-success" type="submit"value="Register">
                        </div>
                    </form>    
                </section></section></section>


        <style>
            .form-container{
                position: absolute;
                top: 20vh;
                border: #fff;
                padding: 50px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px 0px #000;

            }
            .fn{
                margin-top:15px;
            }
            .list{
                margin-top:5px;


            }

        </style>



    </body>
</html>
