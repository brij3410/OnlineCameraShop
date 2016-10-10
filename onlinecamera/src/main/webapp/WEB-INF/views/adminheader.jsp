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
  <div class="col-sm-2 col-lg-2 col-md-2 logo1" >
  <img src="resources/cameras/logo.jpg" height="100px" width="100px">
  </div>
  <div class="col-sm-4 col-lg-4 col-md-4 header-text"> The Online CameraShop</div>
	<div class="col-sm-6 col-lg-6 col-md-6">
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
        <li><a href="Add Brand">Manage Brand</a></li>
        <li><a href="Addcategory">Manage Category</a></li>
        <li><a href="Addsupplier">Manage Supplier</a></li>
        <li><a href="Addproduct">Manage Product</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<li><a href="#"><h5>Welcome${user.firstName}</h5></a></li>
		<li><a href="#"><h5>${success }</h5></a></li>
		<li><a href="#"><h5>${loginuser.firstName}</h5></a></li>
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
      </ul>
    </div>
  </div>
</nav>

	
</body>
</html>