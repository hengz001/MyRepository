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
  </head>
  
  <body>
    <!-- form action="zhuheng/user" method="post">
    	账号:<input type="text" name="name" id="name"/><br/>
    	密码:<input type="password" name="password" id="password"/><br/>
    	<input type="submit" value="注册"/>
    </form-->
    
    <form id="myform" action="zhuheng/testPage" method="post">
    	<table cellpadding="0" cellspacing="0" border="0" class="table_case_01">
    		<tr>
    			<td colspan="1" style="text-align: right;">
    				<input type="submit" id="seache" value="测试跳转" onclick="subData()" class="button icon edit"/>
    			</td>
    		</tr>
    	</table>
    </form>
  </body>
  
  <!-- script type="text/javascript">
  	function subData(){
  		$("#myform").attr("action","${ctx}/yugh/testPage");
  		$("myform").submit();
  	}
  </script-->
</html>
