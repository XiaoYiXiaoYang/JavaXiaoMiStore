<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
      
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<meta charset="UTF-8">
        <meta name="author" content="order by dede58.com"/>
		<title>用户注册</title>
		<link rel="stylesheet" type="text/css" href="./css/login.css">
   <script type="text/javascript">
	   function check_data()
	   {
		var reg1 = /^[a-zA-Z_]\w{5,15}$/; //用户名:长度在6-16,只能用数字字母下划线,数字不能开头
		var reg2=/^1\d{10}$/;   //手机号码:11位数字,1开头
		
		if(document.form1.username.value.length<=0) alert("用户名不能为空");
		else if(!reg1.test(document.form1.username.value)) alert("用户名格式不正确");
		else if(document.form1.password.value.length<6) alert("密码长度必须大于等于6");
		else if(document.form1.password.value!=document.form1.repassword.value) alert("两次密码不一致，请重新输入");
		else if(document.form1.phonenumber.value.length<=0) alert("电话号不能为空");
		else if(!reg2.test(document.form1.phonenumber.value)) alert("电话号格式不正确");
		else if(document.form1.address.value.length<=0) alert("收货地址不能为空");
		else 
	      form1.submit();
	   }
	   
	   function refresh() {
		//IE存在缓存,需要new Date()实现更换路径的作用
		document.getElementById("image").src="image.jsp?"+new Date();
	   }
	   </script>
	   
  </head>
  
  <body>
   <form  method="post" action="UserServlet" name="form1">
   	<input type="hidden" id="operate" name="operate" value="register"/>
		<div class="regist">
			<div class="regist_center">
				<div class="regist_top">
					<div class="left fl">会员注册</div>
					<div class="right fr"><a href="./index.jsp" target="_self">小米商城</a></div>
					<div class="clear"></div>
					<div class="xian center"></div>
				</div>
				<div class="regist_main center">
					<div class="username">用&nbsp;&nbsp;户&nbsp;&nbsp;名:&nbsp;&nbsp;<input class="shurukuang" type="text" name="username" placeholder="请输入你的用户名"/><span>用户名长度在6-16位</span></div>
					<div class="username">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;<input class="shurukuang" type="password" name="password" placeholder="请输入你的密码"/><span>请输入6位以上字符</span></div>
					<div class="username">确认密码:&nbsp;&nbsp;<input class="shurukuang" type="password" name="repassword" placeholder="请确认你的密码"/><span>两次密码要输入一致哦</span></div>
					<div class="username">手&nbsp;&nbsp;机&nbsp;&nbsp;号:&nbsp;&nbsp;<input class="shurukuang" type="text" name="phonenumber" placeholder="请填写正确的手机号"/><span>填写下手机号吧，方便我们联系您！</span></div>
					<div class="username">收货地址:&nbsp;&nbsp;<input class="shurukuang" type="text" name="address" placeholder="请输入您的收货地址"/><span>收货地址一定要填正确哦</span></div>
					<div class="username">兴趣爱好:&nbsp;&nbsp;<input class="shurukuang" type="text" name="hobby" placeholder="请添加您的兴趣爱好"/><span>可以写一些您的爱好</span></div>
					<div class="username">个性标签:&nbsp;&nbsp;<input class="shurukuang" type="text" name="sign" placeholder="请添加您的个性标签"/><span>添加您的个性标签</span></div>
				    <div class="username">
						<div class="left fl">验&nbsp;&nbsp;证&nbsp;&nbsp;码:&nbsp;<input class="shurukuang" type="text" name="image" placeholder="请输入验证码"/><span><img id="image" border="0"  onClick="refresh()" src="image.jsp" title="点击更换图片"></span><br>	
						<div class="right fl"></div>
						<font color="red">${requestScope.rmsg}${requestScope.imageError}</font></div>
				    </div> 
				</div>
				<div class="regist_submit">
					<input class="submit" type="button"  value="立即注册" onClick="check_data()" >
				</div>
			</div>
		</div>
		</form>
  </body>
</html>
