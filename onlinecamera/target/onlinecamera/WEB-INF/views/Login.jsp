<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="Commonheader.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form class="form-horizontal" action="onsubmit" method="post">
<fieldset>

<!-- Form Name -->
<legend><center>Login Here</center></legend>


<div class="form-group">
  <label class="col-md-4 control-label" for="fn">Username</label>  
  <div class="col-md-4">
  <input id="fn" name="username" type="text" placeholder="Username" class="form-control input-md" required="">
    
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="fn">Password</label>  
  <div class="col-md-4">
  <input id="fn" name="password" type="password" placeholder="Password" class="form-control input-md" required="">
    
  </div>
</div>



<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="submit"></label>
  <div class="col-md-4">
    <button id="submit" name="Login" class="btn btn-primary">Login</button>
	<p> Not Member Yet..Register Here</p>
	<button id="submit" name="Register" class="btn btn-warning">Register</button>
	
  </div>
</div>

</fieldset>
</form>

</body>
</html>

<%@include file="Commonfooter.jsp"%>