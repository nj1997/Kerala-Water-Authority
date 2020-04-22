<%-- 
    Document   : loading
    Created on : 13 Apr, 2020, 8:45:34 PM
    Author     : nibu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>


        <div class="row">
            <div class="col-md-4">
            <div class="  spin spinner-grow" role="status">
                <span class="sr-only">hello</span>
            </div>
            </div>
            <div class="col">
            <div class="txt">
                <p> Waiting for Some time !!!</p>
            </div>
            </div>
        </div>


        <style>
            .spin{

                margin-left: 250px; 
                margin-top: 300px;
                width: 50px;
                width: 3rem;
                height: 3rem;


            }
            .txt{
                font-size: 50px;
                margin-top:  300px;
                margin-right: 250px;

            }
        </style>

    </body>
</html>
