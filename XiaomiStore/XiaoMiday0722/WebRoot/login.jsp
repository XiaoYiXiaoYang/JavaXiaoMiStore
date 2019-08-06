<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <head>
		<meta charset="UTF-8">
        <meta name="author" content="order by dede58.com"/>
		<title>会员登录</title>
		<link rel="stylesheet" type="text/css" href="./css/login.css">
	<script type="text/javascript">
	   function refresh() {
		//IE存在缓存,需要new Date()实现更换路径的作用
		document.getElementById("image").src="image.jsp?"+new Date();
	   }
	   function check_data()
	   {
		 if (document.form.username.value.length == 0)
	        alert("账号不能为空！");
	     else if (document.form.password.value.length ==0)
	       alert("密码不能为空！");
		 else
	      form.submit();
	   }
   </script>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  	<% 
		String islogin= (String)request.getAttribute("passworderror");
		
		if("error".equals(islogin)){
	%>
	<script type="text/javascript">
		window.alert("账号或密码错误，请重新登录");
	</script>		
	<% }%>
	
  <body>
    <!-- login -->
		<div class="top center">
			<div class="logo center">
				<a href="./index.html" target="_blank"><img src="./image/mistore_logo.png" alt=""></a>
			</div>
		</div>
		<form  method="post" action="UserServlet" class="form center" name="form">
			<input type="hidden" id="operate" name="operate" value="login"/>
		<div class="login">
			<div class="login_center">
				<div class="login_top">
					<div class="left fl">会员登录</div>
					<div class="right fr">您还不是我们的会员？<a href="register.jsp" target="_self">立即注册</a></div>
					<div class="clear"></div>
					<div class="xian center"></div>
				</div>
				<div class="login_main center">
					<div class="username">用户名:&nbsp;<input class="shurukuang" type="text" name="username" placeholder="请输入你的用户名"/></div>
					<div class="username">密&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;<input class="shurukuang" type="password" name="password" placeholder="请输入你的密码"/></div>
                    <div class="username">
						<div class="left fl">
							验证码:&nbsp;<input class="yanzhengma" type="text" name="image" placeholder="请输入验证码"/>
							&nbsp;&nbsp;&nbsp;<img id="image" border="0"  onClick="refresh()" src="image.jsp" title="点击更换图片">
						</div><br>						
						<div class="left fl">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">${requestScope.msg}${requestScope.imageError}</font></div>
				    </div> 
	                <div class="clear"></div>
				</div>
				<div class="login_submit">
					<input class="submit" type="button"  value="立即登录" onClick="check_data()" >
				</div>
				
			</div>
		</div>
		</form>
		<footer>
			<div class="copyright">简体 | 繁体 | English | 常见问题</div>
			<div class="copyright">小米公司版权所有-京ICP备10046444-<img src="./image/ghs.png" alt="">京公网安备11010802020134号-京ICP证110507号</div>
		</footer>
  </body>
</html>
