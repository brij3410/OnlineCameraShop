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
<title>Cart</title>
</head>
<body>

<%@include file="Commonheader.jsp"%>

<center><h3 style="color:#0000CD;margin-left:40px">CART</h3></center>
<div class="container">
<div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th class="text-center">Product Name</th>
                        <th class="text-center">Product Image</th>
                        <th class="text-center">Price</th>
                        <th class="text-center">Quantity </th>
                        <th class="text-center">Total</th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody id="tbody">
             <c:forEach items="${cartList}" var="cartlist">
                <form method="POST" action="updatecart">
                    <tr>
                        <td class="col-sm-1 col-md-2" style="text-align: center">
                        ${cartlist.product.productName}
                        </td>
                        <td class="col-sm-1 col-md-1" >
                        <img src="${cartlist.product.product_image}" height="100px" width="100px" />
                        </td>
                        <td class="col-sm-1 col-md-1" style="text-align: center">
						${cartlist.product.prise}
                        </td>
                        <td class="col-sm-1 col-md-1">
                       
                        
                        <input  type="text" class="form-control" id="quantity" name="quantity" value="${cartlist.quantity}" style="text-align: right" />
                        <input type="text" name="id" value="${cartlist.cartId}"  hidden="true"/>
                       	<input type="text" name="pid" value="${cartlist.product.productId}" hidden="true" />
                       	<td class="col-sm-1 col-md-1 text-center"><strong>${cartlist.total}</strong></td>
                       	<td class="col-sm-1 col-md-1">
                        <a href="<c:url value='/delcart?id=${cartlist.cartId}' />" class="btn btn-danger" role="button" ><span class="glyphicon glyphicon-remove"></span> </a>
                        </td>
                       <td class="col-sm-1 col-md-1">
                         	  <button type="submit" class="btn btn-primary">Update Cart</button>
                         	
                        </td>
                        
                    </tr>
                          
                  </form>
              </c:forEach>
              <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h5>Subtotal</h5></td>
                       <td class="text-right"><h5><strong>${grandtotal}</strong></h5></td>  
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h5>Estimated shipping</h5></td>
                        <td class="text-right"><h5><strong>&#8377;50</strong></h5></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h3>Total</h3></td>
                        <% double t=(double)session.getAttribute("grandtotal") ;
                        	double gt=t+50;
                        
                        %>

                        <td class="text-right"><h3><strong><%=gt %></strong></h3></td>
                        
                                                
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>
                        <a href="Home"  class="btn btn-warning" role="button"><span class="glyphicon glyphicon-shopping-cart"></span>Continue Shopping</a>
                        </td>
                        <td>
                        <a href="checkout" id="deliveryaddress" class="btn btn-success" role="button">Check out<span class="glyphicon glyphicon-play"></span></a>
                       </td>
                    </tr>
              </tbody>  
           </table>  
     </div>
</div>
</div>             

</body>

</html>
<%@include file="Commonfooter.jsp"%>