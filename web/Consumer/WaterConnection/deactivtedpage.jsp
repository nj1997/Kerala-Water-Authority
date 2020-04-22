<%-- 
    Document   : services
    Created on : 13 Apr, 2020, 9:17:16 PM
    Author     : nibu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet"href="style.css">
        <link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js "  integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
   
        
    </head>
    <body>
        
         <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top ">
            <div class="container">
                <img style="width: 30%" src="../../img/Banner_Ed1 (1).gif">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>


                <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                    <ul class="navbar-nav ml-auto ">
                        <li class="nav-item active">
                            <a class="nav-link" href="chome.jsp">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">About</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Services
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                               
                                <a class="dropdown-item" href="../../Cwaterreg">Shopping Cart</a>
                                 <a class="dropdown-item" href="../../orderconfirm">Order Details</a>

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


            <div>
                <p><form action="../../logout" method="post">
                    <button  type="submit"class="  btn btn-primary">LogOut </button></form></p>
            </div>
          
        </nav>
        
        
        <div class= " one row" style="margin-top:100px">
            <div class="border border-primary">
            <div class="col">
                
                 <div class="">
                     <span>Services</span>
                     <hr>
                    
                    
                </div>
                
                <div class="two row">
                    <button type="button" class="btn btn-primary">Payment</button>
                    
                </div>
               
                 <div class=" four row">
                    <button type="button" class="btn btn-primary">Payment history</button>
                    
                    
                </div>
                
                 <div class="three row">
                     <button type="button" class="btn btn-primary"onclick="myFunction()">Water Connection Activation</button>
                    
<script>
function myFunction() {
  var txt;
  if (confirm("Are You sure Active Your Account?")) {
    //txt = "You pressed OK!";
  } else {
    //txt = "You pressed Cancel!";
  }
  document.getElementById("demo").innerHTML = txt;
}
</script>
                     
                     
                     
                     

      
                </div>
               
            </div>
            </div>
            
            
            
            
        </div>
        <style>
            .one{
                margin-left: 80px;
            }
            .two{
                margin-bottom:  30px;
                margin-top: 30px;
                margin-left: 0px;
            }
            .border{
                padding: 50px;
                padding-bottom: 200px;
             
               
            }
            .three{
                margin-left: 0px;
            }
            body{
               // width: 100%;    
            }
            span{
               padding-bottom: 10px;
               font-size: 20px;
               color: blue;
            }
            .four{
                margin-bottom:  30px;
                 margin-left: 0px;
            }
        </style>


        
    </body>
</html>
