<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Brand Management</title>
</head>
<body>
<form action="brand.do" method="post" commandName="brand">
<table>
	<tr>
		<td> Brand Id</td>
		<td> <input path="brandId" /></td>
	</tr>
	<tr>
		<td> Brand Name</td>
		<td><input path="brandName" /></td>
	</tr>
	<tr>
		<td colspan="2">
		<input type="submit" name="action" value="Add" />
		<input type="submit" name="action" value="Edit" />
		<input type="submit" name="action" value="Delete" />
		<input type="submit" name="action" value="Search" />
		</td>
</table>
</form>

<br>
<table>
	<th>BRAND ID</th>
	<th>BRAND NAME</th>
	<c:forEach items="${brandList}" var="brand">
	<tr>
		<td>${brand.brandId}</td>
		<td>${brand.brandName}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>