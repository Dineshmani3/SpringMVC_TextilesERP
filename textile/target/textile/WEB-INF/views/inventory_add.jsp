<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Inventory Add</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/static/Quotation/bootstrap.min.css' />" />

<!-- <link rel="stylesheet" type="text/css" href="<c:url value='/static/css/bootstrap.css' />" /> -->
<link rel='stylesheet' type='text/css' href="<c:url value='/static/css/bootstrap3/bootstrap.min.css'/>" /> 
<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/style-bc.css' />" />
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
<script type="text/javascript" src="<c:url value='/static/js/jquery.dataTables.js' />" ></script> 
<script type="text/javascript" src="<c:url value='/static/js/DT_bootstrap.js' />" ></script>
<script type="text/javascript" src="<c:url value='/static/js/bootstrap.min.js' />" ></script>   


<script src="<c:url value='/static/js/datepick/jquery.datetimepicker.js' />" /></script>
<link type="text/css" rel="stylesheet" href="<c:url value='/static/js/datepick/jquery.datetimepicker.css' />" />

<link rel="stylesheet" href="<c:url value='/static/js/datepick/jquery-ui.css' />" />


<div id="content"> 

<div id="content-header">
	<br>
  <h4><b>பொருள் உள்ளீடு</b></h4>
  <div id="back-button">
  	<a href="<c:url value='/inven/show-inven-list' />" class="btn btn-small "><span class="glyphicon glyphicon-circle-arrow-left">&nbsp;</span>பின் செல்</a>
  </div>
</div>
<br/> 

<div id="box">
<form:form method="POST" modelAttribute="inven" accept-charset="UTF-8" class="form-horizontal"> 
	<table width="50%" border="0" cellspacing="0" cellpadding="0" style="font-size:13px;">
		<tr>
			<td width="10%" align="left" height="45"><strong>பொருளின் பெயர்</strong></td>
			<td width="20%" align="left"><form:input type="text" style="width:220px; height:30px; padding-left:8px;" id="item_name"  path="item_name" /></td>
		</tr>
 
		<%-- <tr>
			<td width="10%" align="left" height="45"><strong>அளவு</strong></td>
			<td width="20%" align="left"><form:input path="quantity"  style="width:220px;height:30px;  padding-left:8px;" /></td>
		</tr>
		
		<tr>
			<td width="10%" align="left" height="45"><strong>அலகு</strong></td>
			<td width="20%" align="left"><form:input path="units"  style="width:220px;height:30px;  padding-left:8px;" /></td>
		</tr> --%>
		
		<tr>
			<td width="10%" align="left" height="45"><strong>செலவு விலை<br>(Incl.of Taxes) ரூ.</strong></td>
			<td width="20%" align="left"><form:input type="text" id="c_p" path="c_p"  style="width:220px; height:30px; padding-left:8px;" /></td>
		</tr>	
		<%-- <tr>
			<td width="10%" align="left" height="45"><strong>விலை(வரி நீங்கலாக) ரூ.</strong></td>
			<td width="20%" align="left"><form:input type="text" path="tax_excl_rate"  style="width:220px; height:30px; padding-left:8px;" /></td>
		</tr> --%>	
		 <tr>
			<td width="10%" align="left" height="45"><strong>வரி விகிதம்(%)</strong></td>
			<td width="20%" align="left"><form:input type="text" path="tax_rate"  style="width:220px; height:30px; padding-left:8px;" /></td>
		</tr>	
		
		<tr>
			<td width="10%" align="left" height="45"><strong>MRP ரூ.</strong></td>
			<td width="20%" align="left"><form:input type="text" path="MRP"  style="width:220px; height:30px; padding-left:8px;" /></td>
		</tr>	
		
		<tr>
			<td width="10%" align="left" height="45"><strong>விற்பனை விலை ரூ.</strong></td>
			<td width="20%" align="left"><form:input type="text" path="s_p"  style="width:220px; height:30px; padding-left:8px;" /></td>
		</tr>	
		
		<tr> 
			<td width="10%" align="left" height="45"><strong></strong></td>
			<td width="20%" align="left">					
				<c:choose>
					<c:when test="${edit}">
						<input type="submit" style="font-size:15px" value="மாற்றம் செய்" /> or <a href="<c:url value='/inven/show-inven-list' />">Cancel</a>
					</c:when>
					<c:otherwise>
						<input type="submit" style="font-size:15px" value="சேமி" /> or<a href="<c:url value='/inven/show-inven-list' />">Cancel</a>
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
          
<script type="text/javascript">
$(function(){
	
	<c:choose>
		<c:when test="${edit}">
			var str = $('<div/>').html($("#item_name").val()).text();
			$("#item_name").val(str);
		</c:when>
	</c:choose>
	
});
</script>
</body>
</html>