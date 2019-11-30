<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Title  -->
    <title>Atomkart-The future of Shopping</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="style.css">

</head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
}

.navbar {
  overflow: hidden;
  background-color: #333;
}

.navbar a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: orange;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}

table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th:nth-child(odd) {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

td, th:nth-child(even) {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(odd) {
  background-color: lightblue;
}
tr:nth-child(even) {
  background-color: #dddddd;
}

</style>


<body>
<div class="navbar">
	<a href="homepage.jsp">
	  <img src="img/core-img/logo.png" style=" width:20%; height:40%; float:left;">
	  <span style="display: inline-block;"></span>
	</a>
  <a href="homepage.jsp#smartwatch" style="float:left;">Smartwatches</a>
  <a href="homepage.jsp#news">Smartglasses</a>
  <a href="homepage.jsp#power">Power Banks</a>
	<%  if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {  %>
	<a href="index.jsp" class="fav-nav"><img src="img/core-img/favorites.png" alt=""> Login</a>
	<%} else {
	%>
	<a href="logout.jsp" class="fav-nav"><img src="img/core-img/favorites.png" alt=""> Logout</a>
    <a href="cart.jsp" class="fav-nav"><img src="img/core-img/cart.png" alt=""> Cart</a>
    <a href="history.jsp" class="fav-nav"><img src="img/core-img/favorites.png" alt=""> History</a>
	<%
	    }
	%>
  
<a href="reg.jsp" class="fav-nav"><img src="img/core-img/favorites.png" alt="">Register</a>
</div>

    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

        <!-- Mobile Nav (max width 767px)-->
        <div class="mobile-nav">
            <!-- Navbar Brand -->
            <div class="amado-navbar-brand">
                <a href="homepage.jsp"><img src="img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Navbar Toggler -->
            <div class="amado-navbar-toggler">
                <span></span><span></span><span></span>
            </div>
        </div>


        <!-- Product Details Area Start -->
<%

try
{
Class.forName("com.mysql.jdbc.Driver");
//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "Hotmail123");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/users", "root", "root");
Statement st=conn.createStatement();

String uname= request.getSession().getAttribute("uname").toString(); 
String prod=request.getSession().getAttribute("prod").toString();
int price=Integer.parseInt(request.getSession().getAttribute("sessprice").toString());

int i=st.executeUpdate("INSERT INTO prods(uname,prod,price)values('"+uname+"','"+prod+"','"+price+"')");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
<br>
<br>
<br>
<h1 style="font-family: Algerian; color:#FFA500; "  >Thank you for purchasing <%= session.getAttribute("prod") %>,<%= session.getAttribute("uname")%>, at price <%= session.getAttribute("sessprice") %></h1>
        <div class="single-product-area section-padding-100 clearfix">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-7">
                        <div class="single_product_thumb">
                            <div id="product_details_slider" class="carousel slide" data-ride="carousel">
							<table border="1">
							<tr>
							<td>Name</td>
							<td>Mobile Number</td>
							<td>Address</td>						
							</tr>                        
                            <%
							String id = request.getSession().getAttribute("userid").toString();
							try{
							Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/users", "root", "root");
							Statement st=conn.createStatement();
							String sql ="select * from members where uname='"+id+"' ";
							ResultSet resultSet = st.executeQuery(sql);
							
							while(resultSet.next()){
							%>
							<table>
							<tr>
							<th><%=resultSet.getString("name") %></th>
							<th><%=Long.parseLong(resultSet.getString("mobile")) %></th>
							<th><%=resultSet.getString("address") %></th>
							</tr>
							</table>
							<%
							}
							conn.close();
							} catch (Exception e) {
							e.printStackTrace();
							}
							%>
							</table>

							<form action="edit.jsp">
							    <button type="submit" class="btn amado-btn">Edit Your Info</button>
							</form>							                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

							
    <!-- ##### Main Content Wrapper End ##### -->


    <!-- ##### Footer Area Start ##### -->
<footer class="footerbg">
    <div class="container" style="color:grey;">
        <div class="row">
            <div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">
                <div class="row">
                    <div class="col-12 col-sm-6 col-md-6 col-lg-3 text-center text-sm-left" data-wow-duration="1s">
                        <h4 class="atom-text-bolder fs-20">Products</h4>
                        <ul class="list">
                            <li><a href="https://www.atomtech.in/products/online-payment-gateway-india">Payment Gateway</a></li>
                            <li><a href="https://www.atomtech.in/products/cardswipe-pos-machine">POS Machine</a></li>
                            <li><a href="https://www.atomtech.in/products/ivr-payment-solution">IVR Payments</a></li>
                            <li><a href="https://www.atomtech.in/products/mgalla-payment-app">mGalla-Payment App</a></li>
                        </ul>
                    </div>
                    <div class="col-12col-sm-6 col-md-6 col-lg-3 text-center text-sm-left" data-wow-duration="1.25s">
                        <h4 class="atom-text-bolder fs-20">Company</h4>
                        <ul class="list">
                            <li><a href="https://www.atomtech.in/company/about">About Us</a></li>
                            <li><a href="https://www.atomtech.in/company/events">Events</a></li>
                            <li><a href="https://www.atomtech.in/career">Careers</a></li>
                            <li><a href="https://www.atomtech.in/contact">Contact Us</a></li>
                        </ul>

                    </div>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-3 text-center text-sm-left" data-wow-duration="1.5s">
                        <h4 class="atom-text-bolder fs-20">Resources</h4>
                        <ul class="list">
                            <li><a href="https://www.atomtech.in/help-resource/payment-gateway-integration-kits">Integration Kit</a></li>
                            <li><a href="https://www.atomtech.in/blog/">Blog</a></li>
                            <li><a href="https://www.atomtech.in/help-resource/pr-and-media">PR &amp; Media</a></li>
                            <li><a href="https://www.atomtech.in/help-resource/faqs">FAQs</a></li>
                        </ul>

                    </div>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-3 text-center text-sm-left" data-wow-duration="2s">
                        <h4 class="atom-text-bolder fs-20">Quick Links</h4>
                        <ul class="list">
                         
                            <li><a href="https://www.atomtech.in/privacy">Privacy Policy</a></li>
                            <li><a href="https://www.atomtech.in/contact/atom-customer-care">Helpdesk</a></li>
                            <li><a href="https://www.atomtech.in/company/banned-products">Banned Products</a></li>

                        </ul>

                    </div>

                </div>
            </div>
            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 text-center text-sm-left ">
                <p class="text-center text-sm-left mb-0 text-white font-size-14"><b>Helpdesk POS</b> : 1860 233 4959</p>
                <p class="text-center text-sm-left mb-0 text-white font-size-14"><b>Helpdesk PG</b> : 022 6686 4095</p>
                <p class="text-center text-sm-left mt-0 text-white font-size-14"><b>New Sales</b> : 022 3985 3410</p>

            </div>
        </div>
        <div class="row mt-5">
            <div class="col-xs-12 col-sm-4 text-center text-sm-left">
                <a href="https://www.facebook.com/atompaymentsolution/" target="_blank"><i class="fab fa-facebook fa-2x mr-3 wow bounceIn text-white"></i></a>
                <a href="https://twitter.com/AtomTech_India" target="_blank"><i class="fab fa-twitter-square fa-2x mr-3 wow bounceIn  text-white"></i></a>
                <a href="https://www.linkedin.com/company/atom-technologies-ltd_2" target="_blank"><i class="fab fa-linkedin fa-2x mr-3 wow bounceIn text-white"></i></a>
                <!--<a href="https://plus.google.com/u/0/112719639603825651512" target="_blank"><i class="fab fa-google-plus-square fa-2x mr-3 wow bounceIn text-white"></i></a>-->
                <a href="https://www.instagram.com/atomtechnologiesltd/" target="_blank"><i class="fab fa-instagram fa-2x mr-3 wow bounceIn text-white"></i></a>
                <a href="https://www.youtube.com/channel/UCwUFZKqLKKCDnlRiEo-Q79Q" target="_blank"><i class="fab fa-youtube fa-2x mr-3 wow bounceIn text-white"></i></a>
                <p class="mt-3 text-black font-size-14">&copy;
                    2019 All Rights Reserved | <a href="https://www.atomtech.in/" class="text-black">atom technologies ltd.</a>
                </p>
            </div>
            <div class="col-xs-12 col-sm-8 text-center text-sm-right">
            </div>
            <!--<div class="col-xs-12 col-sm-12 text-center" style="padding-bottom:20px;">-->
        </div>
    </div>
</footer>
    <!-- ##### Footer Area End ##### -->

    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="js/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>

</body>

</html>