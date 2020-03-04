<%-- 
    Document   : searchview
    Created on : 3 Mar, 2020, 12:04:07 PM
    Author     : nibu
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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


    <nav class="navbar navbar-expand-lg navbar-light bg-light ">
        <div class="container">
            <img style="width: 30%" src="img/Banner_Ed1 (1).gif">
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
            <p><form action="logout" method="post">
                <button  type="submit"class="  btn btn-primary">LogOut </button></form></p>
        </div>
    </nav>
    <div class="frm">
        <center> <h3>Employee Detail</h3></center>
    </div>
    <table class="table table-hover ">


        <thead
            <tr>
               <td><b>Panchayathu Number</b></td>
                <td><b>Panchayathu Name</b></td>
                <td><b>Mobile Number</b></td>
                <td><b>Date for Registration</b></td>
            </tr>
        </thead>
        <%
            int count = 0;
            String color = "#F9EBB3";
            if (request.getAttribute("piList") != null) {
                ArrayList al = (ArrayList) request.getAttribute("piList");
                System.out.println(al);
                Iterator itr = al.iterator();
                while (itr.hasNext()) {

                    if ((count % 2) == 0) {
                        color = "#eeffee";
                    }
                    count++;
                    ArrayList pList = (ArrayList) itr.next();
        %>
        <tr style="background-color:<%=color%>;">
            <td><%=pList.get(0)%></td>
            <td><%=pList.get(1)%></td>
            <td><%=pList.get(2)%></td>
              <td><%=pList.get(3)%></td>
       
        </tr>
        <%
                }
            }
            if (count == 0) {
        %>
        <tr>
            <td colspan=7 align="center"
                ><b>No Record Found..</b></td>
        </tr>
        <%            }
        %>
    </table>
    <style>
        .table{
            margin-top: 2%;
            width: 90%;
            margin-left:5%
        }
        .frm{
            margin-top: 1%;
        }
    </style>



</body>
</html>
