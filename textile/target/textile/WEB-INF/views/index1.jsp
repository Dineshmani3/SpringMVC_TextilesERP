<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Sri Dhanalakshmi Traders</title>
<link rel="stylesheet" type="text/css" href="static/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="static/css/style-bc.css" />
<link rel="stylesheet" type="text/css" href="static/css/menu.css" />
<style type="text/css"> 
.alert-error{ width:96%;border-radius:4px;margin-top:5px;padding:8px;background:#F2DEDE;}
.alert-success{ width:96%;border-radius:4px;margin-top:5px;padding:8px;background:#DFF0D8;}
</style>
<script type="text/javascript" src="static/js/jquery1.8.3.js"></script>
<script type="text/javascript" src="static/js/superfish.js"></script>
<script type="text/javascript">
    $(function () {
      	    $('ul.sf-menu').superfish();
		//	$('ul.menulistdash').superfish();
    });
</script> 
</head>
<body>
	
<%@ include file="menubar.jsp"  %> 


<script src="static/js/bootstrap.min.js" ></script>
<link rel="stylesheet" type="text/css" href="static/js/datepick/jquery.datetimepicker.css" />
<script src="static/js/datepick/jquery.datetimepicker.js" ></script>
<link rel="stylesheet" type="text/css" href="static/css/main.css" />
<script src="static/js/jquery.validate.js" ></script>
<script src="static/js/validate.additional-methods.js" > </script>
<script src="static/js/jquery.validate.custom-methods.js" > </script>


			 
	<div class="container">
	  <h2>&nbsp;&nbsp;Sri Dhanalakshmi Traders</h2>
	  <div class="row">
	    <div class="col-md-6">
	      <div class="thumbnail">
	          <img src="static/img/grocery.jpg" alt="Lights" style="width:100%">
	      </div>
	    </div>
	    <div class="col-md-6">
	      <div class="thumbnail">
	        <h3 align="center" style="font-weight:bold"> இன்றைய பில் நிலவரம்  </h3>
	        <table>
	        	<tr>
	        		<td><h4>மொத்த பில்களின் எண்ணிக்கை </h4></td>
	        		<td style="width:20px" align='center'>:</td>
	        		<td>${count}</td>
	        	</tr>
	        	<tr>
	        		<td><h4>பில்லின் படி இன்றைய வசூல் </h4></td>
	        		<td style="width:20px" align='center'>:</td>
	        		<td>ரூ.&nbsp;${bill_total}</td>
	        	</tr>
	        	
	        	<%-- <tr>
	        		<td><h4>இன்றைய வரவு தொகை </h4></td>
	        		<td style="width:20px" align='center'>:</td>
	        		<td>ரூ.&nbsp;${credit_total}</td>
	        	</tr> --%>
	        	<%-- <tr>
	        		<td><h4>மொத்த வசூல் தொகை </h4></td>
	        		<td style="width:20px" align='center'>:</td>
	        		<td>ரூ.&nbsp;${total}</td>
	        	</tr> --%>
	        </table>
	      </div>
	    </div>
	  </div>
	</div>

				<%@ include file="footer.jsp"  %> 
				
  
</body>
</html>
