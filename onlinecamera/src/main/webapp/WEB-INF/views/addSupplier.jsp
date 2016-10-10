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
	app.controller('SupplierControlle', [ '$scope', '$http', SupplierControlle ]);

	function SupplierControlle($scope, $http) {
		$http.get('http://localhost:8080/onlinecamera/getAllSuppliers')
				.success(function(data) {
					$scope.Suppliers = data;
				}).error(function() {
					$scope.error = "An Error has occured while loading posts!";
				}); 
	} 
</script>
<style type="text/css">
		.error
		{
			color: red;
		}
	</style>
<title>Supplier Managemennt</title>
</head>
<body>
<%@include file="Commonheader.jsp"%>
<c:choose>
	
<c:when test="${supplierData.supplierId==null}">

<form:form method="POST" commandName="save_supplier"
		action="${pageContext.request.contextPath}/saveSupplier">
			<div align="center" class="table-responsive">
   				<table style="width: 40%" class="table table-condensed table-small-font">
   					<tr>
   					<h3><center>Supplier Details</center></h3>
   					</tr>
    				<tr>
					<td style="width: 25%">
						<form:label path="supplierId">SUPPLIER ID:</form:label>
					</td>
					<td> 
						<form:input path="supplierId" /><br /> 
						<form:errors path="supplierId" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td style="width: 25%">
						<form:label path="supplierName">SUPPLIER NAME:</form:label>
					</td>
					<td> 
						<form:input path="supplierName"/><br /> 
						<form:errors path="supplierName" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td style="width: 25%">
						<form:label path="supplierNo">SUPPLIER NUMBER:</form:label>
					</td>
					<td> 
						<form:input path="supplierNo"/><br /> 
						<form:errors path="supplierNo" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td style="width: 25%">
						<form:label path="supplierEmail">SUPPLIER EMAIL:</form:label>
					</td>
					<td> 
						<form:input path="supplierEmail"/><br /> 
						<form:errors path="supplierEmail" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td style="width: 25%">
						<form:label path="supplierAddress">SUPPLIER ADDRESS:</form:label>
					</td>
					<td> 
						<form:input path="supplierAddress"/><br /> 
						<form:errors path="supplierAddress" cssClass="error" />
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<button align="center" type="submit" class="btn btn-success"
							style="width: 150px;">Add</button>
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


<form:form method="POST" commandName="save_edit_supplier"
		action="${pageContext.request.contextPath}/saveEditSupplier">
			<div align="center" class="table-responsive">
   				<table style="width: 40%" class="table table-condensed table-small-font">
   					<tr>
   						<h3><center>EDIt SUPPLIER DETAIL</center></h3>
   					</tr>
    				<tr>
    				<tr>
					<td style="width: 25%">
						<form:label path="supplierId">SUPPLIER ID:</form:label>
					</td>
					<td> 
						<form:input path="supplierId" /><br /> 
						<form:errors path="supplierId" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td style="width: 25%">
						<form:label path="supplierName">SUPPLIER NAME:</form:label>
					</td>
					<td> 
						<form:input path="supplierName"/><br /> 
						<form:errors path="supplierName" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td style="width: 25%">
						<form:label path="supplierNo">SUPPLIER NUMBER:</form:label>
					</td>
					<td> 
						<form:input path="supplierNo"/><br /> 
						<form:errors path="supplierNo" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td style="width: 25%">
						<form:label path="supplierEmail">SUPPLIER EMAIL:</form:label>
					</td>
					<td> 
						<form:input path="supplierEmail"/><br /> 
						<form:errors path="supplierEmail" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td style="width: 25%">
						<form:label path="supplierAddress">SUPPLIER ADDRESS:</form:label>
					</td>
					<td> 
						<form:input path="supplierAddress"/><br /> 
						<form:errors path="supplierAddress" cssClass="error" />
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
					<div data-ng-app="app" data-ng-controller="SupplierControlle" align="center">
					<div style="text-align: justify;">
						Search Supplier:<input type="text" size="40" ng-model="searchTerm" /><br/>
					</div>
					<br/><br/>
					
					<table class="col-md-5 table-striped table-condensed table table-hover table table-bordered table table-striped" style="width: 100%">
						<tr style="background-color: #D4D8D1; font-weight: bold;">
							<td style="width: 5%">SUPPLIER ID</td>
							<td style="width: 15%">SUPPLIER NAME</td>
							<td style="width: 15%">SUPPLIER NUMBER</td>
							<td style="width: 15%">SUPPLIER EMAIL</td>
							<td style="width: 30%">SUPPLIER ADDRESS</td>
							<td style="width: 30%">OPERATION</td>
						</tr>
						<tr data-ng-repeat="supplier in Suppliers | filter:searchTerm">
							<td style="font-weight: bold;">{{supplier.supplierId}}</td>
							<td>{{supplier.supplierName}}</td>
							<td>{{supplier.supplierNo}}</td>
							<td>{{supplier.supplierEmail}}</td>
							<td>{{supplier.supplierAddress}}</td>
							
							<td>
								<a href="editSupplier?supplierId={{supplier.supplierId}}"  class="btn btn-primary" role="button" style="width: 92px">Edit</a>
								<a href="delSupplier?supplierId={{supplier.supplierId}}"  class="btn btn-info" role="button" style="width: 92px">Delete</a>
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