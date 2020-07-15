<%@page import="java.sql.*" %>
<%@page import="JavaProjectInitial.ConnectionDb" %>

<%
        Connection con=ConnectionDb.getConn();
        String command="select * from timetable";
        PreparedStatement stmt=con.prepareStatement(command);
        ResultSet rs=stmt.executeQuery();
        %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Timetable</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/20192c7fbc.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="dashboard_style.css">

<style>
    table {
        margin-top:3rem;
        margin-left:7rem;
        /*border: solid white;*/
        border-radius: 10px;
        padding:0.5rem 1rem;
        background:#333;
        text-align: center;
    }
    th{
        font-size:1.2rem;
        color:white;
    }
    td{
        padding:0.5rem 1rem;
        border-top:1px #ddd solid;
        color:white;
        /* border-left: 2px black solid; */
    }
    td:not(.not){
        border-left: 2px #ddd solid;
    }

</style>
</head>
<body>
<!--Navbar-->
<nav class="navbar navbar-dark bg-dark light-blue lighten-4">

    <!-- Navbar brand -->
    <a class="navbar-brand" href="dashboard.jsp">COVID-19 TravelCover</a>

    <!-- Collapse button -->
    <button class="navbar-toggler toggler-example" type="button" data-toggle="collapse" data-target="#navbarSupportedContent1"
            aria-controls="navbarSupportedContent1" aria-expanded="false" aria-label="Toggle navigation"><span class="light"><i
            class="fas fa-bars fa-1x"></i></span></button>

    <!-- Collapsible content -->
    <div class="collapse navbar-collapse" id="navbarSupportedContent1">

        <!-- Links -->
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="profilepage.jsp">Profile <span class="sr-only">(current)</span></a>            </li>
            <li class="nav-item">
                <a class="nav-link" href="guidelines.jsp">Guidelines</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="timetable.jsp">Timetable</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="guidelines.jsp">Book Tickets</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="logoutSrv">Logout</a>
            </li>
        </ul>
        <!-- Links -->

    </div>
    <!-- Collapsible content -->

</nav>
<!--/.Navbar-->

<div class="container">
    <table class="timetable">
        <tr>
            <th>Bus no.</th>
            <th>Bus name </th>
            <th class="arrival">Arrival

        <tr>
            <td>    </td>
            <td class="not">    </td>
            <td>Stop 1</td>
            <td>Stop 2</td>
            <td>Stop 3</td>
            <td>Stop 4</td>
            <td>Stop 5</td>
            <td>Stop 6</td>
            <td>Stop 7</td>
            <td>Stop 8</td>
        </tr>
        </th>
        </tr>
        <%
            while(rs.next()){
                System.out.println(rs.getString(1)+rs.getString(2));

        %>
        <tr>
            <!-- <td class="not" >    </td>
                  <td class="not">    </td> -->
            <td><% out.println(rs.getString(1));%></td>
            <td><%out.println(rs.getString(2));%></td>
            <td><%out.println(rs.getString(3));%></td>
            <td><%out.println(rs.getString(4));%></td>
            <td><%out.println(rs.getString(5));%></td>
            <td><%out.println(rs.getString(6));%></td>
            <td><%out.println(rs.getString(7));%></td>
            <td><%out.println(rs.getString(8));%></td>
            <td><%out.println(rs.getString(9));%></td>
            <td><%out.println(rs.getString(10));%></td>
        </tr>
        <tr>
        <%}
                %>


    </table>
</div>
</body>
</html>