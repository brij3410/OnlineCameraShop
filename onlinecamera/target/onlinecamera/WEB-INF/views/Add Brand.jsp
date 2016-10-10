<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
	<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.min.js"></script>
	
	<script type="text/javascript">
	var app = angular.module('app', []);
	app.controller('BrandControlle', [ '$scope', '$http', BrandController ]);

	function BrandController($scope, $http) {
		$http.get('http://localhost:8080/onlinecamera/getAllBrands')
				.success(function(data) {
					$scope.Brands = data;
				}).error(function() {
					$scope.error = "An Error has occured while loading posts!";
				}); 
	} 
</script>
<title>Add Brand</title>
</head>
<body>
<br />
	<a href="addNewBrand">Add new Brand</a>
	<hr />
	<b>List all Brands</b>
	<br />
	  
	<div align="center" class="table-responsive">
   		<table style="width: 80%" class="table table-condensed table-small-font">
			<tr>
				<td>
					<div data-ng-app="app" data-ng-controller="BrandController" align="center">
					<div style="text-align: justify;">
						Search Brand:<input type="text" size="40" ng-model="searchTerm" /><br/>
					</div>
					<br/><br/>
					
					<table class="col-md-5 table-striped table-condensed" style="width: 55%">
						<tr style="background-color: #D4D8D1; font-weight: bold;">
							<td style="width: 5%">BRAND ID#</td>
							<td style="width: 15%">BRAND NAME</td>
						</tr>
						<tr data-ng-repeat="brand in Brands | filter:searchTerm">
							<td style="font-weight: bold;">{{brand.brandId}}</td>
							<td>{{brand.brandName}}</td>
							
							<td>
								<a href="editBrand?brandId={{brand.brandId}}"  class="btn btn-primary" role="button" style="width: 92px">Edit</a>
								<a href="delBrand?brandId={{brand.brandId}}"  class="btn btn-info" role="button" style="width: 92px">Delete</a>
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
		</table> 
	</div>
</body>
</html>