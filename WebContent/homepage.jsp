<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Gitbit</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="Free-Template.co" />
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
  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="200">
  
  <%
		    Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users",
		            "root", "");
		    
		    Statement st = con.createStatement();
		    ResultSet rs;
	%>
		
  
  <!-- <div class="site-wrap"> -->
    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
    
    <header class="site-navbar py-3 js-site-navbar site-navbar-target" role="banner" id="site-navbar">

      <div class="container">
        <div class="row align-items-center">
          
          <div class="col-11 col-xl-2 site-logo">
            <h1 class="mb-0" style="color:white!important">GitBit</h1>
          </div>
          <div class="col-12 col-md-10 d-none d-xl-block">
            <nav class="site-navigation position-relative text-right" role="navigation">

              <ul class="site-menu js-clone-nav mx-auto d-none d-lg-block">
                <li><a href="#" class="nav-link">Home</a></li>
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

    <div class="site-blocks-cover overlay" style="background-image: url(images/images.jpg);" data-aos="fade" data-stellar-background-ratio="0.5" id="section-home">
      <div class="container">
        <div class="row align-items-center justify-content-center text-center">

          <div class="col-md-8" data-aos="fade-up" data-aos-delay="400">
            

            <h1 class="text-white font-weight-light text-uppercase font-weight-bold" data-aos="fade-up">Version Control <br>||<br> Networking </h1>
          </div>
        </div>
      </div>
    </div>  
  
      <div class="site-section" id="section-blog">
      <div class="container">
        <div class="row justify-content-center mb-5">
          <div class="col-md-7 text-center border-primary">
            <h2 class="font-weight-light text-primary">Posts by Other Users</h2>
          </div>
        </div>
		<%
			String userid=session.getAttribute("userid").toString();
		    rs = st.executeQuery("select * from userpost");
		    if (rs.next()) {
		        String uname = request.getSession().getAttribute("uname").toString();    
		%>

        <div class="row mb-5 align-items-stretch">
          <div class="col-md-6 col-lg-4 mb-4 mb-lg-4" data-aos="fade-up">
            <div class="h-entry">
              <img src="images/images (2).jpg" alt="Image" class="img-fluid">
              <h2 class="font-size-regular"><a href="#"><%= rs.getString("title")%></a></h2>
              <div class="meta mb-4">by <%= uname %> <span class="mx-2">&bullet;</span> 23-10-2019 <span class="mx-2">&bullet;</span><a><%=rs.getString("topic") %> </a></div>
              <p><%= rs.getString("post")%></p>
            </div> 
          </div>
		
		<%} %>

        </div>
      </div>
    </div>
  
  
    <div class="site-section bg-image overlay" style="background-image: url('images/images(1).jpg');" id="section-how-it-works">
      <div class="container">
        <div class="row justify-content-center mb-5">
          <div class="col-md-7 text-center border-primary">
            <h2 class="font-weight-light text-primary" data-aos="fade">How It Works</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="100">
            <div class="how-it-work-item">
              <span class="number">1</span>
              <div class="how-it-work-body">
                <h2>Upload your code</h2>
                <p class="mb-5">Upload your code for the rest of the gitbitters to see..</p>
                <ul class="ul-check list-unstyled success">
                  <li class="text-white">Upload code</li>
                  <li class="text-white">Edit whenever and wherever necessary</li>
                  
                </ul>
              </div>
            </div>
          </div>

          <div class="col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="200">
            <div class="how-it-work-item">
              <span class="number">2</span>
              <div class="how-it-work-body">
                <h2>Share!!</h2>
                <p class="mb-5">Share your code with your friends and other users..</p>
                <ul class="ul-check list-unstyled success">
                  <li class="text-white">Share your code</li>
                  <li class="text-white">Help out other gitbitters</li>
                  
                </ul>
              </div>
            </div>
          </div>

          <div class="col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="300">
            <div class="how-it-work-item">
              <span class="number">3</span>
              <div class="how-it-work-body">
                <h2>Browse</h2>
                <p class="mb-5">Browse your fellow gitbitters code and seek their help if need be..</p>
                <ul class="ul-check list-unstyled success">
                  <li class="text-white">Browse for other people's codes</li>
                  <li class="text-white">Follow them if you like their posts</li>
                  <li class="text-white">Seek the help of their code when necessary!</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    
  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <!-- script src="js/owl.carousel.min.js"></script-->
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/jquery.countdown.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/bootstrap-datepicker.min.js"></script>
  <script src="js/aos.js"></script>
	<script>!function(e){e.fn.classyNav=function(n){var a=e(".classy-nav-container"),s=e(".classynav ul"),o=e(".classynav > ul > li"),l=e(".classy-navbar-toggler"),i=e(".classycloseIcon"),t=e(".navbarToggler"),d=e(".classy-menu"),r=e(window),c=e.extend({theme:"light",breakpoint:991,openCloseSpeed:300,alwaysHidden:!1,openMobileMenu:"left",dropdownRtl:!1,stickyNav:!1,stickyFooterNav:!1},n);return this.each(function(){function n(){window.innerWidth<=c.breakpoint?a.removeClass("breakpoint-off").addClass("breakpoint-on"):a.removeClass("breakpoint-on").addClass("breakpoint-off")}"light"!==c.theme&&"dark"!==c.theme||a.addClass(c.theme),"left"!==c.openMobileMenu&&"right"!==c.openMobileMenu||a.addClass(c.openMobileMenu),!0===c.dropdownRtl&&a.addClass("dropdown-rtl"),l.on("click",function(){t.toggleClass("active"),d.toggleClass("menu-on")}),i.on("click",function(){d.removeClass("menu-on"),t.removeClass("active")}),o.has(".dropdown").addClass("cn-dropdown-item"),o.has(".megamenu").addClass("megamenu-item"),s.find("li a").each(function(){e(this).next().length>0&&(e(this).parent("li").addClass("has-down").append('<span class="dd-trigger"></span>'),e(this).parent("li").addClass("has-down").append('<span class="dd-arrow"></span>'))}),s.find("li .dd-trigger").on("click",function(n){n.preventDefault(),e(this).parent("li").children("ul").stop(!0,!0).slideToggle(c.openCloseSpeed),e(this).parent("li").toggleClass("active")}),e(".megamenu-item, .cn-dropdown-item").addClass("pr12"),e(".megamenu-item").removeClass("has-down pr12"),s.find("li .dd-trigger").on("click",function(n){n.preventDefault(),e(this).parent("li").children(".megamenu").slideToggle(c.openCloseSpeed)}),n(),r.on("resize",function(){n()}),!0===c.alwaysHidden&&a.addClass("breakpoint-on").removeClass("breakpoint-off"),!0===c.stickyNav&&r.on("scroll",function(){r.scrollTop()>0?a.addClass("classy-sticky"):a.removeClass("classy-sticky")}),!0===c.stickyFooterNav&&a.addClass("classy-sticky-footer")})}}(jQuery);</script>
  <script src="js/main.js"></script>
    
  </body>
</html>