<%@page import="java.sql.*" %>
<%@page import="JavaProjectInitial.ConnectionDb" %>

<% try {
    String uname = (String) session.getAttribute("name");
    int i = 0;
    Connection con = ConnectionDb.getConn();
    String command = "select * from user_credentials where uname=?";
    PreparedStatement stmt = con.prepareStatement(command);
    stmt.setString(1, uname);
    ResultSet rs = stmt.executeQuery();
    while (rs.next()) {
        if (i < 1) {
            System.out.println("email = "+rs.getString(1) );
            System.out.println("profile updated updated hai");

            String command1 = "select * from IBMregistration where email=?";
            PreparedStatement stmt1 = con.prepareStatement(command1);
            stmt1.setString(1, rs.getString(1));
            ResultSet rs1 = stmt1.executeQuery();
            while (rs1.next()) {
                System.out.println(rs1.getInt(4)+" "+rs1.getInt(5));


%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>USER PROFILE CARD</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/20192c7fbc.js" crossorigin="anonymous"></script>
    
        <link rel="stylesheet" type="text/css" href="prof.css">

        
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
    <div class="loginbox">
            <img src="Pic/mask.jpg" class="avatar">
            <br><br>
            <form>
                <p>Name : <%out.print(rs1.getString(1)+" "+rs1.getString(2)); %>
                </p><br><br>
                <p>Email : <%out.print(rs1.getString(3)); %></p><br><br>
                <p>Phone no. : <%out.print(rs1.getString(4)); %> </p><br>
                <p>Aadhar no. : <%out.print(rs1.getString(5));
            }
                }
                }
                }
                catch (Exception e){
                    e.printStackTrace();
                } %>
                </p> <br> <br>
        
        <div class="html">
        <a href="forgotpassword.html">Change Password</a><br>
        </div>
        
            </form>

        </div>
</div>
        </div>
    </body>
</html>