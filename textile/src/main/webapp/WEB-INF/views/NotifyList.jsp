<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
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
<script type="text/javascript" src="<c:url value='/static/js/jquery1.8.3.js' />" ></script>
<script type="text/javascript" src="<c:url value='/static/js/superfish.js' />" ></script>
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
    <h4>NOTIFICATION</h4>
 </div>

</div>
<div style="clear:both">&nbsp;</div>


<div style="clear:both">&nbsp;</div>
<table width="100%" cellpadding="0" cellspacing="0" class="table table-striped table-bordered margin-datatable" id="example" style="margin:auto">
  <thead>
            <tr>
				<th width="150">NAME</th> 
				<th width="158">MOBILE</th>
				<th width="158">REMINDER DATE (YY-MM-DD)</th>
				<th width="158">LANDMARK</th>
                <th width="93" >Action</th>  
                      
            </tr> 
 	</thead> 
	<tbody>
		<c:forEach items="${customerBean}" var="user">
        	<tr>
        		<td>${user.firstname}</td>
        		<td>${user.contact_no}</td>
        		<td>${user.notifydate}</td>
        		<td>${user.landmark}</td>
       			<td><a href="<c:url value='/cus/cuslist-${user.cusId}' />" >Edit</a></td>
				
			</tr>
		</c:forEach>
	</tbody>
</table>
<div style="width:100%; font-size:13px;">  
<div class="pagination"><span class="disabled">Previous</span><span class="current">1</span><a href="">2</a><a href="index.php?page=students&pg=3&type=all">3</a><a href="index.php?page=students&pg=2&type=all">Next</a></div>
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
                </div>
          
            <%@ include file="footer.jsp"  %> 
</body>
</html>