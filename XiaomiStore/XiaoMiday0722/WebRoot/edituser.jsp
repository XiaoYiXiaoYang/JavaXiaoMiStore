<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人信息修改</title>
		<link rel="stylesheet" type="text/css" href="./css/login.css">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	   function check_data()
	   {
		var reg=/^1\d{10}$/;   //手机号码:11位数字,1开头
		
		if(document.form1.password.value.length<6) alert("密码长度必须大于等于6");
		else if(document.form1.phonenumber.value.length<=0) alert("电话号不能为空");
		else if(!reg.test(document.form1.phonenumber.value)) alert("电话号格式不正确");
		else if(document.form1.address.value.length<=0) alert("收货地址不能为空");
		else 
	      form1.submit();
	   }
	</script>
  </head>
  
  <body>
    <form  method="post" action="UserServlet" name="form1">
    <input type="hidden" name="operate" value="editupdate"/>
     <input type="hidden" name="uid" value="${user.uid }"/>
     <input type="hidden" name="username" value="${user.username }"/>
		<div class="regist">
			<div class="regist_center">
				<div class="regist_top">
					<div class="left fl">修改信息</div>
					<div class="right fr"><a href="index.jsp" target="_self">小米商城</a></div>
					<div class="clear"></div>
					<div class="xian center"></div>
				</div>
				<div class="regist_main center">
					<div class="username">昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称:&nbsp;&nbsp;${user.username }</div>
					<div class="username">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;<input class="shurukuang" type="password" name="password" value="${user.password }"/><span>请输入你的密码</span></div>
					<div class="username">手&nbsp;&nbsp;机&nbsp;&nbsp;号:&nbsp;&nbsp;<input class="shurukuang" type="text" name="phonenumber" value="${user.phonenumber }"/><span>	请填写正确的手机号</span></div>
					<div class="username">个性签名:&nbsp;&nbsp;<input class="shurukuang" type="text" name="sign" value="${user.sign }"/><span>请输入个性签名</span></div>
					<div class="username">我的爱好:&nbsp;&nbsp;<input class="shurukuang" type="text" name="hobby" value="${user.hobby }"/><span>请输入爱好</span></div>
					<div class="username">收货地址:&nbsp;&nbsp;<input class="shurukuang" type="text" name="address" value="${user.address }"/><span>请填写收货地址</span></div>
				</div>
				<div class="regist_submit">
					<input class="submit" type="button" value="确认修改" onClick="check_data()">
				</div>
				
			</div>
		</div>
		</form>
  </body>
</html>
