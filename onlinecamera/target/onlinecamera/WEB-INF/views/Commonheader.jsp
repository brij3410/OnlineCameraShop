<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="resources/css/half-slider.css">
  <link rel="stylesheet" href="resources/css/shop-homepage.css">
  <link rel="stylesheet" href="resources/css/style.css">
	<link rel="stylesheet" href="resources/font-awesome-4.6.3/css/font-awesome.min.css" >
  <link rel="stylesheet" href="resources/css/social.css">
  <script src="resources/js/jquery-3.1.0.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
  


<div class="row">
  <div class="col-sm-2 logo1" >
  <img src="resources/cameras/logo.jpg" height="100px" width="100px">
  </div>
  <div class="col-sm-4 header-text"> The Online CameraShop</div>
	<div class="col-sm-6">
		<div class="container">
			
				<div class="text-center center-block">
					
						<a href="https://www.facebook.com"><i id="social-fb" class="fa fa-facebook-square fa-3x social"></i></a>
						<a href="https://twitter.com"><i id="social-tw" class="fa fa-twitter-square fa-3x social"></i></a>
						<a href="https://plus.google.com"><i id="social-gp" class="fa fa-google-plus-square fa-3x social"></i></a>
						<a href="mailto:bootsnipp@gmail.com"><i id="social-em" class="fa fa-envelope-square fa-3x social"></i></a>
				</div>
			
		</div>
	</div>
</div>  
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
  <div class="collapse navbar-collapse " id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="Home">Home</a></li>
        <li><a href="Login">Login</a></li>
        <li><a href="Register">Register</a></li>
        <li><a href="Aboutus">About us</a></li>
        <li><a href="Contactus">Contact us</a></li>
        <li><a href="Add Brand">Add Brand</a></li>
        <li><a href="Product">Product</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
      </ul>
    </div>
  </div>
</nav>

	<header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
			<li data-target="#myCarousel" data-slide-to="5"></li>
			<li data-target="#myCarousel" data-slide-to="6"></li>
        </ol>

        <!-- Wrapper for Slides -->
        <div class="carousel-inner">
            <div class="item active">
                <!-- Set the first background image using inline CSS below. -->
                   <div class="fill" style="background-image;">
						<img src="resources/cameras/slider images/sd8.jpg" height="315px" width="1350px" >
				   </div>
                <div class="carousel-caption">
                    <h2>Caption 1</h2>
                </div>
            </div>
            <div class="item">
                <!-- Set the second background image using inline CSS below. -->
					<div class="fill" style="background-image;">
						<img src="resources/cameras/slider images/sd6.jpg" height="315px" width="1350px" >
				   </div>
                <div class="carousel-caption">
                    <h2>Caption 2</h2>
                </div>
            </div>
            <div class="item">
                <!-- Set the third background image using inline CSS below. -->
                <div class="fill" style="background-image;">
						<img src="resources/cameras/slider images/sd2.jpg" height="315px" width="1350px" >
				   </div>
                <div class="carousel-caption">
                    <h2>Caption 3</h2>
                </div>
            </div>
			
			<div class="item">
                <!-- Set the third background image using inline CSS below. -->
                <div class="fill" style="background-image;">
						<img src="resources/cameras/slider images/sd9.jpg" height="315px" width="1350px" >
				   </div>
                <div class="carousel-caption">
                    <h2>Caption 4</h2>
                </div>
            </div>
			
			<div class="item">
                <!-- Set the third background image using inline CSS below. -->
                <div class="fill" style="background-image;">
						<img src="resources/cameras/slider images/sd7.jpg" height="315px" width="1350px" >
				   </div>
                <div class="carousel-caption">
                    <h2>Caption 5</h2>
                </div>
            </div>
            
            <div class="item">
                <!-- Set the third background image using inline CSS below. -->
                <div class="fill" style="background-image;">
						<img src="resources/cameras/slider images/sd5.jpg" height="315px" width="1350px" >
				   </div>
                <div class="carousel-caption">
                    <h2>Caption 5</h2>
                </div>
            </div>
            
            <div class="item">
                <!-- Set the third background image using inline CSS below. -->
                <div class="fill" style="background-image;">
						<img src="resources/cameras/slider images/sd1.jpg" height="315px" width="1350px" >
				   </div>
                <div class="carousel-caption">
                    <h2>Caption 5</h2>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>

    </header>

</body>
</html>