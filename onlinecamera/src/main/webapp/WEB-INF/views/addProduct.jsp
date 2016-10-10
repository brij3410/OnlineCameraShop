<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
	<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.min.js"></script>
	
	<script type="text/javascript">
	var app = angular.module('app', []);
	app.controller('ProductController', [ '$scope', '$http', ProductController ]);

	function ProductController($scope, $http) {
		$http.get('http://localhost:8080/onlinecamera/getAllProducts')
				.success(function(data) {
					$scope.products = data;
				}).error(function() {
					$scope.error = "An Error has occured while loading posts!";
				}); 
	} 
</script>
<title>Product Management</title>
</head>
<body>
<%@include file="Commonheader.jsp"%>

<c:choose>
	
<c:when test="${productData.productId==null}">

<form:form method="POST" commandName="save_product"
		action="${pageContext.request.contextPath}/saveProduct" enctype="multipart/form-data">
			<div align="center" class="table-responsive">
   				<table style="width: 40%" class="table table-condensed table-small-font">
   					<tr>
   						<h3><centre> PRODUCT</centre></h3>
   					</tr>
    				<tr>
					<td style="width: 25%">
						<form:label path="productId">Product ID:</form:label>
					</td>
					<td> 
						<form:input path="productId" /><br /> 
						<form:errors path="productId" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td style="width: 25%">
						<form:label path="productName">Product Name:</form:label>
					</td>
					<td> 
						<form:input path="productName"/><br /> 
						<form:errors path="productName" cssClass="error" />
					</td>
				</tr>
				<tr>
				<td style="width: 25%">
						<form:label path="brand.brandId">BRAND:</form:label>
					</td>
				<td class="form-group" style="width: 25%">
                     <form:select path="brand.brandId" class="form-control" items="${brandList}" itemValue="brandId" itemLabel="brandName" required="true" />
				</td>
				</tr>
				<tr>
				<td style="width: 25%">
						<form:label path="category.categoryId">CATEGORY:</form:label>
					</td>
				<td class="form-group" style="width: 25%">
                     <form:select path="category.categoryId" class="form-control" items="${categoryList}" itemValue="categoryId" itemLabel="categoryName" required="true" />
				</td>
				</tr>
				
				<tr>
				<td style="width: 25%">
						<form:label path="supplier.supplierId">SUPPLIER:</form:label>
					</td>
				<td class="form-group" style="width: 25%">
                     <form:select path="supplier.supplierId" class="form-control" items="${supplierList}" itemValue="supplierId" itemLabel="supplierName" required="true" />
				</td>
				</tr>
				<tr>
					<td style="width: 25%">
						<form:label path="prise">Product Prise:</form:label>
					</td>
					<td> 
						<form:input path="prise"/><br /> 
						<form:errors path="prise" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td style="width: 25%">
						<form:label path="proDesc">Product Description:</form:label>
					</td>
					<td> 
						<form:input path="proDesc"/><br /> 
						<form:errors path="proDesc" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td style="width: 25%"><form:label path="product_image"> PRODUCT IMAGE:</form:label></td>
					<td><input type="file" name="prdFile"></td>
					<br/>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-success"
							style="width: 150px;">ADD</button>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="error">${error}</td>
				</tr>
			</table>
		</div>
	</form:form>
	
	
</c:when>

<c:otherwise>

<form:form method="POST" commandName="save_edit_product"
		action="${pageContext.request.contextPath}/saveEditProduct" enctype="multipart/form-data">
			<div align="center" class="table-responsive">
   				<table style="width: 40%" class="table table-condensed table-small-font">
   					<tr>
   						<h3><centre>EDIT PRODUCT</centre></h3>
   					</tr>
   					<tr>
					<td style="width: 25%">
						<form:label path="productId">Product ID:</form:label>
					</td>
					<td> 
						<form:input path="productId" /><br /> 
						<form:errors path="productId" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td style="width: 25%">
						<form:label path="productName">Product Name:</form:label>
					</td>
					<td> 
						<form:input path="productName"/><br /> 
						<form:errors path="productName" cssClass="error" />
					</td>
				</tr>
				<tr>
				<td style="width: 25%">
						<form:label path="brand.brandId">BRAND:</form:label>
					</td>
				<td class="form-group" style="width: 25%">
                     <form:select path="brand.brandId" class="form-control" items="${brandList}" itemValue="brandId" itemLabel="brandName" required="true" />
				</td>
				</tr>
				<tr>
				<td style="width: 25%">
						<form:label path="category.categoryId">CATEGORY:</form:label>
					</td>
				<td class="form-group" style="width: 25%">
                     <form:select path="category.categoryId" class="form-control" items="${categoryList}" itemValue="categoryId" itemLabel="categoryName" required="true" />
				</td>
				</tr>
				
				<tr>
				<td style="width: 25%">
						<form:label path="supplier.supplierId">SUPPLIER:</form:label>
					</td>
				<td class="form-group" style="width: 25%">
                     <form:select path="supplier.supplierId" class="form-control" items="${supplierList}" itemValue="supplierId" itemLabel="supplierName" required="true" />
				</td>
				</tr>
				<tr>
					<td style="width: 25%">
						<form:label path="prise">Product Prise:</form:label>
					</td>
					<td> 
						<form:input path="prise"/><br /> 
						<form:errors path="prise" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td style="width: 25%">
						<form:label path="proDesc">Product Description:</form:label>
					</td>
					<td> 
						<form:input path="proDesc"/><br /> 
						<form:errors path="proDesc" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td style="width: 25%"><form:label path="product_image"> PRODUCT IMAGE:</form:label></td>
					<td><input type="file" name="prdFile"></td>
					<br/>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-success"
							style="width: 150px;">SAVE CHANGES</button>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="error">${error}</td>
				</tr>
			</table>
		</div>
	</form:form>
	</c:otherwise>
</c:choose>

<div align="center" class="table-responsive">
   		<table style="width: 80%" class="table table-condensed table-small-font table table-hover">
			<tr>
				<td>
					<div data-ng-app="app" data-ng-controller="ProductController" align="center">
					<div style="text-align: justify;" align="center">
						Search Product:<input type="text" size="40" ng-model="searchTerm" /><br/>
					</div>
					<br/><br/>
					
					<table class="col-md-5 table-striped table-condensed table table-hover table table-bordered table table-striped" style="width: 100%">
						<tr style="background-color: #D4D8D1; font-weight: bold;">
							<td style="width: 20%">PRODUCT ID</td>
							<td style="width: 20%">PRODUCT NAME</td>
							<td style="width: 15%">BRAND </td>
							<td style="width: 15%">CATEGORY </td>
							<td style="width: 15%">SUPPLIER </td>
							<td style="width: 15%">PRISE </td>
							<td style="width: 35%">PRODUCT IMAGE</td>
							<td style="width: 20%">OPERATION</td>
						</tr>
						<tr data-ng-repeat="pro in products | filter:searchTerm">
							<td style="font-weight: bold;">{{pro.productId}}</td>
							<td>{{pro.productName}}</td>
							<td>{{pro.brandName}}</td>
							<td>{{pro.categoryName}}</td>
							<td>{{pro.supplierName}}</td>
							<td>{{pro.prise}}</td>
							<td><img src ="<c:out value='{{pro.product_image}}'/>" width= "100px" height="50px"></td>
							
							<td>
								<a href="editProduct?productId={{pro.productId}}"  class="btn btn-primary" role="button" style="width: 92px">Edit</a>
								<a href="delProduct?productId={{pro.productId}}"  class="btn btn-info" role="button" style="width: 92px">Delete</a>
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
		</table> 
	</div>
</body>
<%@include file="Commonfooter.jsp"%>
</html>