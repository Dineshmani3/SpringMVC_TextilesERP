<div style="background:url(${pageContext.request.contextPath}/static/images/bg_inner.jpg);width: 100%;border-bottom: 1px solid #edecec;">
	<div class="wrapper">
            
		<table cellpadding="0" cellspacing="0" border="0" style="width:100%;font-size: 12px;padding-top:15px; margin-bottom:5px;">
		    <tr>
		        <td width="157" align="right"></td>
		        <td width="867" align="right" style="color: blue !important;"><strong>Welcome</strong>  ${loggedinuser}</td>
		        <td width="9" align="right" style="color: #fff;">&nbsp;</td>
		        <td width="59" align="right">
				<ul class="nav nav-pills">
		          <li class="dropdown">
		            <a href="#" data-toggle="dropdown" role="button" id="drop4" class="dropdown-toggle btn btn-small" style="font-size:13px; padding-top:2px; padding-bottom:2px; padding-left:10px; padding-right:10px;"><img src="<c:url value='/static/images/setting.png' />" /> <b class="caret"></b></a>
		            <ul aria-labelledby="drop4" role="menu" class="dropdown-menu" id="menu1" style="text-align:left;">
		              <li role="presentation"><a href="logout" tabindex="-1" role="menuitem" style="font-size:13px;">Logout</a></li>
		            </ul>
		          </li>
		       </ul> 
		      </td>
		    </tr> 
		</table>
    </div>         
</div>
