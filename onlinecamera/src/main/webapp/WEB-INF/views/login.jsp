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
	
<title>Login </title>

</head>
<body>
<%@include file="Commonheader.jsp"%>

<form:form  role="form" method="POST" action="${pageContext.request.contextPath}/loginUser" commandName="log">
			<div align="center" class="table-responsive">
   				<table style="width: 40%" class="table table-condensed table-small-font">
   					<tr>
   					<h4><center>Login Here</center></h4>
   					</tr>
    				<tr>
					<td style="width: 25%">
						<form:label path="email">Email ID:</form:label>
					</td>
					<td> 
						<form:input path="email" placeholder="Email" /><br /> 
						<form:errors path="email" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td style="width: 25%">
						<form:label path="passWord">PASSWORD:</form:label>
					</td>
					<td> 
						<form:input type="password" path="passWord" placeholder="Password"/><br /> 
						<form:errors path="passWord" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button align="=centre" type="submit" class="btn btn-success"
							style="width: 150px;">LOGIN</button>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="error">${error}</td>
				</tr>
			</table>
		</div>
</form:form>

<h2><center>${loginfail}</center></h2>

</body>
<%@include file="Commonfooter.jsp"%>
</html>