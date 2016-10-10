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
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">+
	<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.min.js"></script>
	<style type="text/css">
		.error
		{
			color: red;
		}
	</style>
<title>Add new Brand </title>
</head>
<body>

<form:form method="POST" commandName="save_brand"
		action="${pageContext.request.contextPath}/saveBrand">
			<div align="center" class="table-responsive">
   				<table style="width: 40%" class="table table-condensed table-small-font">
   					<tr>
   						<td colspan="2"><h1>Add Brand&nbsp;&nbsp;&nbsp;
   							<a style="font-size: 15px;" href="${pageContext.request.contextPath}/">Home</a></h1>
   						</td>
   					</tr>
    				<tr>
					<td style="width: 25%">
						<form:label path="brandId">Brand ID:</form:label>
					</td>
					<td> 
						<form:input path="brandId" /><br /> 
						<form:errors path="brandId" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td style="width: 25%">
						<form:label path="brandName">Brand Name:</form:label>
					</td>
					<td> 
						<form:input path="brandName"/><br /> 
						<form:errors path="brandName" cssClass="error" />
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<button type="submit" class="btn btn-success"
							style="width: 150px;">Submit</button>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="error">${error}</td>
				</tr>
			</table>
		</div>
	</form:form>

</body>
</html>