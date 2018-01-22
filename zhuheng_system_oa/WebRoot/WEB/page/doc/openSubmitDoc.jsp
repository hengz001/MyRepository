<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'openSubmitDoc.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link rel="stylesheet" type="text/css" href="WEB/css/reset.css" />
	<link rel="stylesheet" type="text/css" href="WEB/css/mainstyle.css" />
	<script type="text/javascript" src="WEB/js/mainjs.js"></script>
  </head>
  
  <body>
	<div align="center">
	<table width="300" height="150">
		<tr>
			<td height="60" align="left" colspan="2"
				style="background-image:url(WEB/imgs/document/documentbar1.jpg);height:60px; line-height:60px">
				<div style="width:70px; height:60px; float:left"></div>
				<p  style="color:#0066ff; font-size:18px" class="textShadow">提交</p>
			</td>
		</tr>
		<tr>
			<td class="inputline" align="center">
				请选择一个步骤进行提交
			</td>
		</tr>
		<tr>
			<td class="inputline" align="center">
				项目经理会签
			</td>
		</tr>
		<tr>
			<td class="inputline" align="center">
			<div class="button" onmouseover="buttonHover(this,'WEB/')" onmouseout="buttonNormal(this,'WEB/')">
				提交
			</div>
			</td>
		</tr>
	</table>
	</div>
</body>
</html>
