<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Customer Account</title>

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
<link rel="stylesheet" type="text/css" href="<c:url value='/static/js/plugins/multiselect/jquery.multiselect.css' />" />
 <!--<script type="text/javascript" src="<c:url value='/static/js/jquery1.8.3.js' />" ></script> -->

<script type="text/javascript" src="<c:url value='/static/js/jquery/jquery-1.11.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery/jquery_ui/jquery-ui.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/css/bootstrap3/bootstrap.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/plugins/multiselect/jquery.multiselect.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/static/js/superfish.js' />" ></script>

<script src='<c:url value="/static/core/jquery.autocomplete.min.js" />'></script>
<%-- <script type="text/javascript" src="<c:url value='/static/js/jquery.dataTables.js' />" ></script> 
<script type="text/javascript" src="<c:url value='/static/js/DT_bootstrap.js' />" ></script>
 --%>
<script src="<c:url value='/static/js/datepick/jquery.datetimepicker.js' />" /></script>
<link type="text/css" rel="stylesheet" href="<c:url value='/static/js/datepick/jquery.datetimepicker.css' />" />

<link rel="stylesheet" href="<c:url value='/static/js/datepick/jquery-ui.css' />" />

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
	$('#adreg_date').datepicker({ format:'Y-m-d' });
});	 																								
</script>  
<div id="content"> 

<div id="content-header">
	<br>
  <h4><b>Customer Account</b></h4>
  <div id="back-button">
  	<a href="<c:url value='/cus/cuslist' />" class="btn btn-small "><span class="glyphicon glyphicon-circle-arrow-left">&nbsp;</span>Back</a>
  </div>
</div>
<br/> 

<div id="box">
<form:form method="POST" modelAttribute="customerAcc" class="form-horizontal"> 

	<table width="50%" border="0" cellspacing="0" cellpadding="0" style="font-size:13px;">
		<c:choose>
			<c:when test="${CusAccEdit}">
				<form:input type="hidden" path="cus_id" id="cusId"/></td>
			</c:when>
			<c:otherwise>
			<tr>
				<td width="10%" align="left" height="45"><strong>Customer Name</strong></td>
				<td width="20%" align="left"><input type="text" style="width:220px; height:30px; padding-left:8px;" class="customer" />
				<form:input type="hidden" path="cus_id" id="cusId"/></td>
			</tr>
		</c:otherwise>
		</c:choose>
		
 
		<tr>
			<td width="10%" align="left" height="45"><strong>Bill 
			Number</strong></td>
			<td width="20%" align="left"><form:input type="text" path="bill_no" style="width:220px; padding-left:8px;" /></td>
		</tr>
		
		<tr>
			<td width="10%" align="left" height="45"><strong>Debit</strong></td>
			<td width="20%" align="left"><form:input type="text" path="debit"  style="width:220px; height:30px; padding-left:8px;" /></td>
		</tr>	
		
		<tr>
			<td width="10%" align="left" height="45"><strong>Credit</strong></td>
			<td width="20%" align="left"><form:input type="text" path="credit"  style="width:220px; height:30px; padding-left:8px;" /></td>
		</tr>	
			
		<tr>
			<td width="10%" align="left" height="45"><strong>Date</strong></td>
			<td width="20%" align="left" > 
			<form:input type="date" path="date" id="fdate" style="display:none" />
			<input type="text" name="adreg_date" id="adreg_date" style="width:220px; height:30px; padding-left:8px;" />
			</td>
		</tr> 
		
		<tr> 
			<td width="10%" align="left" height="45"><strong></strong></td>
			<td width="20%" align="left">					
				<c:choose>
					<c:when test="${edit}">
						<input type="submit" style="font-size:15px" value="Update"" /> or <a href="<c:url value='/cus/cuslist' />">Cancel</a>
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
			 $("#fdate").val(from); 
	  });
	  
	 var temp1 = new Date();
	 temp1=$("#fdate").val();
	  $("#adreg_date").val(temp1);
  });
</script>
<script>
$(function(){
	$(".customer").autocomplete({
		serviceUrl: '${pageContext.request.contextPath}/cus/getCus',
		paramName: "cusName",
		delimiter: ",",
	    transformResult: function(response) {
	    	
	        return {
	        	
	            suggestions: $.map($.parseJSON(response), function(item) {
	            	
	                return { value: item.id+"."+item.customer_name, data: item.id };
	            })
	            
	        };
	        
	    },
	    onSelect: function(){
	    	//alert($(this).val());
	    	var customer=$(this).val();
	    	var cus=customer.split(".");
	    	$(this).val(cus[1]);
	    	$("#cusId").val(cus[0]);
	    	//alert(cus[1]);
	    	//$("#id").val(cus[0]);
    		//cus_fn(cus[0]);
	    }
	    
	});
	
	
		
});
</script>
</body>
</html>