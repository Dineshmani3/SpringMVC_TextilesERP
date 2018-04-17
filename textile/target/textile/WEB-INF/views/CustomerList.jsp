<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Customer Add</title>
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
    <h4><b>வாடிக்கையாளர் விவரம்</b></h4>
 </div>
<div class="add_lable" >
	<span style="float:right">	
      	<a href="cusNew" class="btn btn-small"> 	<span class="glyphicon glyphicon-plus"></span> Add Customer</a>&nbsp;
      	<a href="cusAddAcc" class="btn btn-small"> 	<span class="glyphicon glyphicon-plus"></span> Add Credit/Debit</a>&nbsp;
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
				<th width="150">வாடிக்கையாளர் பெயர்</th> 
				<th width="158">கைப்பேசி எண்</th>
				<th width="158">முகவரி</th>
				<th width="158">பாக்கி</th>
                <th width="93" >Action</th>  
                <th width="93">Action</th>       
            </tr> 
 	</thead> 
	<tbody>
		<c:forEach items="${customerBean}" var="user" varStatus="c">
		
        	<tr>
        		<td>${user.cusId}</td>
        		<td>
        		<a href="<c:url value='/cus/cusAcclist-${user.cusId}' />" >
        		<c:out value="${user.cus_name}"></c:out></a></td>
        		<td>${user.contact_no}</td>
        		<td>${user.address}</td>
        		<td>
        		<fmt:formatNumber type = "number" minFractionDigits="2" value = "${user.balance}" />
        		</td>
       			<td><a href="<c:url value='/cus/cuslist-${user.cusId}' />" >மாற்று</a></td>
				<td><a href="<c:url value='/cus/delete-customer-${user.cusId}' />" >நீக்கு</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div style="width:100%; font-size:13px;">  
<div class="pagination"><span class="disabled">Previous</span><span class="current">1</span><a href="">2</a><a href="">3</a><a href="">Next</a></div>
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

<script type="text/javascript">
$(function(){
	/* <c:forEach items="${customerBean}" var="user" varStatus="c">
		var text = "${user.cus_name}";
		var str = $('<div/>').html(text).text();
		$("#cus_name_${c.index}").text(str);
	</c:forEach> */
});
</script>

</body>
</html>