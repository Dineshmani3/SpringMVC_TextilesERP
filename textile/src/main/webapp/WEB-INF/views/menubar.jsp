<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
<div style="background:#ff69b4; height: 40px;">
	<div class="wrapper">
        <ul id="menus" class="sf-menu">
			<li><a href="${pageContext.request.contextPath}/">Home</a></li>
			<li><a href="list">Admin</a>
				<ul>
		            <li><a href="${pageContext.request.contextPath}/newuser">Add </a></li>
		       		<li><a href="${pageContext.request.contextPath}/list">View</a></li>
		        </ul>
			</li>
			<li><a href="">Customer</a>
				<ul>
		            <li><a href="${pageContext.request.contextPath}/cus/cusNew">Add </a></li>
		       		<li><a href="${pageContext.request.contextPath}/cus/cuslist">View</a></li>
		        </ul>
			</li>
			<li><a href="${pageContext.request.contextPath}/cus/notifyListc">Notification</a> </li>
			<li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
		</ul>
    </div>
</div> 

-->


    <link rel="stylesheet" href="<c:url value='/static/css/user/bootstrap.min.css' />" />
    <link rel="stylesheet" href="<c:url value='/static/css/user/jquery.bxslider.min.css' />" />
    <link rel="stylesheet" href="<c:url value='/static/css/user/font-awesome.min.css' />" />
    <link rel="stylesheet" href="<c:url value='/static/css/user/slick.min.css' />" />
    <link rel="stylesheet" href="<c:url value='/static/css/user/slick-theme.min.css' />" />
    <link rel="stylesheet" href="<c:url value='/static/css/user/slicknav.min.css' />" />
    <link rel="stylesheet" href="<c:url value='/static/css/user/custom.min.css' />" />
    <link rel="stylesheet" href="<c:url value='/static/css/user/custom-responsive.min.css' />" />
<div class="container pad0">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 nopadding">
            <h2>SRI SARAVANA TRADERS</h2>
        </div>
        <div class="col-lg-8 col-md-8 hidden-xs hidden-sm nopadding">
            <div class="login_register_bt">
       			<a href="#" style="font-weight:normal;">${loggedinuser}</a>
   			</div>
   			<div class="clearfix"></div>
		    <ul class="header_menu" id="menu">
		        <li><a href="${pageContext.request.contextPath}/"><i class="glyphicon glyphicon-home"></i></a></li>
		        <%-- <li><a href="${pageContext.request.contextPath}/list">Admin</a></li> --%>
		        <li><a href="${pageContext.request.contextPath}/cus/cuslist">Customer</a></li>
		        <li><a href="${pageContext.request.contextPath}/inven/show-inven-list">Inventory</a></li>
		        <li><a href="${pageContext.request.contextPath}/bills">Invoice</a></li>
		        <%-- <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li> --%>
		    </ul>
        </div>
    </div>
</div>
