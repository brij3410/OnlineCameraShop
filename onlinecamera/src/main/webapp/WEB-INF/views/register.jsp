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
	
<title>User Registration</title>
</head>
<body>
<%@include file="Commonheader.jsp"%>

<form:form  role="form" method="POST" commandName="save_user"
		action="${pageContext.request.contextPath}/saveUser" enctype="multipart/form-data">
			<div align="center" class="table-responsive">
   				<table style="width: 40%" class="table table-condensed table-small-font">
   					<tr>
   					<h4><center>Register Here</center></h4>
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
					<td style="width: 25%">
						<form:label path="firstName">FIRST NAME:</form:label>
					</td>
					<td> 
						<form:input path="firstName" placeholder="First Name" /><br /> 
						<form:errors path="firstName" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td style="width: 25%">
						<form:label path="lastName">LAST NAME:</form:label>
					</td>
					<td> 
						<form:input path="lastName" placeholder="Last Name" /><br /> 
						<form:errors path="lastName" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td style="width: 25%">
						<form:label path="mobile">MOBILE NO:</form:label>
					</td>
					<td> 
						<form:input path="mobile" placeholder="Mobile number"/><br /> 
						<form:errors path="mobile" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td style="width: 25%">
						<form:label path="dob">DATE OF BIRTH:</form:label>
					</td>
					<td> 
						<form:input path="dob" placeholder="YYYY/MM/DD" /><br /> 
						<form:errors path="dob" cssClass="error" />
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<button align="=centre" type="submit" class="btn btn-success"
							style="width: 150px;">REGISTER</button>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="error">${error}</td>
				</tr>
			</table>
		</div>
</form:form>

<h1>${success}</h1>
<h1>${msg}</h1>


</body>
<%@include file="Commonfooter.jsp"%>
</html>