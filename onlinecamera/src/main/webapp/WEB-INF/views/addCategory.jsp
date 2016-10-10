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
	app.controller('CategoryController', [ '$scope', '$http', CategoryController ]);

	function CategoryController($scope, $http) {
		$http.get('http://localhost:8080/onlinecamera/getAllCategorys')
				.success(function(data) {
					$scope.categorys = data;
				}).error(function() {
					$scope.error = "An Error has occured while loading posts!";
				}); 
	} 
</script>
<title>Category Management</title>
</head>
<body>

<%@include file="Commonheader.jsp"%>
<c:choose>
	
<c:when test="${categoryData.categoryId==null}">

<form:form method="POST" commandName="save_category"
		action="${pageContext.request.contextPath}/saveCategory">
			<div align="center" class="table-responsive">
   				<table style="width: 40%" class="table table-condensed table-small-font">
   					<tr>
   						<h3><center> CATEGORY</center></h3>
   					</tr>
    				<tr>
					<td style="width: 25%">
						<form:label path="categoryId">Category ID:</form:label>
					</td>
					<td> 
						<form:input path="categoryId" /><br /> 
						<form:errors path="categoryId" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td style="width: 25%">
						<form:label path="categoryName">Category Name:</form:label>
					</td>
					<td> 
						<form:input path="categoryName"/><br /> 
						<form:errors path="categoryName" cssClass="error" />
					</td>
				</tr>
				<tr>
				<td style="width: 25%">
						<form:label path="brand.brandId">BRAND:</form:label>
					</td>
				<td class="form-group" style="width: 25%">
                     <form:select path="brand.brandId" class="form-control" items="${brandList}" itemValue="brandId" itemLabel="brandName" required="true" />
				</td>
				<tr>
					<td style="width: 25%">
						<form:label path="catDesc">Category Description:</form:label>
					</td>
					<td> 
						<form:input path="catDesc"/><br /> 
						<form:errors path="catDesc" cssClass="error" />
					</td>
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

<form:form method="POST" commandName="save_edit_category"
		action="${pageContext.request.contextPath}/saveEditCategory">
			<div align="center" class="table-responsive">
   				<table style="width: 40%" class="table table-condensed table-small-font">
   					<tr>
   						<td colspan="2"><h1>Edit Category&nbsp;&nbsp;&nbsp;
   							<a style="font-size: 15px;" href="${pageContext.request.contextPath}/">Home</a></h1>
   						</td>
   					</tr>
    				<tr>
					<tr>
					<td style="width: 25%">
						<form:label path="categoryId">Category ID:</form:label>
					</td>
					<td> 
						<form:input path="categoryId" /><br /> 
						<form:errors path="categoryId" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td style="width: 25%">
						<form:label path="categoryName">Category Name:</form:label>
					</td>
					<td> 
						<form:input path="categoryName"/><br /> 
						<form:errors path="categoryName" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td class="form-group">
                     <form:select path="brand.brandId" class="form-control" items="${brandList}" itemValue="brandId" itemLabel="brandName" required="true" />
                </td>
				</tr>
				<tr>
					<td style="width: 25%">
						<form:label path="catDesc">Category Description:</form:label>
					</td>
					<td> 
						<form:input path="catDesc"/><br /> 
						<form:errors path="catDesc" cssClass="error" />
					</td>
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
					<div data-ng-app="app" data-ng-controller="CategoryController" align="center">
					<div style="text-align: justify;" align="center">
						Search Category:<input type="text" size="40" ng-model="searchTerm" /><br/>
					</div>
					<br/><br/>
					
					<table class="col-md-5 table-striped table-condensed table table-hover table table-bordered table table-striped" style="width: 100%">
						<tr style="background-color: #D4D8D1; font-weight: bold;">
							<td style="width: 20%">CATEGORY ID</td>
							<td style="width: 20%">CATEGORY NAME</td>
							<td style="width: 15%">BRAND </td>
							<td style="width: 30%">DESCRIPTION</td>
							<td style="width: 30%">OPERATION</td>
						</tr>
						<tr data-ng-repeat="cat in categorys | filter:searchTerm">
							<td style="font-weight: bold;">{{cat.categoryId}}</td>
							<td>{{cat.categoryName}}</td>
							<td>{{cat.brandName}}</td>
							<td>{{cat.catDesc}}</td>
							
							<td>
								<a href="editCategory?categoryId={{cat.categoryId}}"  class="btn btn-primary" role="button" style="width: 70px">Edit</a>
								<a href="delCategory?categoryId={{cat.categoryId}}"  class="btn btn-info" role="button" style="width: 70px">Delete</a>
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