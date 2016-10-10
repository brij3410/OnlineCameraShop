<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.min.js"></script>

<script type="text/javascript">
	var app = angular.module('app', []);
	app.controller('BrandControlle', [ '$scope', '$http', BrandController ]);

	function BrandController($scope, $http) {
		$http.get('http://localhost:8080/onlinecamera/getAllBrands').success(
				function(data) {
					$scope.Brands = data;
				}).error(function() {
			$scope.error = "An Error has occured while loading posts!";
		});
	}
</script>
<title>Brand Management</title>
</head>
<body>
	<%@include file="Commonheader.jsp"%>
	

	<c:choose>

		<c:when test="${brandData.brandId==null}">
			<form:form method="POST" commandName="save_brand"
				action="${pageContext.request.contextPath}/saveBrand"
				enctype="multipart/form-data">
				<div align="center" class="table-responsive">
					<table style="width: 40%"
						class="table table-condensed table-small-font">
						<tr>
							<h3><center>BRAND</center></h3>
						</tr>
						<tr>
							<td style="width: 25%"><form:label path="brandId">BRAND ID:</form:label>
							</td>
							<td><form:input path="brandId" size="40"
									value="${brandData.brandId}" /><br /> <form:errors
									path="brandId" cssClass="error" /></td>
						</tr>
						<tr>
							<td style="width: 25%"><form:label path="brandName">BRAND NAME:</form:label>
							</td>
							<td><form:input path="brandName" size="40"
									value="${brandData.brandName}" /><br /> <form:errors
									path="brandName" cssClass="error" /></td>
						</tr>

						<tr>
							<td style="width: 25%"><form:label path="brand_image"> BRAND IMAGE:</form:label></td>
							<td><input type="file" name="brndfile"></td>
							<br />
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
			</form>
			</div>

		</c:when>

		<c:otherwise>

			<form:form method="POST" commandName="save_edit_brand"
				action="${pageContext.request.contextPath}/saveEditBrand"
				enctype="multipart/form-data">
				<div align="center" class="table-responsive">
					<table style="width: 40%"
						class="table table-condensed table-small-font">
						<tr>
							<h3><center> EDIT BRAND</center></h3>
						</tr>
						<tr>
							<td style="width: 25%"><form:label path="brandId">BRAND ID:</form:label>
							</td>
							<td><form:input path="brandId" size="40"
									value="${brandData.brandId}" /><br /> <form:errors
									path="brandId" cssClass="error" /></td>
						</tr>
						<tr>
							<td style="width: 25%"><form:label path="brandName">BRAND NAME:</form:label>
							</td>
							<td><form:input path="brandName" size="40"
									value="${brandData.brandName}" /><br /> <form:errors
									path="brandName" cssClass="error" /></td>
						</tr>

						<tr>
							<td style="width: 25%"><form:label path="brand_image"> BRAND IMAGE:</form:label></td>
							<td><input type="file" name="brndfile"></td>
							<br />
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
		<table style="width: 100%" class="table table-hover">
			<tr>
				<td>
					<div data-ng-app="app" data-ng-controller="BrandController"
						align="center">
						<div style="text-align: justify;">
							Search Brand:<input type="text" size="40" ng-model="searchTerm" /><br />
						</div>
						<br /> <br />

						<table
							class="col-md-5 table-striped table-condensed table table-hover table table-bordered table table-striped"
							style="width: 100%" align="center">
							<tr style="background-color: #D4D8D1; font-weight: bold;">
								<td style="width: 20%">BRAND ID</td>
								<td style="width: 20%">BRAND NAME</td>
								<td style="width: 30%">BRAND LOGO</td>
								<td style="width: 30%">OPERATION</td>
							</tr>
							<tr data-ng-repeat="brand in Brands | filter:searchTerm">
								<td style="font-weight: bold;">{{brand.brandId}}</td>
								<td>{{brand.brandName}}</td>
								<td><img src="<c:out value='{{brand.brand_image}}'/>"
									width="100px" height="100px"></td>

								<td><a href="editBrand?brandId={{brand.brandId}}"
									class="btn btn-primary" role="button" style="width: 80px">Edit</a>
									<a href="delBrand?brandId={{brand.brandId}}"
									class="btn btn-info" role="button" style="width: 80px">Delete</a>
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