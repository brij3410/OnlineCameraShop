<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="Commonheader.jsp"%>
<%@include file="carousel.jsp"%>
<html lang="en">

<body>

	<div class="container">

		<br /> <br />

		<div class="row">
			<div class="col-sm-12 col-lg-12 col-md-12">
				<div class="thumbnails">
					<h2>
						<center>BRANDS</center>
					</h2> </br/> <br/>
					<td><c:forEach items="${brandList}" var="brandList">
							<a href="showProductList?id=${brandList.brandId}"><img
								src="${brandList.brand_image}" height="300px" width="350px" /></a>
						</c:forEach></td>
						
				</div>
			</div>

		</div>
	</div>
</body>
<%@include file="Commonfooter.jsp"%>
</html>



