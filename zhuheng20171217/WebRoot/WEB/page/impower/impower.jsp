<%@page import="sino.java.po.module.Module"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'impower.jsp' starting page</title>
    
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
	<script type="text/javascript" src="WEB/js/dtree.js"></script>
	<script type="text/javascript" src="WEB/js/jquery-1.4.2.js"></script>
	<link rel="stylesheet" type="text/css" href="WEB/css/dtree.css" />
	<style type="text/css">
		#buttons li{
			list-style:none;
			float:left;
			width:120px;
			height:35px;
		}
	
	</style>
	<script type="text/javascript">
	   function t_showName(m_name) {
		   $("#rid").html(m_name);
		   $("#aid").html(m_name);
		   $("#did").html(m_name);
		   $("#uid").html(m_name);
	   }
	</script>

  </head>
  
  <body>
    <div align="center">
	<table width="600" height="400">
		<tr>
			<td height="60" align="left" colspan="2"
				style="background-image:url(WEB/imgs/authorizebar.jpg);height:60px; line-height:60px">
				<div style="width:70px; height:60px; float:left"></div>
				<p  style="color:#0066ff; font-size:18px" class="textShadow">
				 <s:if test="#request.group==null">
				      <font color="red"><s:property value="#request.user.u_name"/></font> 授权
				 </s:if>
				 <s:else>
				      <font color="red"><s:property value="#request.group.g_name"/></font> 授权
				 </s:else>
				 
				</p>
			</td>
		</tr>
		<tr>
			<td height="300" align="left" width="200">
				<div style="border:1px solid; width:200px; height:300px">
				<div class="dtree">
				  <script type="text/javascript">
				    d = new dTree('d');
				    d.add(0,-1,"权限");
				    <%
				      List<Module> modules = (List)request.getAttribute("modules");
				      int pid = 0;
				      for(Module module : modules) {
				    	  if(module.getParent()==null) {
				    		  pid = module.getM_id();
                              %>
                               d.add(<%=pid%>,0,"<%=module.getM_name()%>","javascript:void(t_showName('<%=module.getM_name()%>'))")
                              <%
				    	  }
				    	  if(module.getChildren().size()!=0) {
				    		  for(Module moduleChild : module.getChildren()) {
				    			  %>
				    			  d.add(<%=moduleChild.getM_id()%>,<%=pid%>,"<%=moduleChild.getM_name()%>","javascript:void(t_showName('<%=moduleChild.getM_name()%>'))")
				    			  <%
				    		  }
				    	  }
				      }
				    %>
				    document.write(d);  
				  </script>
				</div>
				</div>
			</td>
			<td align="left" width="400">
				<div style="border:1px solid; width:400px; height:300px">
				<!-- 详细权限 -->
				<table class="myTable" width="100%">
				   <tr>
				     <th width="70%">权限功能说明</th>
				     <th width="30%">是否授权</th>
				   </tr>
				   <tr>
				     <td><label id="rid">****</label>查看</td>
				     <td><input type="checkbox" name="ck" value="r" id="r"></td>
				   </tr>
				   <tr>
				     <td><label id="aid">****</label>添加</td>
				     <td><input type="checkbox" name="ck" value="a" id="a"></td>
				   </tr>
				   <tr>
				     <td><label id="did">****</label>删除</td>
				     <td><input type="checkbox" name="ck" value="d" id="d"></td>
				   </tr>
				   <tr>
				     <td><label id="uid">****</label>修改</td>
				     <td><input type="checkbox" name="ck" value="u" id="u"></td>
				   </tr>
				</table>
				</div>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
			<ul id="buttons">
				<li>
					<div class="button" onmouseover="buttonHover(this,'WEB/')" onmouseout="buttonNormal(this,'WEB/')">
					授予所有权限
					</div>
				</li>
				<li>
					<div class="button" onmouseover="buttonHover(this,'WEB/')" onmouseout="buttonNormal(this,'WEB/')">
					取消所有权限
					</div>
				</li>
				<li></li>
				<li>
					<div class="button" onmouseover="buttonHover(this,'WEB/')" onmouseout="buttonNormal(this,'WEB/')">
					全选
					</div>
				</li>
				<li>
				  <div class="button" onmouseover="buttonHover(this,'WEB/')" onmouseout="buttonNormal(this,'WEB/')">
					授权
					</div>
				</li>
			</ul>
 
			</td>
		</tr>
	</table>
	</div>

  </body>
</html>
