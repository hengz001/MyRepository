<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="../common/common.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'main_left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="WEB/css/reset.css" />
 <style type="text/css">
 	div.functionButton{
		cursor:pointer;
		width:188px;
		height:44px;
		line-height:44px;
		text-align:center;
		color:#ffffff;
	}
	.textShadow{
		color:#FFFFFF;
		cursor:pointer;
		font-size:18px;
		text-shadow:black 2px 2px 2px;
		-ms-filter: "progid:DXImageTransform.Microsoft.DropShadow(offx=1, offy=1, color='#000000', positive='true')"; /* IE8+ */
		filter: progid:DXImageTransform.Microsoft.DropShadow(offx=1, offy=1, color='#000000', positive='true') /* IE and lower */
	}
 </style>
 
 <script type="text/javascript" src="WEB/js/jquery-1.4.2.min.js"></script>
  <script type="text/javascript">
  	//改变按钮图片
 	function changePic(obj,picName){
		obj.style.backgroundImage = 'url(' + picName + ')';
	}
	
	//跳转路径
	function gotoLocation(path){
		window.top.rightFrame.document.location=path; 
	}
 </script>

  </head>
 
  <body>
    <div style="background-image:url(WEB/imgs/mainFunction_bar.jpg); width:188px; height:403px;">
		<s:iterator value="#request.mods">
			<s:if test="parent==null">
			<div style="height:35px"></div>
			<div class="functionButton" 
				style="background-image:url('<s:property value="m_path_c"/>')"
				onmouseover="changePic(this,'<s:property value="m_path_n"/>')"
				onmouseout="changePic(this,'<s:property value="m_path_c"/>')"
				onclick="gotoLocation('<s:property value="m_address"/>?mid=<s:property value="m_id"/>')">
				<p class="textShadow" onclick="gotoLocation('<s:property value="m_address"/>')">
				&nbsp;&nbsp;<s:property value="m_name"/></p>
			</div>
			</s:if>
		</s:iterator>
		<!-- 
		<div style="height:35px"></div>
		<div class="functionButton" 
				style="background-image:url(WEB/imgs/zzgl_normal.jpg)"
				onmouseover="changePic(this,'zzgl_choose.jpg')"
				onmouseout="changePic(this,'zzgl_normal.jpg')"
				onclick="gotoLocation('WEB/page/main/main_right_zzgl.jsp')">
				<p class="textShadow" onclick="gotoLocation('main_right_zzgl.jsp')">&nbsp;&nbsp;组织管理</p>
		</div>
		<div style="height:5px"></div>
		<div class="functionButton" 
				style="background-image:url(WEB/imgs/qxgl_normal.jpg)"
				onmouseover="changePic(this,'qxgl_choose.jpg')"
				onmouseout="changePic(this,'qxgl_normal.jpg')"
				onclick="gotoLocation('WEB/page/main/main_right_qxgl.jsp')">
				<p class="textShadow" onclick="gotoLocation('main_right_qxgl.jsp')">&nbsp;&nbsp;权限管理</p>
		</div>
		<div style="height:5px"></div>
		<div class="functionButton" 
				style="background-image:url(WEB/imgs/gwgl_normal.jpg)"
				onmouseover="changePic(this,'gwgl_choose.jpg')"
				onmouseout="changePic(this,'gwgl_normal.jpg')"
				onclick="gotoLocation('WEB/page/main/main_right_gwgl.jsp')">
				<p class="textShadow" onclick="gotoLocation('main_right_gwgl.jsp')">&nbsp;&nbsp;公文管理</p>
		</div>
		<div style="height:5px"></div>
		<div class="functionButton" 
				style="background-image:url(WEB/imgs/lcgl_normal.jpg)"
				onmouseover="changePic(this,'lcgl_choose.jpg')"
				onmouseout="changePic(this,'lcgl_normal.jpg')"
				onclick="gotoLocation('WEB/page/main/main_right_lcgl.jsp')">
				<p class="textShadow" onclick="gotoLocation('main_right_lcgl.jsp')">&nbsp;&nbsp;流程管理</p>
		</div>
		 -->
	</div>
	
	<div style="background-image:url(WEB/imgs/main_left_bar2.jpg); width:188px; height:380px">

	</div>
  </body>
</html>
