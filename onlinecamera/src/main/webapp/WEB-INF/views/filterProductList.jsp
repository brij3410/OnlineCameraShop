<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="Commonheader.jsp"%>
<div class="container">
		<h2>CATEGORY</h2>
		<br /> <br />

		<div class="row">
			<div class="col-sm-12 col-lg-12 col-md-12">
				<div class="thumbnails">
					<c:forEach items="${categoryList.product}" var="productList">
							<a href="showFilterProductList?id=${categoryList.categoryId}&bid=${brandList.brandId}">${productList.productName}   <img
								src="${productList.product_image}" height="250px" width="350px" /></a><br/>
						</c:forEach>
				</div>
			</div>

		</div>
	</div>

</body>
<%@include file="Commonfooter.jsp"%>
</html>