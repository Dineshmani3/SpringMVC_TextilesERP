<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login page</title>

<link rel="stylesheet" href="<c:url value='/static/login/css/reset.min.css' />"  rel="stylesheet"></link>
<link rel="stylesheet" href="<c:url value='/static/login/css/style.css' />"  rel="stylesheet"></link>
</head>
<body>

<div class="form">
  <div class="forceColor"></div>
  <div class="topbar">
    <div class="spanColor"></div>
		<c:url var="loginUrl" value="/login" />
		<form action="${loginUrl}" method="post" class="form-horizontal">
			<c:if test="${param.error != null}">
				<div class="alert alert-danger">
					<p>Invalid username and password.</p>
				</div>
			</c:if>
			<c:if test="${param.logout != null}">
				<div class="alert alert-success">
					<p>You have been logged out successfully.</p>
				</div>
			</c:if>
				
				<input type="text" class="input" id="username" name="ssoId" placeholder="Enter Username" required />
				<input type="password" class="input" id="password" name="password" placeholder="Enter Password" required />
				<input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
				<input type="submit" class="submit" id="submit" value="Login" >
		</form>
  </div>
 
</div>		
		


</body>
</html>