<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*"%>
<%@ page import ="java.util.Date" %>
<%@ page import ="java.text.SimpleDateFormat" %>

    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,700,900|Display+Playfair:200,300,400,700"> 
    <link rel="stylesheet" href="fonts/icomoon/style.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="css/aos.css">
    <link rel="stylesheet" href="css/style.css">
  </head>
  
  <body>

  <div class="site-wrap">
    <div class="site-mobile-menu">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
    <style>
    	table{
    	margin-left: 0;
    	}
    	td{
    		padding-top: 5px ;
    		padding-right: 28px ;
    		padding-left: 28px ;
    		padding-bottom: 5px ;
    		background-color: #fff;
    		color: black;
    		font-style: bold;
    	}
    	th{
    		padding-top: 5px ;
    		padding-right: 28px ;
    		padding-left: 48px ;
    		padding-bottom: 5px ;
    		color: #fff;
    	}
    </style>
    <header class="site-navbar py-3 js-site-navbar site-navbar-target" role="banner" id="site-navbar">

      <div class="container">
        <div class="row align-items-center">
          
          <div class="col-11 col-xl-2 site-logo">
            <h1 class="mb-0" style="color:white!important">GitBit</h1>
          </div>
          <div class="col-12 col-md-10 d-none d-xl-block">
            <nav class="site-navigation position-relative text-right" role="navigation">

              <ul class="site-menu js-clone-nav mx-auto d-none d-lg-block">
                <li><a href="homepage.jsp" class="nav-link">Home</a></li>
				<%  if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {  %>
	            <li><a href="index.jsp" class="nav-link">Login</a></li>
    			<%} else {%>
	            <li><a href="logout.jsp" class="nav-link">Logout</a></li>
				<%  }  %>
                <li><a href="uploadpost.jsp" class="nav-link">Upload Post</a></li>
	            <li><a href="reg.jsp" class="nav-link">Register</a></li>
	            <li><a href="upload.jsp" class="nav-link">Upload Code</a></li>
				<li><a href="cart.jsp" class="nav-link">View Code</a></li>
	                          </ul>
            </nav>
          </div>


          <div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3" style="position: relative; top: 3px;"><a href="#" class="site-menu-toggle js-menu-toggle"><span class="icon-menu h3"></span></a></div>

          </div>

        </div>
      </div>
      
    </header>


  <%
							String id = request.getSession().getAttribute("userid").toString();
							String driver = "com.mysql.jdbc.Driver";
							String connectionUrl = "jdbc:mysql://localhost:3306/";
							String database = "users";
							String userid = "root";
							String password = "";
							try {
							Class.forName(driver);
							} catch (ClassNotFoundException e) {
							e.printStackTrace();
							}
							Connection connection = null;
							Statement statement = null;
							ResultSet resultSet = null;
							%>

    <div class="site-blocks-cover inner-page-cover overlay" style="background-image: url(images/images.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row align-items-center justify-content-center text-center">

          <div class="col-md-8" data-aos="fade-up" data-aos-delay="400" >
<br><br><br><br><br><br><br>
            <h1 class="text-white font-weight-light text-uppercase font-weight-bold" style="vspace:200;">Codes uploaded by people</h1>
           
            <div class="container-fluid">
                <div class="row">
                	<div class="col-lg-3 col-3"></div>
                    <div class="col-4 col-lg-4">
                        <div class="single_product_thumb">
							<center>
							<table border="1" style="border: 5px solid #fff; padding:5px">
							<tr>
							<td>ID</td>
							<td>Date</td>
							<td>User</td>
							<td>Language</td>
							<td>Description</td>
							</tr>
							
							                            
                            
							<%
							try{
							connection = DriverManager.getConnection(connectionUrl+database, userid, password);
							statement=connection.createStatement();
							String sql ="select * from duplicates ";
							resultSet = statement.executeQuery(sql);
							int count=1;
							while(resultSet.next()){
							//Date date1=new SimpleDateFormat("dd/MM/yyyy").parse(resultSet.getString("date"));  
							System.out.println("23-10-2019");System.out.println(Integer.parseInt(resultSet.getString("userid")));
							System.out.println(resultSet.getString("lang")); System.out.println(resultSet.getString("description"));
							%>
							
							<tbody>
							<tr>
							<th><%=count++ %></th>
							<th><%=resultSet.getString("lang")%></th>
							<th><%=Integer.parseInt(resultSet.getString("userid"))%></th>
							<th><%=resultSet.getString("lang")%></th>
							<th><%=resultSet.getString("description")%></th>
							</tr>
							</tbody>
							<%
							}
							connection.close();
							} catch (Exception e) {
							e.printStackTrace();
							}
							%>
							</table>
							</center>        
                        </div>
                    </div>
                </div>
            </div>
           
           
           </div>  
        </div>
      </div>
    </div>  

    


  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/jquery.countdown.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/bootstrap-datepicker.min.js"></script>
  <script src="js/aos.js"></script>

  <script src="js/main.js"></script>
    
  </body>
</html>