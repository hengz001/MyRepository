<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@taglib uri="/struts-tags" prefix="s" %>
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
  </head>
  
  <body>
	<table>
		<tr>
			<td>ID</td>
			<td>NAME</td>
			<td>PASSWORD</td>
		</tr>			
		<s:iterator value="pv.pageList">
			<tr>
				<td><s:property value="id"/></td>
				<td><s:property value="name"/></td>
				<td><s:property value="password"/></td>
			</tr>
		</s:iterator>
		<tr>
			<td><a href="user/user_findByPage?page=${pm.firstPage}">首页</a></td>
			<td><a href="user/user_findByPage?page=${pm.previousPageNo}">上一页</a></td>
			<td><a href="user/user_findByPage?page=${pm.nextPageNo}">下一页</a></td>
			<td><a href="user/user_findByPage?page=${pm.totalPage}">末页</a></td>
		</tr>
	</table>    
    <!-- form action="zhuheng/findByPage" method="post">
	    This is my SUCCESS page. <br>欢迎${name}登陆
    	账号:<input type="text" name="name" id="name"/><br/>
    	密码:<input type="password" name="password" id="password"/><br/>
    	<input type="submit" value="注册"/>
    </form>
     -->
  </body>
</html>
