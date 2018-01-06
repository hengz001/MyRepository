<%@page import="sino.java.po.user.User"%>
<%@page import="sino.java.po.group.Group"%>
<%@page import="sino.java.po.module.Module"%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	   var m_id = 0;
	   function t_showName(m_name,module_id,mainBodyId,mainBodyTYpe) {
	   		m_id = module_id;
		   $("#rid").html(m_name);
		   $("#aid").html(m_name);
		   $("#did").html(m_name);
		   $("#uid").html(m_name);
	   		
	   		var ck = document.getElementsByName("ck");
	   		for(i=0;i<ck.length;i++){
	   			ck[i].checked = false;
	   		}
	   		
	   		var url = "impower/impower.action?mainBodyId="+mainBodyId
					+"&mainBodyType="+mainBodyTYpe
					+"&module_id="+module_id;
			
			$.get(url,null,function(data){
				var saveOption = $(data).find("impower-saveOption").text();
				var deleteOption = $(data).find("impower-deleteOption").text();
				var updateOption = $(data).find("impower-updateOption").text();
				var queryOption = $(data).find("impower-queryOption").text();
			
				if(saveOption==1){
					$("#a").attr("checked",true);
				}
				if(deleteOption==1){
					$("#d").attr("checked",true);
				}
				if(updateOption==1){
					$("#u").attr("checked",true);
				}
				if(queryOption==1){
					$("#r").attr("checked",true);
				}
			});
	   }
	   
	   function t_impower(mainBody_id,mainBody_type){
			if(m_id==0){
				alert("必须选择需要授权的模块");
			}else{
				var str = "";
				var ss = document.getElementsByName("ck");
				for(i=0;i<ss.length;i++){
					if(ss[i].checked){
						str += ss[i].value+",";
					}
				}
				var url = "impower/impower_impower.action?mainBodyId="+mainBody_id
					+"&mainBodyType="+mainBody_type
					+"&str="+str
					+"&module_id="+m_id;
				document.location = url;
			}				   
	   }
	   
	   function choose(){
			var ck = document.getElementsByName("ck");
			for(i=0;i<ck.length;i++){
				if(ck[i].checked==true){
					ck[i].checked=false;
				}else{
					ck[i].checked=true;
				}
			}
		
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
				      
				      Group group = (Group)request.getAttribute("group");
				      
				      User user = (User)request.getAttribute("user");
				      
				      int pid = 0;
				      for(Module module : modules) {
				    	  if(module.getParent()==null) {
				    		  pid = module.getM_id();
                             if(null == user){
 							  %>
                               d.add(<%=pid%>,0,"<%=module.getM_name()%>","javascript:void(t_showName('<%=module.getM_name()%>',<%=module.getM_id()%>,<%=group.getG_id()%>,'group'))")
                              <%                             
                             }else{
                              %>
                               d.add(<%=pid%>,0,"<%=module.getM_name()%>","javascript:void(t_showName('<%=module.getM_name()%>',<%=module.getM_id()%>,<%=user.getU_id()%>,'user'))")
                              <%
                             }
				    	  }
				    	  if(module.getChildren().size()!=0) {
				    		  for(Module moduleChild : module.getChildren()) {
				    			 if(null == user){
							      %>
				    			  d.add(<%=moduleChild.getM_id()%>,<%=pid%>,"<%=moduleChild.getM_name()%>","javascript:void(t_showName('<%=moduleChild.getM_name()%>',<%=moduleChild.getM_id()%>,<%=group.getG_id()%>,'group'))")
				    			  <%		                             
	                             }else{
	                               %>
				    			  d.add(<%=moduleChild.getM_id()%>,<%=pid%>,"<%=moduleChild.getM_name()%>","javascript:void(t_showName('<%=moduleChild.getM_name()%>',<%=moduleChild.getM_id()%>,<%=user.getU_id()%>,'user'))")
				    			  <%
	                             }
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
					<div class="button" onmouseover="buttonHover(this,'WEB/')" onmouseout="buttonNormal(this,'WEB/')" onclick="choose();">
					全选
					</div>
				</li>
				<li>
				<s:if test="#request.group == null">
				  <div class="button" onmouseover="buttonHover(this,'WEB/')" onmouseout="buttonNormal(this,'WEB/')" 
					  onclick="t_impower(<s:property value="#request.user.u_id"/>,'user')">
					用户授权
				</s:if>
				<s:else>
				  <div class="button" onmouseover="buttonHover(this,'WEB/')" onmouseout="buttonNormal(this,'WEB/')" 
					  onclick="t_impower(<s:property value="#request.group.g_id"/>,'group')">
					用户组授权
				</s:else>
					
				</div>
				</li>
			</ul>
 
			</td>
		</tr>
	</table>
	</div>

  </body>
</html>
