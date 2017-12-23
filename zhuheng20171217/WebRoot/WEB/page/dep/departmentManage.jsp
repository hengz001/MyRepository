<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="sino.java.po.dep.Department"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'departmentManage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="WEB/css/reset.css" />
	<link rel="stylesheet" type="text/css" href="WEB/css/mainstyle.css" />
	<link rel="stylesheet" type="text/css" href="WEB/css/dtree.css" />
	<script type="text/javascript" src="WEB/js/mainjs.js"></script>
	<script type="text/javascript" src="WEB/js/dtree.js"></script>
	<style type="text/css">
		.tinfo td{height:30px; line-height:30px}
	</style>

  </head>
  
  <body>
    <div align="center">
	<table width="600" height="460" cellpadding="0" cellspacing="0">
		<tr>
			<td colspan="2" align="left" 
				style=" height:60px;line-height:60px;
						background-image:url(WEB/imgs/accountbar.jpg);
						">
				<div style="width:70px; height:60px; float:left"></div>
				<p style="color:#0066ff; font-size:18px;" class="textShadow">
				 部门管理</p>
			</td>
		</tr>
		<tr>
			<td width="200" style="width:200px; height:300px" valign="top">
				<div style="height:300px; width:200px; border:1px solid">
					<script type="text/javascript">
					d = new dTree('d');
					d.add(0,-1,'腾百万逗淘宝');
					<%
						List<Department> dps = (List<Department>)request.getAttribute("depAll");
						int depId = 0;
						for(Department dep : dps){
							if(dep.getparent() == null){
								depId = dep.getDep_id();
								%>
								d.add(<%=dep.getDep_id()%>,0,'<%=dep.getDep_name()%>');	
								<%
							}
							if(dep.getChild().size()!=0){
								for(Department dep2:dep.getChild()){
									%>
									d.add(<%=dep2.getDep_id()%>,<%=depId%>,'<%=dep2.getDep_name()%>');	
									<%
								}
							}
						}
					%>
					document.write(d);
					</script>
				</div>
			</td>
			<td valign="top" width="400" align="center">
				<table width="90%" class="tinfo">
					<tr>
						<td align="right" width="40%">部门名称:</td>
						<td width="60%" align="left"><input type="text" /></td>
					</tr>
					<tr>
						<td align="right">部门编号:</td>
						<td align="left"><input type="text" /></td>
					</tr>
					<tr>
						<td align="right">上级部门:</td>
						<td align="left"><input type="text" /></td>
					</tr>
					<tr>
						<td align="right" valign="top" style="vertical-align:top">部门描述:</td>
						<td align="left"><textarea style="width:160px; height:50px"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<div class="button" onmouseover="buttonHover(this,'WEB/')" onmouseout="buttonNormal(this,'WEB/')" style="float:left">
									修改
							</div>
							<div class="button" onmouseover="buttonHover(this,'WEB/')" onmouseout="buttonNormal(this,'WEB/')" style="float:left">
									添加
							</div>
							<div class="button" onmouseover="buttonHover(this,'WEB/')" onmouseout="buttonNormal(this,'WEB/')" style="float:left">
									删除
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="left" style="height:100px">
				<fieldset style="border:1px solid #cccccc; height:100px">
					<legend>查找部门</legend>
					<table width="98%" class="tinfo">
						<tr>
							<td width="100%" align="center"><input type="radio" />按编号查询&nbsp;&nbsp;<input type="radio" />按名称查询 </td>
						</tr>
						<tr>
							<td align="center">查询条件:<input type="text"  />
							<div class="button" onmouseover="buttonHover(this,'WEB/')" onmouseout="buttonNormal(this,'WEB/')" style="float:right">
									查询
							</div>
							</td>
						</tr>
					</table>
				</fieldset>

			</td>	
		</tr>
	</table>
	</div>
  </body>
</html>
