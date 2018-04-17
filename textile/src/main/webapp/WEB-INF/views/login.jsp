<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login page</title>
<%-- 
<link rel="stylesheet" href="<c:url value='/static/login/css/reset.min.css' />"  rel="stylesheet"></link>
<link rel="stylesheet" href="<c:url value='/static/login/css/style.css' />"  rel="stylesheet"></link> --%>
<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/bootstrap.min.css' />" />

<script type="text/javascript" src="<c:url value='/static/css/bootstrap.min.js' />"></script>
</head>
<body>


			<%-- <c:if test="${param.error != null}">
				<div class="alert alert-danger">
					<p>Invalid username and password.</p>
				</div>
			</c:if>
			<c:if test="${param.logout != null}">
				<div class="alert alert-success">
					<p>You have been logged out successfully.</p>
				</div>
			</c:if> --%>
			<h1 align="center" style="margin-top:50px">Sri Saravana Traders</h1>
<div class="container">
	<div  class="row">
		<div class="col-md-4">
			
		</div>
		
		<div class="col-md-4">
			<c:url var="loginUrl" value="/login" />
		<form action="${loginUrl}" method="post" class="form-control" style="margin-top:90px">
				<h4 align="center">Login</h4>

			
		    <div class="form-group form-group-sm">
		      <label class="control-label">Username</label>
		      <div class="">
		        <input type="text" class="form-control" id="username" name="ssoId" required />
		      </div>
		    </div>
		    <div class="form-group form-group-sm">
		      <label class="control-label" for="sm">Password</label>
		      <div class="">
		      <input type="password" class="form-control" id="password" name="password" required />
		      </div>
		    </div>
		    
		    <div align="center">
		    <input type="submit" class="btn btn-success" id="submit" value="Login" >
		    </div>
		    <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
				
			</form>
					</div>
					
					<div class="col-md-4">
						
					</div>
				</div>
			</div>
			
			
<!-- <div class="form">
  <div class="forceColor"></div>
  <div class="topbar">
    <div class="spanColor"></div>
		
				
				
				
				
  </div>
 
</div>	 -->	
		


</body>
</html>