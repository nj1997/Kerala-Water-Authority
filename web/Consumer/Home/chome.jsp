<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                                <a class="dropdown-item" href="../../Employee Registration/kea_employeereg.jsp">Add New Panchayathu</a>
                                <a class="dropdown-item" href="../../Cwaterreg">View Employee Details</a>

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



        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="../../img/alaa-eddine-habboubi-l8xpUyzWfVQ-unsplash.jpg" alt="First slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h5 class="animated bounceInRight" style="animation-delay: 1s">Malampuzha Dam</h5>
                        <p class="animated bounceInLeft" style="animation-delay: 2s">Malampuzha Dam is the largest reservoir in Kerala, located near Palakkad, in the state of Kerala</p>

                        <p><form action="Consumer/Registration/registration.html" method="post">
                            <button  type="submit"class="animated bounceInLeft btn btn-primary"style="animation-delay: 3s">Click Here Join With Us</button></form></p>
                    </div>


                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="../../img/prateek-srivastava-BTSBVZd9jWo-unsplash.jpg" alt="Second slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h5 class="animated bounceInLeft" style="animation-delay: 1s">Idukki Dam</h5>
                        <p class="animated bounceInLeft" style="animation-delay: 2s">The Idukki Dam is a double curvature Arch dam constructed across the Periyar River</p>
                        <p><form action="Consumer/Registration/registration.html" method="post">
                            <button  type="submit"class="animated bounceInLeft btn btn-primary"style="animation-delay: 3s">Click Here Join With Us</button></form></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="../../img/t-l-plbeyaME7Jk-unsplash.jpg" alt="Third slide">
                <div class="carousel-caption d-none d-md-block">
                    <h5 class="animated bounceInLeft" style="animation-delay: 1s">Moolamattom</h5>
                    <p class="animated bounceInLeft" style="animation-delay: 2s">Moolamattom is the headquarters of Arakulam Panchayath in Thodupuzha Taluk, Idukki district in Kerala</p>
                    <p><form action="Consumer/Registration/registration.html" method="post">
                        <button  type="submit"class="animated bounceInLeft btn btn-primary"style="animation-delay: 3s">Click Here Join With Us</button></form></p>
                </div> </div>
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>


 <%
		if (session != null) {
			if (session.getAttribute("user") != null) {
				String name = (String) session.getAttribute("user");
				//out.print("Hello, " + name + "  Welcome to ur Profile");
			} else {
				response.sendRedirect("../../home.html");
			}
		}
	%>
 



</body>

</html>
