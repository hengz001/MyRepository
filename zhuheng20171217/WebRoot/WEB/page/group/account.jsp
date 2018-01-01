<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'account.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="web/css/reset.css" />
	
	<style type="text/css">
		.textShadow{
			font-size:18px;
			text-shadow:black 2px 2px 2px;
			-ms-filter: "progid:DXImageTransform.Microsoft.DropShadow(offx=1, offy=1, color='#000000', positive='true')"; /* IE8+ */
			filter: progid:DXImageTransform.Microsoft.DropShadow(offx=1, offy=1, color='#aaaaaa', positive='true') /* IE and lower */
		}
		
		#accountInfo div{
		height:30px;
		line-height:30px;}
		
		.button{
			cursor:pointer;
			background-image:url(web/imgs/button_normal.jpg);
			width:102px;
			height:35px;
			text-align:center;
			line-height:35px
		}
	</style>
	<script type="text/javascript" src="web/js/mainjs.js"></script>

  </head>
  
  <body>
    <div align="center">
	<table width="600" height="500" cellpadding="0" cellspacing="0">
		<tr>
			<td colspan="2" align="left" 
				style=" height:60px;line-height:60px;
						background-image:url(web/imgs/accountbar.jpg);
						">
				<div style="width:70px; height:60px; float:left"></div>
				<p style="color:#0066ff; font-size:18px;" class="textShadow">
				 账号管理</p>
			</td>
		</tr>
		<tr>
			<td id="accountInfo" colspan="2" align="left">
			<!-- 账号信息显示 -->
			<div style="width:600px; float:left">&nbsp;员工编号:无</div>
			
			<div style="width:140px; float:left">&nbsp;账号:无</div>
			<div style="width:140px; float:left">密码:无</div>
			<div style="width:100px; float:left">姓名:无</div>
			<div style="width:50px; float:left">性别:男</div>
			<div style="width:50px; float:left">年龄:20</div>
			<div style="width:120px; float:left">职位:无</div>
			
			<div style="width:140px; float:left">&nbsp;联系电话:无</div>
			<div style="width:460px; float:left">住址:无</div>
			</td>
		</tr>
		<tr>
			<td width="400" style="clear:both;width:400px; height:380px">
				<div style="height:380px; width:400px; border:1px solid">
					<!-- iframe -->
				</div>
			</td>
			<td valign="top" width="200" style="vertical-align:top; width:200px">
				<div style="width:200px; height:380px;" align="center">
					<div class="button" onmouseover="buttonHover(this,'web/')" onmouseout="buttonNormal(this,'web/')"
						onclick="openModalWindow('authorize.html',600,410)">
						授权
					</div>
					<br />
					<div class="button" onmouseover="buttonHover(this,'web/')" onmouseout="buttonNormal(this,'web/')"
						 onclick="openWindow('bfgrp/grp_showAddGrp.action',300,160,'grp')">
						添加用户组
					</div>
					<div class="button" onmouseover="buttonHover(this,'web/')" onmouseout="buttonNormal(this,'web/')">
						删除用户组
					</div>
					<br />
					<div class="button" onmouseover="buttonHover(this,'web/')" onmouseout="buttonNormal(this,'web/')"
						 onclick="openModalWindow('addaccount.html',400,160)">
						添加账号
					</div>
					<div class="button" onmouseover="buttonHover(this,'web/')" onmouseout="buttonNormal(this,'web/')"
						 onclick="openModalWindow('editgroup.html',300,160)">
						改组
					</div>
					<div class="button" onmouseover="buttonHover(this,'web/')" onmouseout="buttonNormal(this,'web/')">
						删除账号
					</div>
				</div>
			</td>
		</tr>
	</table>
	</div>
  </body>
</html>
