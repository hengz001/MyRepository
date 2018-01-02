<%@page import="sino.java.po.user.User"%>
<%@page import="sino.java.po.group.Group"%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" type="text/css" href="WEB/css/reset.css" />
	
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
			background-image:url(WEB/imgs/button_normal.jpg);
			width:102px;
			height:35px;
			text-align:center;
			line-height:35px
		}
	</style>
	<link rel="stylesheet" type="text/css" href="WEB/css/dtree.css" />
	<script type="text/javascript" src="WEB/js/mainjs.js"></script>
	<script type="text/javascript" src="WEB/js/dtree.js"></script>
	<script type="text/javascript" src="WEB/js/jquery-1.4.2.js"></script>
 	<script type="text/javascript">
 		function t_delete(gid){
 			$('#deleteId').unbind("click");
			$('#ImpowerId').unbind("click");
				
			$('#deleteId').click(function() {
				document.location="group/group_deleteGrp?g_id="+gid;
			}) ;
			$('#ImpowerId').click(function(){
				openWindow('impower/impower_showImpowerView.action?mainBodyId='+gid+'&mainBodyType=group',600,400)
			});	
 		}
 		
 		function t_showName(u_id){
 			$('#deleteId').unbind("click");
 			$('#deleteName').unbind("click");
 			$('#updateId').unbind("click");
			$('#ImpowerId').unbind("click"); 			
 			
 			$('#updateId').click(function(){
 				openWindow("group/group_openUpdateGroup.action?u_id="+u_id, 600, 400, "");
 				
 			});
 			$('#deleteName').click(function() {
 				document.location = "user/user_deleteUser?u_id="+u_id;
 			});
 			$('#ImpowerId').click(function(){
				openWindow('impower/impower_showImpowerView.action?mainBodyId='+u_id+'&mainBodyType=user',600,400)
			});
 		
 			var url = "user/user_showUser?u_id="+u_id;
 			$.get(url,null,function(data){
 				$('#sn').html($(data).find("user-sn").text());
 				$('#zh').html($(data).find("user-name").text());
 				$('#pwd').html($(data).find("user-password").text());
 				$('#ename').html($(data).find("user-trueName").text());
 				$('#sex').html($(data).find("user-sex").text());
 				$('#job').html($(data).find("user-job").text());
 				$('#phone').html($(data).find("user-phone").text());
 				$('#address').html($(data).find("user-address").text());
 			});
 		}
 	
 	</script>
  </head>
  
  <body>
    <div align="center">
	<table width="600" height="500" cellpadding="0" cellspacing="0">
		<tr>
			<td colspan="2" align="left" 
				style=" height:60px;line-height:60px;
						background-image:url(WEB/imgs/accountbar.jpg);
						">
				<div style="width:70px; height:60px; float:left"></div>
				<p style="color:#0066ff; font-size:18px;" class="textShadow">
				 账号管理</p>
			</td>
		</tr>
		<tr>
			<td id="accountInfo" colspan="2" align="left">
			<!-- 账号信息显示 -->
			<div style="width:600px; float:left">&nbsp;员工编号:<lable id="sn"></lable></div>
			
			<div style="width:140px; float:left">&nbsp;账号:<lable id="zh"></lable></div>
			<div style="width:140px; float:left">密码:<lable id="pwd"></lable></div>
			<div style="width:100px; float:left">姓名:<lable id="ename"></lable></div>
			<div style="width:50px; float:left">性别:<lable id="sex"></lable></div>
			<div style="width:50px; float:left">年龄:...</lable></div>
			<div style="width:120px; float:left">职位:<lable id="job"></lable></div>
			
			<div style="width:140px; float:left">&nbsp;联系电话:<lable id="phone"></lable></div>
			<div style="width:460px; float:left">住址:<lable id="address"></lable></div>
			</td>
		</tr>
		<tr>
			<td width="400" style="clear:both;width:400px; height:380px">
				<div style="height:380px; width:400px; border:1px solid">
					<!-- iframe -->
					<script type="text/javascript">
					 	d = new dTree('d');
					 	d.add(0,-1,'组');
					 	<%
					 	List<Group> groups = (List)request.getAttribute("groups");
					 	List<User> users = (List)request.getAttribute("users");
					 	int gid = 0;
					 	for(Group group:groups){
					 		gid = group.getG_id();
					 		%>
					 		d.add(<%=gid%>,0,'<%=group.getG_name()%>',"javascript:void(t_delete(<%=gid%>))");	
					 		<%
					 	}
					 	for(User user:users){
					 		gid = user.getU_id();
					 		%>
					 		d.add('<%=gid%>i',<%=user.getGroup().getG_id()%>,'<%=user.getU_name()%>',"javascript:void(t_showName(<%=user.getU_id()%>))");	
					 		<%
					 	}
					 	%>
						document.write(d);
					</script>
				</div>
			</td>
			<td valign="top" width="200" style="vertical-align:top; width:200px">
				<div style="width:200px; height:380px;" align="center">
					<div class="button" onmouseover="buttonHover(this,'WEB/')" onmouseout="buttonNormal(this,'WEB/')"
						id="ImpowerId">
						授权
					</div>
					<br />
					<div class="button" onmouseover="buttonHover(this,'WEB/')" onmouseout="buttonNormal(this,'WEB/')"
						 onclick="openWindow('group/group_showAddGrp.action',600,400)">
						添加用户组
					</div>
					<div class="button" onmouseover="buttonHover(this,'WEB/')" onmouseout="buttonNormal(this,'WEB/')" id="deleteId" >
						删除用户组
					</div>
					<br />
					<div class="button" onmouseover="buttonHover(this,'WEB/')" onmouseout="buttonNormal(this,'WEB/')"
						 onclick="openWindow('user/user_showAddUser.action',600,400)">
						添加账号
					</div>
					<div class="button" onmouseover="buttonHover(this,'WEB/')" onmouseout="buttonNormal(this,'WEB/')"
						 id="updateId">
						改组
					</div>
					<div class="button" onmouseover="buttonHover(this,'WEB/')" onmouseout="buttonNormal(this,'WEB/')" id="deleteName">
						删除账号
					</div>
				</div>
			</td>
		</tr>
	</table>
	</div>
  </body>
</html>
