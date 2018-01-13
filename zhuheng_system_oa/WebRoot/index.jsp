<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="WEB/css/reset.css" />	
</head>

<body>

	<form action="user/user_login.action" method="post">
		<div style="background-image:url(WEB/imgs/loginimage.jpg); width:1000px; height:610px">
			<input name="image" type="image"
				style="position:absolute; left:844px; top: 265px;"
				src="WEB/imgs/gobutton.jpg" /> <input type="text"
				name="user.u_name"
				style="width:90px; border:none; height:13px;
				background-color:#ddeffd;
				position:absolute;
				left:735px;
				top:268px" />
			<input type="password" name="user.u_pwd"
				style="width:90px; border:none; height:13px; background-color:#ddeffd; position:absolute; left: 735px; top: 300px;" />

		</div>
	<form>
</body>
</html>
