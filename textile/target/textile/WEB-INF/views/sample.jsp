<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>

	<!-- Metas -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Invoice | Home</title>
	
	<!-- Favicons -->
	<link rel="shortcut icon" href="assets/img/favicon.ico">
	<link rel='stylesheet' type='text/css' href="<c:url value='/static/css/style.css' />" />
	
	
	
    <link rel='stylesheet' type='text/css' href="<c:url value='/static/css/bootstrap3/bootstrap.min.css'/>" /> 
    <link rel='stylesheet' type='text/css' href="<c:url value='/static/js/jquery/jquery_ui/jquery-ui.min.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/static/js/plugins/multiselect/jquery.multiselect.css' />" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/static/css/admin-forms.css' />" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/static/css/custom.css' />" />
	<!-- Stylesheet -->
	
	<%-- <script type="text/javascript" src="<c:url value='/static/js/jquery/jquery-1.11.1.min.js'/>"></script> --%>
	<script type="text/javascript" src="<c:url value='/static/js/jquery.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/static/js/jquery/jquery_ui/jquery-ui.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/static/js/plugins/multiselect/jquery.multiselect.min.js' />"></script>
	<!--<script type="text/javascript" src="<c:url value='/static/core/jquery.1.10.2.min.js' />"></script> -->
	<script src='<c:url value="/static/core/jquery.autocomplete.min.js" />'></script>
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

<page size="A4">

<table border="0" width="100%" height="100%">
	<tr valign="top"><td>
		
		
		
			
		<form id="form" class="form-horizontal">
		<table border="0" width="100%" style="margin:1px;" height="1%">
		<tr valign="top">
			<td width="100%">
				<table border="0" width="100%" height="100%" class="bill_table roundedCorners">
					<tr valign="top">
						<td align="center" width="5%"><b>SI.No</b></td>
						<td align="center" width="35%"><b>Description of Goods</b></td>
						<td align="center" width="4%"><b>MRP</b></td>
						<td align="center" width="3%"><b>Rate<br> Rs.</b></td>
						<td align="center" width="10%"><b>Qty</b></td>
						<td class="odd" align="center" width="10%"><b>Amount</b>
						<input type="hidden" class="bill_no" value="${billno}" name="bill_no" />
						</td>
					</tr>
					
					<c:forEach items="${igs.igs}"  var="igs" varStatus="c">
					<tr>
						<td align="center" class="topBorder  leftBorder RightmBorder"><c:out value="${c.index + 1}"/>
							
						</td>
						<td id="delete" class="topBorder  leftBorder RightmBorder"><input type="text" style="border:none;  text-align:left;" name="items"  size="60" class="items" autofocus="autofocus" id="goods_${c.index}"/></td>
						<td id="delete" class="topBorder  leftBorder RightmBorder"><input type="text" style="border:none;  text-align:right;" name="MRP"   class="MRP" size="4" /></td>
						<td id="delete" class="topBorder  leftBorder RightmBorder"><input type="text" style="border:none;  text-align:right;" name="sell_p"  class="sell_p"  size="8" /></td>
						<td id="delete" class="topBorder  leftBorder RightmBorder"><input type="text" style="border:none;  text-align:center;" name="qty"  size="5" class="qty"  /></td>
						<td id="delete" class="odd topBorder  leftBorder RightmBorder" ><input type="text" style="border:none;  text-align:right;" id="row_tot_${c.index}" class="row_total" size="8"  /></td>
						
					</tr>
					</c:forEach> 
					
					
					<tr id="totalrow">
						
									<td colspan="4"  >
									</td>
									
									<td align="center" > Total </td>
									<td align="center" class="odd"> 
									<input type="text" style="border:none; text-align:right;" id="total" size="9" value=""/></td>
								
					</tr>	
					
				</table>
			</td>
		</tr>
		</table>
		
	</form>
	</td></tr>
</table>

	<input type="submit" id="subbtn" value="Print" />
</page>
<script>
$(function(){
	//setInterval(function(){
		//$(document).on('keyup', ".row_total input[type='text']",function () {
		//$(".row_total").each(function () {
			prod=[]
			qty=[]
			mrp=[]
			sp=[]
			sum=[]
			var c=3;
			var cc=4;
			
		$(document).on('keyup',".row_total",function (event) {
			//$(".row_total").each(function(){
		    if (event.keyCode == 13) {
		    	
		       // $(this).closest('tr').after('<tr>'+
		    	$("#totalrow").before('<tr>'+
		            '<td class="table-cell" align="center">' + cc + '</td>' +
		            '<td class="table-cell">' +
		            '<input type="text" style="border:none;  text-align:left;" size="60" class="items" name="items" />' +
		            '</td>' +
		            '<td class="table-cell">' +
		            '<input type="text" style="border:none;  text-align:right;" size="4" class="MRP" name="MRP" />' +
		            '</td>' +
		            '<td class="table-cell">' +
		            '<input type="text" style="border:none;  text-align:right;" size="8" class="sell_p" name="sell_p" />' +
		            '</td>' +
		            '<td class="table-cell">' +
		            '<input type="text" style="border:none;  text-align:center;"  size="5" class="qty" name="qty" />' +
		            '</td>' +
		            '<td class="table-cell">' +
		            '<input type="text" style="border:none;  text-align:right;" size="8" class="row_total" name="amount" />' +
		            '</td></tr>');
		    	c=c+1;
		    	cc=cc+1;
		    	/* <c:forEach items="${igs.igs}" var="igs" varStatus="c">
		    	</c:forEach>
		    	<c:set var = "salary" scope = "session" value = "${2000*2}"/>
		    	<c:out value = "${salary}"/> */
		    }
		    $(".qty").each(function(index){
				$(this).keyup(function(){
					//alert();
					qty[index]=$(this).val();
					
					rowTotal(index);
				});
			});
			$(".sell_p").each(function(index){
				$(this).change(function(){
					//alert();
					sp[index]=$(this).val();
					
					rowTotal(index);
				});
			});
			//});
		});
		//});
	//},3000);

	$(".items").each(function(index){
		$(this).change(function(){
			prod[index]=$(this).val();
		});	
	});
	$(".MRP").each(function(index){
		$(this).change(function(){
			mrp[index]=$(this).val();
		});	
	});
	$(".qty").each(function(index){
		$(this).keyup(function(){
			//alert();
			qty[index]=$(this).val();
			
			rowTotal(index);
		});
	});
	$(".sell_p").each(function(index){
		$(this).change(function(){
			//alert();
			sp[index]=$(this).val();
			
			rowTotal(index);
		});
	});
	function rowTotal(index){
		if(qty[index]==""&&sp[index]==""){
			sum[index]="";
		}
		else if(qty[index]!=""&&sp[index]!=""){
			sum[index]=(parseFloat(qty[index])*parseFloat(sp[index])).toFixed(2);
		}
		else{
			$(".row_total").each(function(i){
				if(i==index){
    				$(this).val("-");
				}
   			});
		}
			//alert(sum);
			var total=0;
				for (var i = 0; i < sum.length; i++) {
					if(sum[i]!=""){
				    	total += parseFloat(sum[i]);
					}
				}
				total=total.toFixed(2);
				//alert(total);
				$(".row_total").each(function(index){
	    			$(this).val(sum[index]);
	    			//alert(sum[index]);
	   			});
				$("#total").val(total);
				$("#bill_amount").val($("#total").val());
				//$("#bill").val(total);
				//$("#row_tot_"+index).val(sum[index].toFixed(2))//.trigger(row_totFn());			
			
	}
	
});
		
</script>
<script>
	$(function(){
		var now = new Date();
		var dd = now.getDate();
	    var mm = now.getMonth()+1; //January is 0!
	    var yyyy = now.getFullYear();
	    if(dd<10){dd='0'+dd} 
	    if(mm<10){mm='0'+mm} 
	    var today = yyyy+'-'+mm+'-'+dd;  
	    $('.bdate').val(today);
	    //alert(today);
	    ////</%/= 
	    		//new java.text.SimpleDateFormat("dd/MM/yyyy").format(new java.util.Date()) %>
		});
</script>
<script type="text/javascript">
$(function() {
	//var id=$("#id").val();
	
	$('#subbtn').click(function() {
		
      	$("#form").attr("method", "GET");
	    $("#form").attr("action","${pageContext.request.contextPath}/add-sample");
	    $("#form").submit();
	});
	
	
	
	

	/* jsonObj = [];
    $(".qty").each(function(index) {
        item = {}
        item ["items"] = prod[index];
        item ["qty"] = qty[index];
        item ["MRP"] = mrp[index];
        item ["sell_p"] = sp[index];

        jsonObj.push(item);
    }); */
    //itemsArray = JSON.stringify(jsonObj);
    //bill_no = $(".bill_no").val();
    //$("#form").attr("method", "GET");
    //$("#form1").attr("action","${pageContext.request.contextPath}/add-items?bill_no="+bill_no+"&itemsArray ="+ itemsArray );
    //$("#form1").submit();
   
   /*  $.ajax({
        type: 'POST',
        async: false,
	  	dataType: 'text',
	 	processData: false,  
        url: '${pageContext.request.contextPath}/add-items',
      	data: { 
		    bill_no: $(".bill_no").val(),
		    itemsArray: JSON.stringify(jsonObj)
		  },
        success: function(data) {
            alert();
        }
    }); */
   
	
	
	
	
});
</script>
</body>
</html>
