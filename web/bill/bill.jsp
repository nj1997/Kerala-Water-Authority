<%-- 
    Document   : bill
    Created on : 22 Apr, 2020, 9:22:03 PM
    Author     : nibu
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet"href="style.css">
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
        <div class="container">

            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3 body-main">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-4"> <img class="img" alt="Invoce Template" src="../img/KWA_COLOR(2).png" /> </div>
                                <div class="col-md-8 text-right">
                                    <h4 style="color:blue;"><strong>Kerala Water Authority</strong></h4>
                                    <p>Vellayambalam Thiruvananthapuram, Kerala</p>
                                    <p> India-695033</p>
                                    <p>Phone 0471-2328654</p>
                                </div>
                            </div> <br />
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <h2>INVOICE</h2>
                                    <h5>04854654101</h5>
                                </div>
                            </div> <br />
                            <div>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>
                                    <h5>Description</h5>
                                    </th>
                                    <th>
                                    <h5>Amount</h5>
                                    </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="col-md-9">Payable Amount</td>
                                            <td class="col-md-3"><i class="fas fa-rupee-sign" area-hidden="true"></i> <%
                                                            String ab = (String) session.getAttribute("user");
                                                            out.print(ab);


                                                        %>
 </td>
                                        </tr>

                                        <tr>
                                            <td class="text-right">

                                                <p> <strong>Total Amount: </strong> </p>
                                                <p> <strong>Discount: </strong> </p>
                                                <p> <strong>Payable Amount: </strong> </p>
                                            </td>
                                            <td>
                                                <p> <strong><i class="fas fa-rupee-sign" area-hidden="true"></i> 

                                                        <%
                                                           
                                                            out.print(ab);


                                                        %>

                                                       


                                                    </strong> </p>

                                                <p> <strong><i class="fas fa-rupee-sign" area-hidden="true"></i>0  </strong> </p>
                                                <p> <strong><i class="fas fa-rupee-sign" area-hidden="true"></i>
                                                        <%
                                                            
                                                            out.print(ab);


                                                        %></strong> </p>
                                            </td>
                                        </tr>
                                        <tr style="color: #F81D2D;">
                                            <td class="text-right">
                                                <h4><strong>Total:</strong></h4>
                                            </td>
                                            <td class="text-left">
                                                <h4><strong><i class="fas fa-rupee-sign" area-hidden="true"></i> <%
                                                            
                                                            out.print(ab);


                                                        %> </strong></h4>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div>
                                <div class="col-md-12">
                                    <p><b>Date :</b> <%
 LocalDate myObj = LocalDate.now(); out.print(myObj); %></p> <br />
                                    <p><b>Signature</b></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <style>
            .body-main {
                background: #ffffff;
                border-bottom: 15px solid #1E1F23;
                border-top: 15px solid #1E1F23;
                margin-top: 30px;
                margin-bottom: 30px;
                padding: 40px 30px !important;
                position: relative;
                box-shadow: 0 1px 21px #808080;
                font-size: 10px;
                margin-left: 300px;
            }

            .main thead {
                background: #1E1F23;
                color: #fff
            }

            .img {
                height: 150px
            }

            h1 {
                text-align: center
            }
        </style>

    </body>
</html>
