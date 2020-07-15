<%@page import="java.sql.*" %>
<%@page import="JavaProjectInitial.ConnectionDb" %>
<%@page import="javax.servlet.http.HttpSession" %>


<%--<%--%>
       <% String uname= (String)session.getAttribute("name");
//           RequestDispatcher rd;
           System.out.println("guideline session"+uname);
       %>
<%--%>--%>

        <!DOCTYPE html>
<html>
<head>
<style>
.myDiv {
  background-color: black;
  height:60px;
   padding: 15px;
  text-align: center;
  font-weight: bold;
       }
.gui {
 width: 67%;
border-radius : 10px;
 border: 5px outset red;
  background-color: lightblue;    
  text-align: left;
       }
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/20192c7fbc.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="guidelines.css">
</head>
<body>

<!-- <div class="myDiv">
  <h1  style="color:white"> COVID 19 TRAVEL COVER <h1>
 </div> -->

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
<!--/.Navbar-->  <div class="blog">
    <div class="blog-heading">
      GUIDELINES
    </div>
    <div class="grid">
      <div id="blog-pic1">
        <!-- <img src="pic.jpg" alt="Image not found" > -->
      </div>
      <div id="blog-pic2">

      </div>
    </div>
    
    <p class="blog-para">
        <h2>You can reduce your chances of being infected or spreading COVID-19 by taking some simple precautions:</h2>
        <ul style="list-style-type:disc" class="blog-para">
        <li> Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water. Why? Washing your hands with soap and water or using alcohol-based hand rub kills viruses that may be on your hands.</li>
        <li> Maintain at least 1 metre (3 feet) distance between yourself and others. Why? When someone coughs, sneezes, or speaks they spray small liquid droplets from their nose or mouth which may contain virus. If you are too close, you can breathe in the droplets, including the COVID-19 virus if the person has the disease.</li>
        <li> Avoid going to crowded places. Why? Where people come together in crowds, you are more likely to come into close contact with someone that has COIVD-19 and it is more difficult to maintain physical distance of 1 metre (3 feet).</li>
        <li> Avoid touching eyes, nose and mouth. Why? Hands touch many surfaces and can pick up viruses. Once contaminated, hands can transfer the virus to your eyes, nose or mouth. From there, the virus can enter your body and infect you.</li>
        <li> Make sure you, and the people around you, follow good respiratory hygiene. This means covering your mouth and nose with your bent elbow or tissue when you cough or sneeze. Then dispose of the used tissue immediately and wash your hands. Why? Droplets spread virus. By following good respiratory hygiene, you protect the people around you from viruses such as cold, flu and COVID-19.</li>
        <li> Stay home and self-isolate even with minor symptoms such as cough, headache, mild fever, until you recover. Have someone bring you supplies. If you need to leave your house, wear a mask to avoid infecting others. Why? Avoiding contact with others will protect them from possible COVID-19 and other viruses.</li>
        <li> If you have a fever, cough and difficulty breathing, seek medical attention, but call by telephone in advance if possible and follow the directions of your local health authority. Why? National and local authorities will have the most up to date information on the situation in your area. Calling in advance will allow your health care provider to quickly direct you to the right health facility. This will also protect you and help prevent spread of viruses and other infections.</li>
            <li> Keep up to date on the latest information from trusted sources, such as WHO or your local and national health authorities. Why? Local and national authorities are best placed to advise on what people in your area should be doing to protect themselves.</li></p>
        </ul>
    </p>
  </div>
 <div class="guide-buttons">
     <button class="btn btn-dark"> <a href="ticket.jsp">Proceed to book tickets</a> </button>
     <button class="btn btn-dark second_guide_button"> <a href="dashboard.jsp">Close</a> </button>
  </div>

</body>
</html>