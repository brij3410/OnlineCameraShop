<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product List</title>
</head>
<body>
	<%@include file="Commonheader.jsp"%>


	<div class="container">

		<div class="row">
			<div class="col-sm-2 col-lg-2 col-md-2">
				
				<h3>Categories</h3>

				<c:forEach items="${brandList.category}" var="categoryList">
					<a
						href="showFilterProductList?id=${categoryList.categoryId}&bid=${brandList.brandId}">${categoryList.categoryName}</a>
					<br />
				</c:forEach>

			</div>
			<div class="col-sm-10 col-lg-10 col-md-10">
				
						<c:forEach items="${productShow}" var="productShow">
								<div class="col-sm-4 col-lg-4 col-md-4">
                        			<div class="thumbnail">
                        				<img src="${productShow.product_image}" height="200px" width="200px" />
											<div class="caption">
											<h4 class="pull-right">Rs.${productShow.prise}</h4>
												<h4><a href="showProductdetail?id=${productShow.productId}">${productShow.productName}</a></h4>
												<a href="addcart?id=${productShow.productId}"><button type="button" class="btn btn-warning"> Add To Cart  <span class="glyphicon glyphicon-shopping-cart"></span></button></a><br/>
												<a href="showProductdetail?id=${productShow.productId}"><button type="button" class="btn btn-success">Show Details</button></a>
											</div>
									</div>
								</div>	
											
						</c:forEach>
			</div>
					
			<div class="col-sm-9 col-lg-9 col-md-9">
						
					<c:forEach items="${categoryList.product}" var="productList">
							
							<div class="col-sm-4 col-lg-4 col-md-4">
                        			<div class="thumbnail">
                        				<img src="${productList.product_image}" height="250px" width="350px" />
                        					<div class="caption">
												<h4 class="pull-right">Rs.${productList.prise}</h4>
												<h4><a href="showProductdetail?id=${productList.productId}">${productList.productName}</a></h4><br/>
												<a href="addcart?id=${productList.productId}"><button type="button" class="btn btn-warning"> Add To Cart  <span class="glyphicon glyphicon-shopping-cart"></span></button></a><br/>
												<a href="showProductdetail?id=${productList.productId}"><button type="button" class="btn btn-success">Show Details</button></a>
											</div>
									</div>
								</div>			
						</c:forEach>
				

		</div>
	</div>
	<%@include file="Commonfooter.jsp"%>
</html>