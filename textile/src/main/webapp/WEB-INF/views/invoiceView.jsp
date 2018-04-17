<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>

	<!-- Metas -->
	<!-- <meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1"> -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Invoice | Home</title>
	
	<link rel="shortcut icon" href="assets/img/favicon.ico">
	<link rel="stylesheet" type="text/css" href="<c:url value='/static/Quotation/bootstrap.min.css' />" />
	<link rel='stylesheet' type='text/css' href="<c:url value='/static/css/style.css' />" />
	
	
	
    <link rel='stylesheet' type='text/css' href="<c:url value='/static/css/bootstrap3/bootstrap.min.css'/>" /> 
    <link rel="stylesheet" type="text/css" href="<c:url value='/static/css/theme.css' />" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/static/js/plugins/multiselect/jquery.multiselect.css' />" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/static/css/admin-forms.css' />" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/static/css/custom.css' />" />
	<!-- Stylesheet -->
	
	
	<script type="text/javascript" src="<c:url value='/static/js/jquery/jquery-1.11.1.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/static/js/jquery/jquery_ui/jquery-ui.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/css/bootstrap3/bootstrap.min.js'/>" ></script>
	<script type="text/javascript" src="<c:url value='/static/js/plugins/multiselect/jquery.multiselect.min.js' />"></script>
	
	<script type="text/javascript" src='<c:url value="/static/core/jquery.autocomplete.min.js" />'></script>
	
	<link href='<c:url value="/static/core/main.css" />' rel="stylesheet">
	

	<!--height:29.7cm;-->
<style>
body {
  background: rgb(204,204,204); 
}


page {
  background: white;
  display: block;
  margin: 0 auto;
  margin-bottom: 0.5cm;
  box-shadow: 0 0 0.5cm rgba(0,0,0,0.5);
}


page[size="A4"] {  
  width:21cm;
  
}

p {
margin: 0 2px 0px !important;
}

.cost1{ 
	height:88px;
    width: 370px;
}


table.roundedCorners1 {
    border: 0px solid DarkOrange;
    border-radius: 8px !important;
	border-spacing:0;
	border-collapse: separate;
}

table.roundedCorners1 td, 
table.roundedCorners1 th { 
  border-bottom: 0px solid DarkOrange;
  border-right: 0px solid DarkOrange;
  }
table.roundedCorners1 tr:last-child > td {
  border-bottom: none;
}
table.roundedCorners1 tr:last-child > td {
  border-bottom: none;
  border-right: none;
}



table.roundedCorners {
    border: 1px solid DarkOrange;
    border-radius: 8px !important;
	border-spacing:0;
	border-collapse: separate;
}

table.roundedCorners td, 
table.roundedCorners th { 
  border-bottom: 1px solid DarkOrange;
  border-right: 1px solid DarkOrange;
  }
table.roundedCorners tr:last-child > td {
  border-bottom: none;
}
table.roundedCorners tr:last-child > td {
  border-bottom: none;
  border-right: none;
}

.odd{
	border-right:0 !important;
}
.even {   border-right: 1px solid DarkOrange !important; }
.top{ border-top: 1px solid DarkOrange !important; }

.odd-bottom{
	border-bottom: 0px !important;
}

.ebottom { border-bottom:0 !important; }

.hideInput {
	border-top:none;
	border-left:none;
	border-right:none;
}

.test{
height:48px;
width:330px;
}

input[type=button] {
    background: #5DBC25;
    border: medium none;
    border-radius: 2px 2px 2px 2px;
    color: white;
    font-family: Arial;
    font-size: 15px;
    font-weight:bold;
    height: 30px;
    padding: 0 10px 0 10px;
    border: 1px solid #479818;
}

#page-wrap2{
	visibility: hidden;
}
@media print {
   
}

.leftBorder { border-left: 0px !important; }
.RightBorder { border-right: 0px !important; }
.topBorder { border-top: 0px !important; }
.bottomBorder { border-bottom: 0px !important; }

</style>

</head>
<body>

<%@ include file="menubar.jsp"  %> 

  <div id="back-button">
  <form:form method="POST" action="viewBills" modelAttribute="date" name="form1" id="form1" class="form-horizontal">
	  <form:input type="date" path="date1" id="fdate" value="${inv.date}" style="display:none" /><br><br>
  
  	  <a href="#" onclick="document.getElementById('form1').submit()" id="back" class="btn btn-small "><span class="glyphicon glyphicon-circle-arrow-left">&nbsp;</span>பின் செல்</a>
  </form:form>
  </div>
  
<page size="A4">

<table border="0" width="100%" height="100%">
	<tr valign="top"><td>
		
		
			
			
		<table border="0" width="100%" style="margin:1px;" height="1%">
		<tr valign="top">
			<td>
				&nbsp;&nbsp;&nbsp;&nbsp;GST எண்: 33DVXPS5247E1Z0
			</td>
			<td align="right" >
				கைப்பேசி எண்: 9443625276&nbsp;&nbsp;&nbsp;&nbsp; <br>9442310275&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td colspan="2" width="100%" align="center">
				<p>
				<b style="font-weight:bold">ஶூ தனலட்சுமி டிரேடர்ஸ்<br>
				மளிகை வியாபாரம்<br>
				திமிரி - 632512</b>
				</p>
			</td>

		</tr>
		<tr>
			<td width="50%">
				&nbsp;&nbsp;&nbsp;&nbsp;தேதி: ${inv.date}
			</td>
			<td align="right" width="50%" > 
			&nbsp;&nbsp;&nbsp;&nbsp;Bill No/பில் எண்: ${inv.bill_no}&nbsp;&nbsp;&nbsp;&nbsp;
			
			</td>
			
		</tr>
		</table>		
			
		<table border="0" width="100%" style="margin:1px;" height="1%">
		<tr valign="top">
			<td width="100%">
				<table border="0" width="100%" height="100%" class="bill_table roundedCorners">
					<tr valign="top">
						<td align="center" width="5%"><b>வ.எண்</b></td>
						<td align="center" width="35%"><b>பொருள்</b></td>
						<td align="center" width="4%"><b>MRP</b></td>
						<td align="center" width="3%"><b>விற்பனை<br> விலை ரூ.</b></td>
						<td align="center" width="10%"><b>அளவு</b></td>
						<td class="odd" align="center" width="10%"><b>விலை<br>ரூ.</b>
						</td>
					</tr>
					<c:forEach items="${igs}"  var="igs" varStatus="c">
					<tr>
						<td align="center" class="topBorder  leftBorder RightmBorder"><c:out value="${c.index + 1}"/>
						</td>
						<td id="delete" class="topBorder  leftBorder RightmBorder">&nbsp;&nbsp;<input type="text" style="border:none;  text-align:left;" value="${igs.items}" readonly  size="52" class="items" id="goods_${c.index}"/></td>
						<td id="delete" class="topBorder  leftBorder RightmBorder"><input type="text" style="border:none;  text-align:right;" value="${igs.MRP}" readonly  class="MRP" size="8" /></td>
						<td id="delete" class="topBorder  leftBorder RightmBorder"><input type="text" style="border:none;  text-align:right;" value="${igs.sell_p}" readonly class="sell_p"  size="8" /></td>
						<td id="delete" class="topBorder  leftBorder RightmBorder"><input type="text" style="border:none;  text-align:right;" value="${igs.qty}" readonly size="5" class="qty"  /></td>
						<td id="delete" class="odd topBorder  leftBorder RightmBorder" ><input type="text" style="border:none;  text-align:right;" id="row_tot_${c.index}" readonly class="row_total" size="8"  /></td>
						
					</tr>
					</c:forEach> 
					
					<tr id="totalrow">
						
									<td colspan="4" class="even "  >
									</td>
									
									<td align="center" class="even" > <b>மொத்தம்</b> </td>
									<td align="left" class=""> 
									<input type="text" style="border:none; text-align:right;" &nbsp; id="total" size="8" value="${inv.bill_amount}"/></td>
								
					</tr>	
					
				</table>
			</td>
		</tr>
		</table>
		
	</td></tr>
</table>
</page>



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

<script type="text/javascript">
$(function(){
	qty=[]
	sp=[]
	sum=[]
	mrp=[]
	
	$(".items").each(function(){
		var str = $('<div/>').html($(this).val()).text();
		$(this).val(str);
	});
	$(".qty").each(function(index){
			qty[index]=$(this).val();
			$(this).val(parseFloat(qty[index]).toFixed(0));
	});
	$(".sell_p").each(function(index){
			sp[index]=$(this).val();
			$(this).val(parseFloat(sp[index]).toFixed(2));
	});
	$(".MRP").each(function(index){
		mrp[index]=$(this).val();
		$(this).val(parseFloat(mrp[index]).toFixed(2));
});
	$(".row_total").each(function(index){
		$(this).val((parseFloat(qty[index])*parseFloat(sp[index])).toFixed(2));
	});
	var tot = $("#total").val();
	$("#total").val(parseFloat(tot).toFixed(2));
	sum[index]=(parseFloat(qty[index])*parseFloat(sp[index])).toFixed(2);
});
</script>

</body>
</html>