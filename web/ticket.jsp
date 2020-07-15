<%@page import="java.sql.*" %>
<%@page import="JavaProjectInitial.ConnectionDb" %>

<%
    try{
    String uname= (String)session.getAttribute("name");
    int i=0;
    Connection con=ConnectionDb.getConn();
    String command="select * from user_credentials where uname=?";
    PreparedStatement stmt=con.prepareStatement(command);
    stmt.setString(1,uname);
    ResultSet rs=stmt.executeQuery();
    while(rs.next()) {
        if (i < 1) {
            System.out.println(rs.getString(4) + " " + rs.getString(5));
            System.out.println("dashboard updated");

       %>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Book tickets</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  <script src="https://kit.fontawesome.com/20192c7fbc.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="ticket_style.css">
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
                <a class="nav-link" href="profilepage.jsp">Profile <span class="sr-only">(current)</span></a>
            </li>
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
    <h1 class="ticket-heading">
      TICKET BOOKING
    </h1>
      <h3 style="color:white;text-align:center;">Rate : 10/- per stop</h3>
  <form action="ticket" method="post">
   <div class="form-group">
       <label class="form-headings" >Enter user name</label>
       <input type="text" name="uname"  required> <br>

<%--       <label class="form-headings">Choose a pincode from list or type manually:--%>
<%--           <input list="browsers" name="s_pin" /></label>--%>
<%--       <datalist id="browsers"name="s_pin">--%>
<%--           <option value="<%out.print(rs.getString(4)); %>">--%>
<%--           <option value="<%out.print(rs.getString(5));}} %>">--%>
<%--       </datalist>--%>
       <%
                   out.println(" <label class='form-headings'>Choose a source pincode from list or type manually:");
                   out.println(" <input list='browsers' name='s_pin' /></label>");
                   out.println("<datalist id='browsers' name='s_pin'>");
           out.println("<option value='"+rs.getString(4)+"'>");
           out.println("<option value='"+rs.getString(5)+"'>");
       %>
   </div>
       <br>
      <div class="form-group">
          <%--       <label class="form-headings">Choose a pincode from list or type manually:--%>
          <%--           <input list="browsers" name="s_pin" /></label>--%>
          <%--       <datalist id="browsers"name="s_pin">--%>
          <%--           <option value="<%out.print(rs.getString(4)); %>">--%>
          <%--           <option value="<%out.print(rs.getString(5));}} %>">--%>
          <%--       </datalist>--%>
          <%
              out.println(" <label class='form-headings'>Choose a destination pincode from list or type manually:");
              out.println(" <input list='browsers' name='d_pin' /></label>");
              out.println("<datalist id='browsers' name='d_pin'>");
              out.println("<option value='"+rs.getString(4)+"'>");
              out.println("<option value='"+rs.getString(5)+"'>");
              }
              }
              }
    catch (Exception e){
        e.printStackTrace();
    }
          %>
      </div>
      <br>
      <div class="form-group">
        <label class="form-headings" for="exampleFormControlTextarea1">Purpose</label>
        <textarea class="form-control"name="purpose" id="exampleFormControlTextarea1" rows="3"></textarea>
    </div>

    <div class="time">
      <label class="form-headings" for="exampleFormControlTextarea1">Time </label>
      <input type="datetime-local" name="dtime" id="dtime">
     <br>
        <span  id="time-help"> Please click on the calender icon to select time or enter manually.</span>
    
    </div>

    <div class="submit-div">
      <input type="submit" value="PROCEED" class="btn btn-light btn-lg submit">
    </div>

      
  </form>
  </div>



<!--   <script src="index.js"></script> -->
</body>
</html>