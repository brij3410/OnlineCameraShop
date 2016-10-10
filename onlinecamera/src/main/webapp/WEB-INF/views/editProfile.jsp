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
	
<title>Edit Profile</title>

</head>
<body>

<form:form  role="form" method="POST" commandName="save_edit_user"
		action="${pageContext.request.contextPath}/saveEditUser" enctype="multipart/form-data">
			<div align="center" class="table-responsive">
   				<table style="width: 40%" class="table table-condensed table-small-font">
   					<tr>
   						<td colspan="2">
   							<a style="font-size: 15px;" href="${pageContext.request.contextPath}/">Home</a></h1>
   						</td>
   					</tr>
    				<tr>
					<td style="width: 25%">
						<form:label path="email">Email ID:</form:label>
					</td>
					<td> 
						<form:input path="email" /><br /> 
						<form:errors path="email" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td style="width: 25%">
						<form:label path="passWord">PASSWORD:</form:label>
					</td>
					<td> 
						<form:input type="password" path="passWord"/><br /> 
						<form:errors path="passWord" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td style="width: 25%">
						<form:label path="firstName">FIRST NAME:</form:label>
					</td>
					<td> 
						<form:input path="firstName" /><br /> 
						<form:errors path="firstName" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td style="width: 25%">
						<form:label path="lastName">LAST NAME:</form:label>
					</td>
					<td> 
						<form:input path="lastName" /><br /> 
						<form:errors path="lastName" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td style="width: 25%">
						<form:label path="mobile">MOBILE NO:</form:label>
					</td>
					<td> 
						<form:input path="mobile" /><br /> 
						<form:errors path="mobile" cssClass="error" />
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<button align="=centre" type="submit" class="btn btn-success"
							style="width: 150px;">ADD</button>
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