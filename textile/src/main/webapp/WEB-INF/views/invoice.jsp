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
	<!--<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css'/>" />-->
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

b, strong{
color: #000000 !important;
}
page {
  background: white;
  display: block;
  margin: 0 auto;
  margin-bottom: 0.5cm;
  box-shadow: 0 0 0.5cm rgba(0,0,0,0.5);
}


page[size="A4"] {  
  width:24cm;
  height:29.7cm; 
}

p {
margin: 0 2px 0px !important;
}

.cost1{ 
	height:88px;
    width: 370px;
}


table.roundedCorners1 {
    border: 0px solid;
    border-radius: 8px !important;
	border-spacing:0;
	border-collapse: separate;
}

table.roundedCorners1 td, 
table.roundedCorners1 th { 
  border-bottom: 0px solid;
  border-right: 0px solid;
  }
table.roundedCorners1 tr:last-child > td {
  border-bottom: none;
}
table.roundedCorners1 tr:last-child > td {
  border-bottom: none;
  border-right: none;
}



table.roundedCorners {
    border: 1px solid;
    border-radius: 8px !important;
	border-spacing:0;
	border-collapse: separate;
}

table.roundedCorners td, 
table.roundedCorners th { 
  border-bottom: 1px solid;
  border-right: 1px solid;
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
.even {   border-right: 1px solid !important; }
.top{ border-top: 1px solid !important; }

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
/* @media print {
   .RightBorder { border-right: 0px !important; }
   
   .leftB { border-left: 0px !important; }
} */
.leftB { border-left: 0px !important; }
.leftBorder { border-left: 0px !important; }
.rightB{ border-right:0px !important; 
			}
.rightBadd{ border-right:1px solid !important;
 			border-top: 0px !important }			
.topBorder { border-top: 0px !important; }
.bottomBorder { border-bottom: 0px !important; }

</style>

</head>
<body>

<page size="A4">

<table border="0" width="100%" height="100%">
	<tr valign="top"><td>
		
		
		<form:form method="POST" modelAttribute="inv" action="add-invoice" id="form" class="form-horizontal">	
			
			
		<table border="0" width="100%" style="margin:1px;" height="1%">
		
		<tr>
			<td colspan="3" width="100%" align="center" style="font-family:tohama; font-size:15px">
				<b>INVOICE</b>
			</td>

		</tr>
		
		<tr valign="top">
			<td colspan="2" style="font-family:calibri; font-size:18px">
				&nbsp;&nbsp;&nbsp;&nbsp;<b>GST IN:  33ACLFS0851Q1ZM</b>
			</td>
			<td align="right" style="font-family:calibri; font-size:18px">
				<b>PAN NO :  ACLFS0851Q</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<br><b>9884011882</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<br><b>9940389559</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		</table>		
		
			
		<table border="0" width="95%" style="margin:13px;" height="0%">
			<tr valign="top">
				<td width="100%">
					<table border="0" width="100%" height="100%" class="bill_table roundedCorners">
						<tr>
							<td style="border-right:1px solid !important;" width="50%">
								<table border="0" style="height:100% !important;width:100%" >
								<form:hidden path="cusId" class="cusId"/>
									<tr height="80%"><td width="100%" class="rightB" valign="top"><b>M/s</b></td>
									 
									</tr>
									<tr height="20%"><td width="100%" class="rightB"><b>GST IN</b></td></tr>
								</table>
							</td>
							<td width="50%">
								<table border="0" width="100%" >
									<tr><td width="100%" class="rightB"><b>Invoice No. ${billno}</b> </td></tr>
									 <form:hidden path="bill_amount" class="bill_amount" id="bill_amount" />
									<tr><td width="100%" class="rightB" max-height="5%"><b>Date : 
									<%-- <form:input type="date" style="border:none" path="date" size="20" class="bdate" id="bdate" name="bdate" readonly="true"/>
									 --%></b></td></tr>
									<tr><td width="100%" class="rightB"><b>Through</b></td></tr>
									<tr><td width="100%" class="rightB"><b>Lorry Receipt No.</b></td></tr>
								</table>
							</td>
						</tr>
						
					</table>
				</td>
			</tr>
		</table>
		</form:form>
		
		<form id="form1" class="form-horizontal">
		<table border="0" width="95%" style="margin:13px;" height="0%">
		<tr valign="top">
			<td width="100%">
				<table border="0" width="100%" height="100%" class="bill_table roundedCorners">
					<tr valign="top">
						<td style="font-family:tohama; font-size:15px" class="RightBorder" align="center" width="5%"><b>S.No</b></td>
						<td style="font-family:tohama; font-size:16px" class="RightBorder" align="left" width="25%"><b>&nbsp;&nbsp;&nbsp;DESCRIPTION</b></td>
						<td style="font-family:tohama; font-size:16px" class="RightBorder" align="center" width="5%"><b>PIECES</b></td>
						<td style="font-family:tohama; font-size:15px" class="RightBorder" align="center" width="5%"><b>METERS</b></td>
						<td style="font-family:tohama; font-size:15px" class="RightBorder" align="center" width="10%"><b>RATE<br> Rs.</b></td>
						<td style="font-family:tohama; font-size:15px" class="RightBorder" align="center" width="10%"><b>AMOUNT<br>Rs.</b>
						<input type="hidden" class="bill_no" value="${billno}" name="bill_no" />
						</td>
					</tr>
					
					<c:forEach items="${igs.igs}"  var="igs" varStatus="c">
					<tr>
						<td style="font-weight:bold; font-family:tohama; font-size:15px" align="center" class="topBorder leftBorder RightBorder bottomBorder">
						<!-- <input type="button" class="del hidden-print" value="x" /> --><c:out value="${c.index + 1}"/>
							
						</td>
						<td id="delete" style=" font-family:tohama; font-size:17px" class="topBorder RightBorder leftBorder bottomBorder"><input type="text" style="border:none;  text-align:left;" name="items"  size="55" class="items" autofocus="autofocus" id="goods_${c.index}"/></td>
						<td id="delete" style="font-family:tohama; font-size:19px" class="topBorder RightBorder leftBorder bottomBorder"><input type="text" style="border:none;  text-align:right;" name="MRP" id="mrp_${c.index}"   class="MRP" size="5" /></td>
						<td id="delete" style="font-family:tohama; font-size:19px" class="topBorder RightBorder leftBorder bottomBorder"><input type="text" style="border:none;  text-align:right;" name="sell_p" id="sell_p_${c.index}"  class="sell_p"  size="5" /></td>
						<td id="delete" style="font-family:tohama; font-size:19px" class="topBorder RightBorder leftBorder bottomBorder"><input type="text" style="border:none;  text-align:center;" name="qty"  size="6" class="qty"  /></td>
						<td id="delete" style=" font-family:tohama; font-size:19px" class="odd topBorder RightBorder leftBorder bottomBorder" ><input type="text" style="border:none;  text-align:right;" id="row_tot_${c.index}" class="row_total" size="8"  /></td>
						
					</tr>
					</c:forEach> 
					
					<tr>
						<td style="font-weight:bold; font-family:tohama; font-size:15px" align="center" class="top leftBorder RightBorder bottomBorder">
						</td>
						<td id="delete" style=" font-family:tohama; font-size:17px" class="top RightBorder leftBorder bottomBorder"></td>
						<td id="delete" style="font-family:tohama; font-size:19px" class="top RightBorder leftBorder bottomBorder"></td>
						<td id="delete" style="font-family:tohama; font-size:19px" class="top RightBorder leftBorder bottomBorder"><input type="text" style="border:none;  text-align:right;" name="sell_p" id="sell_p_${c.index}"  class="sell_p"  size="5" /></td>
						<td id="delete" style="font-family:tohama; font-size:19px" class="top RightBorder leftBorder bottomBorder"><input type="text" style="border:none;  text-align:center;" name="qty"  size="6" class="qty"  /></td>
						<td id="delete" style=" font-family:tohama; font-size:19px" class="odd top RightBorder leftBorder bottomBorder" ><input type="text" style="border:none;  text-align:right;" id="row_tot_${c.index}" class="row_total" size="8"  /></td>
						
					</tr>
					<tr>
					<td class="rightBadd" style="border-top:1px solid !important"></td>
					<td class="rightBadd" style="border-top:1px solid !important"></td>
					<td class="rightB" style="border-top:1px solid !important" colspan="4">
						<table border="0" width="100%">
						<tr id="totalrow" width="100%">
							<td class="RightBorder top" width="40.5%">
							</td>
							<td width="30%" align="center" style=" font-family:tohama; font-size:10px" class="RightBorder top" > <b>DISCOUNTS</b> </td>
							<td width="30%" style=" font-family:tohama; font-size:18px" class="top leftBorder rightB"> 
							<input type="text" style="border:none; text-align:right;" id="total" size="9" value=""/></td>
						</tr>	
						<tr id="totalrow">
							<td class="RightBorder " width="40%" >
							</td>
							<td width="30%" align="center" style=" font-family:tohama; font-size:10px" class="RightBorder  " > <b>TAXABLE AMOUNT</b> </td>
							<td width="30%" style=" font-family:tohama; font-size:18px" class="leftB RightBorder"> 
							<input type="text" style="border:none; text-align:right;" id="round" readonly="true" size="9" value=""/></td>
						</tr>	
						<tr id="totalrow">
							<td class="RightBorder " width="40%" >
							</td>
							<td width="30%" align="center" style=" font-family:tohama; font-size:10px" class="RightBorder " > <b>IGST</b> </td>
							<td width="30%" style=" font-family:tohama; font-size:18px" class="leftB RightBorder"> 
							<input type="text" style="border:none; text-align:right;" id="round" readonly="true" size="9" value=""/></td>
						</tr>	
						<tr id="totalrow">
							<td class="RightBorder " width="40%" >
							</td>
							<td width="30%" align="center" style=" font-family:tohama; font-size:10px" class="RightBorder " > <b>CGST : 2.5 %</b> </td>
							<td width="30%" style=" font-family:tohama; font-size:18px" class="leftB RightBorder"> 
							<input type="text" style="border:none; text-align:right;" id="round" readonly="true" size="9" value=""/></td>
						</tr>	
						<tr id="totalrow">
							<td class="rightBadd " width="40%"  >
							</td>
							<td width="30%" align="center" style=" font-family:tohama; font-size:10px" class="RightBorder " > <b>SGST : 2.5%</b> </td>
							<td width="30%" style=" font-family:tohama; font-size:18px" class="leftB RightBorder"> 
							<input type="text" style="border:none; text-align:right;" id="round" readonly="true" size="9" value=""/></td>
						</tr>	
						
						</table>
					</td>
					</tr>
					<tr id="totalrow">
							<td class="even " colspan="2" width="40%" >
							</td>
							<td></td>
							<td width="30%" align="center" style=" font-family:tohama; font-size:10px" class="even " > </td>
							<td width="30%" style=" font-family:tohama; font-size:18px" class="leftB rightB"> 
							<input type="text" style="border:none; text-align:right;" id="round" readonly="true" size="9" value=""/></td>
					</tr>
					<tr style="height:100%">
					<td colspan="6">
						<table border="0" width="100%">
						<tr>
						<td class="rightB bottomBorder" style="width:40%"><br>&nbsp;&nbsp;&nbsp;&nbsp;<b>Buyers Signature</b>...................................................<br><br><br></td>
						<td class="rightB bottomBorder" style="width:20%"><br><b>Checked by</b>........................<br><br><br></td>
						<td class="rightB bottomBorder" style="width:40%" align="right"><br>For <b>Sri Saravana Traders</b>&nbsp;&nbsp;<br><br><br></td>
						</tr>
						<tr>
						<td class="topBorder" colspan="3" align="right">
						(P.T.O)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
						</tr>
						</table>
					</td>
					</tr>
					
				</table>
			</td>
		</tr>
		</table>
		
	</form>
	</td></tr>
</table>
	<input type="button" id="subbtn" class="hidden-print pull-right" value="Print" />
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
			
			
			itemAutocomplete();
			
			
			
		$(document).on('keyup',".row_total",function (event) {
			//$(".row_total").each(function(){
		    if (event.keyCode == 13) {
		    	
		       // $(this).closest('tr').after('<tr>'+
		    	$("#totalrow").before('<tr>'+
		            '<td style="font-weight:bold; font-family:tohama; font-size:15px" class=" topBorder RightBorder leftBorder bottomBorder table-cell" align="center"><input type="button" class="del hidden-print" value="x" />' + cc + '</td>' +
		            '<td style=" font-family:tohama; font-size:17px" class="topBorder RightBorder leftBorder bottomBorder table-cell">' +
		            '<input type="text" style="border:none;  text-align:left;" size="35" class="items" name="items" />' +
		            '</td>' +
		            '<td style=" font-family:tohama; font-size:19px" class="topBorder RightBorder leftBorder bottomBorder table-cell">' +
		            '<input type="text" style="border:none;  text-align:right;" size="6" class="MRP" id="mrp_'+c+'" name="MRP" />' +
		            '</td>' +
		            '<td style=" font-family:tohama; font-size:19px" class="topBorder RightBorder leftBorder bottomBorder table-cell">' +
		            '<input type="text" style="border:none;  text-align:right;" size="7" class="sell_p" id="sell_p_'+c+'" name="sell_p" />' +
		            '</td>' +
		            '<td style=" font-family:tohama; font-size:19px" class="topBorder RightBorder leftBorder bottomBorder table-cell">' +
		            '<input type="text" style="border:none;  text-align:center;"  size="6" class="qty" name="qty" />' +
		            '</td>' +
		            '<td style=" font-family:tohama; font-size:19px" class="topBorder RightBorder leftBorder bottomBorder odd table-cell">' +
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
					q = eval($(this).val());
					qty[index]=q;
					
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
			$(".sell_p").each(function(index){
				$(this).keyup(function(){
					//alert();
					sp[index]=$(this).val();
					
					rowTotal(index);
				});
			});
			
			 $(".row_total").each(function(index){
				$(this).keyup(function(){
					sum[index]=$(this).val();
					
					var total=0;
					for (var i = 0; i < sum.length; i++) {
						if(sum[i]!=""){
					    	total += parseFloat(sum[i]);
						}
					}
					total=total.toFixed(2);
					
					$("#total").val(total);
					$("#bill_amount").val($("#total").val());
				});
			}); 
			
			
			itemAutocomplete();
			//});
		});
		//});
	//},3000);
		function itemAutocomplete(){
			$(".items").each(function(index){
				$(this).autocomplete({
					serviceUrl: '${pageContext.request.contextPath}/getTags',
					paramName: "tagName",
					delimiter: ",",
				    transformResult: function(response) {
				    	
				        return {
				        	
				            suggestions: $.map($.parseJSON(response), function(item) {
				            
				                return { value:item.id+": "+item.tagName, data: item.id };
				            })
				            
				        };
				        
				    },
				    onSelect: function(){
				    	//alert();
				    	var i=$(this).val();
		    			var item=i.split(":");
		    			var str = $('<div/>').html(item[1]).text();
		    			$(this).val(str);
		    			prod[index]=item[1];
		    			fill_rate(item[0],index)
				    }
				    
				});
			
			});
		}
		
		setInterval(function(){
			$(".del").each(function(index){
				$(this).click(function(){
					//var table = $('.bill_table');
	            		sp.splice(index,0);
      					qty.splice(index,0);
      					
      					//sp[index]="";
      					//qty[index]="";
      					//alert(sp);
      					//alert(sum);
	                    $(this).parent().parent().remove();
	                    sum[index]=0.0;
	                    sum.splice(index,0);
	                    
	                    var total=0;
						for (var i = 0; i < sum.length; i++) {
							if(sum[i]!=""){
						    	total += parseFloat(sum[i]);
							}
						}
						total=total.toFixed(2);
						
						$("#total").val(total);
						$("#bill_amount").val($("#total").val());
		        });
			});
		},500);
		
		function fill_rate(id,i){
			<c:forEach items="${inven}" var="inven" varStatus="c">
	    		var i_id= parseInt("${inven.item_id}");
	    		if(parseInt(id)==i_id){
	    			m = "${inven.MRP}";
	    			s = "${inven.s_p}";
	    			$("#mrp_"+i).val(parseFloat(m).toFixed(2));
	    			$("#sell_p_"+i).val(parseFloat(s).toFixed(2));
	    			mrp[i]=$("#mrp_"+i).val();
	    			sp[i]=$("#sell_p_"+i).val();
	    			//alert(mrp+"---"+sp);
	    		}
			</c:forEach>
		}
		
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
			q = eval($(this).val());
			qty[index]=q;
			
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
	$(".sell_p").each(function(index){
		$(this).keyup(function(){
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
				$(".row_total").each(function(indx){
					if(typeof(sum[indx])!='undefined'){
						$(this).val(parseFloat(sum[indx]).toFixed(2));
					}
	   			});
				$("#total").val(total);
				$("#bill_amount").val($("#total").val());
				//$("#bill").val(total);
				//$("#row_tot_"+index).val(sum[index].toFixed(2))//.trigger(row_totFn());			
			
	}
	
	
	//Customer Autocomplete
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
	    	$(".cusId").val(cus[0]);
	    	//alert(cus[1]);
	    	//$("#id").val(cus[0]);
    		//cus_fn(cus[0]);
	    }
	    
	});
	
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
		
		$forms = $('form');

        sent = 0;


        // post the form (non-async)

        $forms.each(function() {

           jQuery.ajax({

                type: "post",

                async: false,

                url: jQuery(this).attr("action"),

                data: jQuery(this).serialize(),

                success: function(data) {

                    if(++sent == $forms.length) {

                        //window.location.reload(true);

                    }

                }

            });

          /*  var url = "${pageContext.request.contextPath}/invoice"; 
           window.location.href = url;  */
           
           
       
        });
        form2();
	 
});
	function form2(){
		//if($(".customer").val()==""||$(".customer").val()==null){
			$('#name').addClass('hidden-print');
		//} 
		window.print();
		$("#form1").attr("method", "GET");
	    $("#form1").attr("action","${pageContext.request.contextPath}/add-items");
	    $("#form1").submit();
	    
	} 
});
</script>
</body>
</html>