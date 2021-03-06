<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Inventory</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/bootstrap.css' />" /> 
<link rel='stylesheet' type='text/css' href="<c:url value='/static/css/bootstrap3/bootstrap.min.css'/>" /> 
<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/style-bc.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/menu.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/main.css' />" />
<style type="text/css"> 
.alert-error{ width:96%;border-radius:4px;margin-top:5px;padding:8px;background:#F2DEDE;}
.alert-success{ width:96%;border-radius:4px;margin-top:5px;padding:8px;background:#DFF0D8;}
</style>
<script type="text/javascript" src="<c:url value='/static/js/jquery/jquery-1.11.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery/jquery_ui/jquery-ui.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/superfish.js' />" ></script>
<script src='<c:url value="/static/js/jquery.autocomplete.min.js" />'></script>

</head>
<body>

<%@ include file="menubar.jsp"  %> 

<div class="wrapper">
<table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="tw-bs">
  		<br />
        <div style="min-height:300px;">
<script type="text/javascript" src="<c:url value='/static/js/jquery.dataTables.js' />" /></script> 
<script type="text/javascript" src="<c:url value='/static/js/DT_bootstrap.js' />" /></script>
<script type="text/javascript" src="<c:url value='/static/js/bootstrap.min.js' />" /></script>   
<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/DT_bootstrap.css' />" />
<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/pagination.css' />" />

<div class="add_title_width">
<div class="head_title">
    <h4><b>${date} அன்று பில்களின் விவரம் </b></h4>
 </div>
<div class="add_lable" >
	<span style="float:right">	
	<div id="back-button">
	<a href="<c:url value='/bills' />" class="btn btn-small "><span class="glyphicon glyphicon-circle-arrow-left">&nbsp;</span>பின் செல்</a>
</div>
     </span>
</div>
</div>
<div style="clear:both">&nbsp;</div>
<div style="clear:both">&nbsp;</div>

<div class="searcharea">


</div> 
<table width="100%" cellpadding="0" cellspacing="0" class="table table-striped table-bordered margin-datatable" id="example" style="margin:auto">
  <thead>
            <tr>
            	<th width="15">வ.எண்</th> 
				<th width="150">பில் எண்</th> 
				<th width="158">தேதி</th>
				<th width="158">தொகை  ரூ.</th>
                <th width="93" >Action</th>  
                <th width="93" >Action</th>  
                <th width="93">Action</th>       
            </tr> 
 	</thead> 
	<tbody>
		<c:forEach items="${inv}" var="inv" varStatus="counter"> 
			<tr>
		        <th>${counter.index+1}</th>
				<td>${inv.bill_no}</td>
				<td>${inv.date}</td>
				<td><fmt:formatNumber type = "number" minFractionDigits="2" value = "${inv.bill_amount}" /> 
				</td> 
				<td><a href="<c:url value='/open-inv-${inv.bill_no}' />">திறக்க</a></td>		
				<td><a href="<c:url value='/edit-inv-${inv.bill_no}' />" >மாற்று</a></td>
				<td><a href="<c:url value='/delete-inv-${inv.bill_no}' />">நீக்கு</a></td>						
			
			</tr>
		</c:forEach>
	</tbody>
</table>
<div style="width:100%; font-size:13px;">  
</div>
<div style="clear:both">

</div>

<br />
<br />
                </div>
        </td>
      
    </tr>
   
</table>
    

                   </div>
               
<%@ include file="footer.jsp"  %> 


</body>
</html>