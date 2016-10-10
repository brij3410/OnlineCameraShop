<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Product List</title>
</head>

<body>

<table id="Product" class="table table stripped">
<thread>
<tr>
	<th>p_id</th>
	<th>p_name</th>
	<th>p_category</th>
	<th>p_cost</th>
</tr>
</thread>

<tbody>


<c:forEach items="${d1}" var="prod"> 
<tr>
<td><c:out value="${prod.p_id}"></c:out></td>
<td><c:out value="${prod.p_name}"></c:out></td>
<td><c:out value="${prod.p_category}"></c:out></td>
<td><c:out value="${prod.p_cost}"></c:out></td>
</tr>
</c:forEach>
</tbody>
</table>

</body>
</html>