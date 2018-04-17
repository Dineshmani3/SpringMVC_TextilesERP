<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Admin Panel</title>
<link rel="stylesheet" type="text/css" href="static/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="static/css/style-bc.css" />
<link rel="stylesheet" type="text/css" href="static/css/menu.css" />
<link rel="stylesheet" type="text/css" href="static/css/main.css" />
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

<div class="wrapper">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="tw-bs">
  			<br />
        <div style="min-height:300px;">
<script type="text/javascript" src="static/js/jquery.dataTables.js"></script> 
<script type="text/javascript" src="static/js/DT_bootstrap.js"></script>
<script type="text/javascript" src="static/js/bootstrap.min.js"></script>   
<link rel="stylesheet" type="text/css" href="static/css/DT_bootstrap.css" /> 
<link rel="stylesheet" type="text/css" href="static/css/pagination.css"> 


<script src="static/js/datepick/jquery.datetimepicker.js"></script>
<link type="text/css" rel="stylesheet" href="static/js/datepick/jquery.datetimepicker.css">
<script type='text/javascript'>				
	$(document).ready(function() {
		 $('#adreg_date').datetimepicker({
					timepicker:false,
					format:'d-m-Y' 
		 });
	});																										
</script>                                                                                            
<script type="text/javascript">
var logic = function( currentDateTime ){
	if( currentDateTime ){
		if( currentDateTime.getDay()==6 ){
			this.setOptions({
				minTime:'11:00'
			});
		}else
			this.setOptions({
				minTime:'8:00'
			});
		}
	}; 
</script>



<div id="content"> 

<div id="content-header">
	<br>
  <h4>USER <span class="highlight">REGISTER</span></h4>
  <div id="back-button">
  	<a href="<c:url value='/list' />" class="btn btn-small "><span class="glyphicon glyphicon-circle-arrow-left">&nbsp;</span>Back</a>
  
  </div>
</div>
<br/> 

<div id="box">
<form:form method="POST" modelAttribute="user" class="form-horizontal">
<form:input type="hidden" path="id" id="id"/>
	<table width="50%" border="0" cellspacing="0" cellpadding="0" style="font-size:13px;">
		<tr>
			<td width="10%" align="left" height="45"><strong>First Name</strong></td>
			<td width="20%" align="left"><form:input type="text" style="width:220px; height:30px; padding-left:8px;" path="firstName" /></td>
		</tr>
 
		<tr>
			<td width="10%" align="left" height="45"><strong>Last Name</strong></td>
			<td width="20%"  align="left"><form:input type="text" style="width:220px; height:30px; padding-left:8px;" path="lastName" id="lastName" /></td>
		</tr>
		
		<tr>
			<td width="10%" align="left" height="45"><strong>SSO ID</strong></td>
			<td width="20%" align="left">
				<c:choose>
					<c:when test="${edit}">
						<form:input type="text" path="ssoId" id="ssoId"  style="width:220px; height:30px; padding-left:8px;" disabled="true"/>
					</c:when>
					<c:otherwise>
						<form:input type="text" path="ssoId"  style="width:220px; height:30px; padding-left:8px;" id="ssoId" />
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td width="10%" align="left" height="45"><strong>Password</strong></td>
			<td width="20%" align="left"><form:input type="password" path="password"  style="width:220px; height:30px; padding-left:8px;" id="password" /></td>
		</tr>
		<tr>
			<td width="10%" align="left" height="45"><strong>Email</strong></td>
			<td width="20%" align="left"><form:input type="text" path="email" id="email" style="width:220px; height:30px; padding-left:8px;" /></td>
		</tr>	
		<tr>
			<td width="10%" align="left" height="45"><strong>Roles</strong></td>
			<td width="20%" align="left"><form:select style="width:220px !important;" path="userProfiles" items="${roles}" multiple="true" itemValue="id" itemLabel="type" /></td>
		</tr>
		<tr> 
			<td width="10%" align="left" height="45"><strong></strong></td>
			<td width="20%" align="left">					
				<c:choose>
					<c:when test="${edit}">
						<input type="submit" value="Update" /> or <a href="<c:url value='/list' />">Cancel</a>
					</c:when>
					<c:otherwise>
						<input type="submit" value="Register" /> or <a href="<c:url value='/list' />">Cancel</a>
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
          <%@ include file="footer.jsp"  %> 
        </td>
    </tr>
   
</table>
    

                   </div>
                </div>
          
  
</body>
</html>