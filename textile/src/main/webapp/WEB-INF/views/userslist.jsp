<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<style type="text/css"> 
.alert-error{ width:96%;border-radius:4px;margin-top:5px;padding:8px;background:#F2DEDE;}
.alert-success{ width:96%;border-radius:4px;margin-top:5px;padding:8px;background:#DFF0D8;}
</style>
<!-- <script type="text/javascript" src="static/js/jquery1.8.3.js"></script> -->
<script type="text/javascript" src="<c:url value='/static/js/jquery/jquery-1.11.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery/jquery_ui/jquery-ui.min.js'/>"></script>
 
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

<script type="text/javascript" src="static/js/plugins/bootstrap-confirmation.js"></script> 
<link rel="stylesheet" type="text/css" href="static/css/DT_bootstrap.css" /> 
<link rel="stylesheet" type="text/css" href="static/css/pagination.css" /> 

<div class="add_title_width">
<div class="head_title">
    <h4><b style="color:#bf0d0d !important">MANAGE</b><b> ADMIN/USERS</b></h4>
 </div>
<div class="add_lable" >
	<span style="float:right">	
      	<a href="<c:url value='/newuser' />" class="btn btn-small"> 	<span class="glyphicon glyphicon-plus"></span> Create User</a>&nbsp;
        <!--  <a href="" class="btn btn-small"> 	<span class="glyphicon glyphicon-plus"></span> Show all</a>&nbsp; -->
     </span>
</div>
</div>
<div style="clear:both">&nbsp;</div>


<div style="clear:both">&nbsp;</div>
<table style="width:50% !important" cellpadding="0" cellspacing="0" class="table table-striped table-bordered margin-datatable" id="example" style="margin:auto">
  <thead>
            <tr>
				<th width="15">S.No</th>
				<th width="250">User Name</th>
				
				<sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
                <th width="100" style="text-align:center;">Action</th>  
                </sec:authorize>
				<sec:authorize access="hasRole('ADMIN')">
                <th width="100" style="text-align:center;">Action</th>       
                </sec:authorize>             
            </tr>
 	</thead>
	<tbody>
		<c:forEach items="${users}" var="user" varStatus="counter">
        	<tr>
        		<td stle>${counter.index+1}</td>
        		<td>${user.ssoId}</td>
        		
        		<sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
        			<td style="text-align:center"><a class="btn btn-xs btn-primary"  data-toggle="confirmation" data-title="Open Google?" href="<c:url value='/edit-user-${user.ssoId}' />" >&nbsp;&nbsp;Edit&nbsp;&nbsp;</a></td>
        		</sec:authorize>
				<sec:authorize access="hasRole('ADMIN')">
					<td style="text-align:center"><a class="btn btn-xs btn-danger confirm-alert" href="<c:url value='/delete-user-${user.ssoId}' />" >&nbsp;&nbsp;Delete&nbsp;&nbsp;</a></td>
    			</sec:authorize>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div style="width:100%; font-size:13px;">  

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