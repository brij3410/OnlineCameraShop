<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="Commonheader.jsp"%>

<div class="container">
<div class="row">
			<div class="col-sm-5 col-lg-5 col-md-5">
			<br/><br/><br/> <br/> <br/>
				<div class="thumbnails">
					<img src="${productList.product_image}" height="250px" width="350px" />
				</div>
			</div>
			
			<div class="col-sm-7 col-lg-7 col-md-7">
			<h2><center>Product Detail</center></h2><br/> <br/>
				<h3>PRODUCT NAME :${productList.productName}</h3><br/>
				<h3>PRODUCT PRISE :${productList.prise}</h3><br/>
				<h3>PRODUCT DESCRIPTION:${productList.proDesc}</h3><br/>
				<a href="addcart?id=${productList.productId}"><button type="button" class="btn btn-warning">Add to Cart  <span class="glyphicon glyphicon-shopping-cart"></span></button></a>
				<button type="button" class="btn btn-success">Buy Now</button>
			</div>
								

</div>
</body>
<%@include file="Commonfooter.jsp"%>
</html>