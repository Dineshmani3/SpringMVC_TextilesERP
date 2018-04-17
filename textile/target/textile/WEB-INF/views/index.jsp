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
<script type="text/javascript" src="<c:url value='/static/js/jquery/jquery-1.11.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery/jquery_ui/jquery-ui.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/css/bootstrap3/bootstrap.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/plugins/multiselect/jquery.multiselect.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/static/js/superfish.js' />" ></script>

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


<link rel="stylesheet" type="text/css" href="static/css/main.css" />
<script src="static/js/jquery.validate.js" ></script>
<script src="static/js/validate.additional-methods.js" > </script>
<script src="static/js/jquery.validate.custom-methods.js" > </script>


			 
	<div class="container">
	  <h2>&nbsp;&nbsp;Sri Dhanalakshmi Traders</h2>
	  <div class="row">
	    <div class="col-md-6">
	      <div class="thumbnail">
	      <form:form method="POST" action="viewBills" modelAttribute="date" name="form1" id="form1" class="form-horizontal">
	      <h4 style="font-weight:bold">குறிப்பிட்ட தேதியில் பில்களின் விவரம் </h4>
	      <input type="text" name="adreg_date" id="adreg_date" style="width:100px;"/>
	       <form:input type="date" path="date1" id="fdate" style="display:none" /><br><br>
	        <input type="button" id="btn1" value="Submit">
	      </form:form>
	      </div>
	    </div>
	    <div class="col-md-6">
	      <div class="thumbnail">
	      <form:form method="POST" action="exportBills" modelAttribute="date" name="form" id="form" class="form-horizontal">
	        <h4 style="font-weight:bold">பில்கள் பதிவிறக்கம் செய்ய  </h4>
	        <input type="text" name="from" id="from" style="width:100px;"/>&nbsp;முதல் &nbsp;&nbsp;&nbsp;&nbsp;
	         <form:input type="date" path="date1" id="date1" style="display:none" />
	        <input type="text" name="to" id="to" style="width:100px;"/>&nbsp;வரை 
	         <form:input type="date" path="date2" id="date2" style="display:none" />
	        <br><br>
	        		<input type="button" id="btn2" value="Submit">
	      </form:form>
	      </div>
	    </div>
	  </div>
	</div>
	
	
<%@ include file="footer.jsp"  %>
				 
<script type="text/javascript">
  $(function(){
	  $('#adreg_date').datepicker({ format:'Y-m-d' });
	  $('#from').datepicker({ format:'Y-m-d' });
	  $('#to').datepicker({ format:'Y-m-d' });
	  
	  $("#adreg_date").change(function(){
			var temp = new Date($("#adreg_date").val());
			from=$.datepicker.formatDate('yy-mm-dd', temp); 
			 $("#fdate").val(from); 
	  });
	  $("#from").change(function(){
			var temp = new Date($("#from").val());
			from=$.datepicker.formatDate('yy-mm-dd', temp); 
			 $("#date1").val(from); 
	  });
	  $("#to").change(function(){
			var temp = new Date($("#to").val());
			from=$.datepicker.formatDate('yy-mm-dd', temp); 
			 $("#date2").val(from); 
	  });
	  
	 var temp1 = new Date();
	 temp1=$("#fdate").val();
	 $("#adreg_date").val(temp1);
	  
	  var temp2 = new Date();
	  temp2=$("#date1").val();
	  $("#from").val(temp2);
		  
	  var temp3 = new Date();
	  temp3=$("#date2").val();
	  $("#to").val(temp3);
	  
	  $("#btn1").click(function(){
		 $("#form1").submit(); 
	  });
	  
	  $("#btn2").click(function(){
		 $("#form").submit(); 
	  });
  });
</script>				
  
</body>
</html>
