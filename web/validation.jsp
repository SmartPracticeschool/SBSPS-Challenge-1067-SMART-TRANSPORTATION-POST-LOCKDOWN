<%--
  Created by IntelliJ IDEA.
  User: BIBHABASU
  Date: 14/7/2020
  Time: 12:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*" %>
<%
    String tno=request.getParameter("tno");
    System.out.println(tno);
%>
<html>
<head>
    <title>validation</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/20192c7fbc.js" crossorigin="anonymous"></script>
    <style>
       h2{
           text-align: center;
       }
       .container{
           text-align:center;
       }
       /*button:hover{*/
       /*    background: #aaaaaa;*/
       /*}*/
        button a{
            text-decoration: none;
            color:white;
            font-weight: bold;
        }
        button a:hover{
            color:white;
        }
    </style>
</head>
<body>
<br>
<br>
<br>
<br>

<h2>
    <%
        out.println("ticket number : -"+tno);
    %>
</h2>
<br>
<div class="container">
    <button class="btn btn-dark"><a href="http://127.0.0.1:5000/">Click here to VALIDATE</a></button>
    <br>
    <br>
    <div class="text">
        This validation page will have to be shown while boarding.
    </div>

</div>

</body>
</html>
