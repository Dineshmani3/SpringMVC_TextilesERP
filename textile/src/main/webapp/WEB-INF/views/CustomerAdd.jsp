<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Customer Add</title>
<link rel="shortcut icon" href="assets/img/favicon.ico">
	<link rel="stylesheet" type="text/css" href="<c:url value='/static/Quotation/bootstrap.min.css' />" />


<link rel='stylesheet' type='text/css' href="<c:url value='/static/css/bootstrap3/bootstrap.min.css'/>" /> 
<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/style-bc.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/admin-forms.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css'/>" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/static/css/custom.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/menu.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/main.css' />" />

<style type="text/css"> 
.alert-error{ width:96%;border-radius:4px;margin-top:5px;padding:8px;background:#F2DEDE;}
.alert-success{ width:96%;border-radius:4px;margin-top:5px;padding:8px;background:#DFF0D8;}
</style>

 <!--<script type="text/javascript" src="<c:url value='/static/js/jquery1.8.3.js' />" ></script> -->
<script type="text/javascript" src="<c:url value='/static/js/jquery/jquery-1.11.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery/jquery_ui/jquery-ui.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/superfish.js' />" ></script>
<script type="text/javascript" src="<c:url value='/static/css/bootstrap3/bootstrap.min.js'/>"></script>

	<script type="text/javascript" src="<c:url value='/static/js/plugins/multiselect/jquery.multiselect.min.js' />"></script>

<script type="text/javascript">
    $(function () {
      	    $('ul.sf-menu').superfish();
		//	$('ul.menulistdash').superfish();
    });
</script>
</head>
<body>
	
<%@ include file="menubar.jsp"  %> 

<div class="wrapper">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="tw-bs">
  			<br />
        <div style="min-height:300px;">




<script type='text/javascript'>				
$(function() {
	$('#adreg_date').datepicker({ format:'d-m-Y' });
});																										
</script>  
<div id="content"> 

<div id="content-header">
	<br>
  <h4><b>New Customer</b></h4>
  <div id="back-button">
  	<a href="<c:url value='/cus/cuslist' />" class="btn btn-small "><span class="glyphicon glyphicon-circle-arrow-left">&nbsp;</span>Back</a>
  </div>
</div>
<br/> 

<div id="box">
<form:form method="POST" modelAttribute="customerBean" class="form-horizontal"> 
<form:input type="hidden" path="cusId" id="cusId"/>
	<table width="50%" border="0" cellspacing="0" cellpadding="0" style="font-size:13px;">
		<tr>
			<td width="10%" align="left" height="45"><strong>Customer Name</strong></td>
			<td width="20%" align="left"><form:input type="text" style="width:220px; height:30px; padding-left:8px;"  path="cus_name" /></td>
		</tr>
 
		<tr>
			<td width="10%" align="left" height="45"><strong>Address</strong></td>
			<td width="20%" align="left"><form:textarea path="address"  cols="4" rows="5" style="width:220px; padding-left:8px;" /></td>
		</tr>
		
		<tr>
			<td width="10%" align="left" height="45"><strong>Contact Number</strong></td>
			<td width="20%" align="left"><form:input type="text" path="contact_no"  style="width:220px; height:30px; padding-left:8px;" /></td>
		</tr>	
		
		<tr> 
			<td width="10%" align="left" height="45"><strong></strong></td>
			<td width="20%" align="left">					
				<c:choose>
					<c:when test="${edit}">
						<input type="submit" style="font-size:15px" value="Update" /> or <a href="<c:url value='/cus/cuslist' />">Cancel</a>
					</c:when>
					<c:otherwise>
						<input type="submit" style="font-size:15px" value="Save" /> or <a href="<c:url value='/cus/cuslist' />">Cancel</a>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>	
</table>
</form:form>
  </div>
</div>         
       </div>
        </td>
      
    </tr>
    <tr>
        <td> 
          
        </td>
    </tr>
   
</table>
    

                   </div>
               
          <%@ include file="footer.jsp"  %> 
<script type="text/javascript">
  $(function(){
	  $("#adreg_date").change(function(){
			var temp = new Date($("#adreg_date").val());
			from=$.datepicker.formatDate('yy-mm-dd', temp); 
			 $("#remind").val(from); 
	  });
	  
	 var temp1 = new Date();
	 temp1=$("#remind").val();
	  $("#adreg_date").val(temp1);
	  
  });
</script>
</body>
</html>