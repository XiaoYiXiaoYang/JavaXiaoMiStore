<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
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
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>我的购物车-小米商城</title>
	<link rel="stylesheet" type="text/css" href="./css/style.css">
	<script src="./js/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
	<style>
	/*空购物车*/
	.page_main{padding:38px;background:rgb(245,245,245);}
	.page_main .container {width: 100%;height:400px;background: rgb(245,245,245);padding-bottom: 20px;margin-right:auto;margin-left:auto;}
	.page_main .container .cart-empty{height:273px;padding-left:558px;margin:65px 0 130px;background:url("./image/cart-empty.png") no-repeat 124px 0;color:#b0b0b0;overflow:hidden;_zoom:1}
	.page_main .container .cart-empty h2{margin:70px 0 15px;font-size:36px}
	.page_main .container .cart-empty .login-desc{display:none;margin:0 0 20px;font-size:20px;color:#b0b0b0}
	.page_main .container .cart-empty .btn{width:170px;height:48px;line-height:48px}
	.page_main .container .cart-empty .btn-login{display:none}
	.page_main .container .cart-empty-nologin h2{margin-top:50px;margin-bottom:0}
	.page_main .container .cart-empty-nologin .login-desc{display:block}
	.page_main .container .cart-empty-nologin .btn-login{display:inline-block;*zoom:1;*display:inline;margin-right:10px}
	.page_main .container .cart-empty-nologin .btn-shoping{background-color:#f5f5f5;color:#ff6700}
	</style>
  </head>
  
<body>
		<% 
		String uid = String.valueOf(session.getAttribute("uid"));
    	%>
<!-- start banner_x -->
	<div class="banner_x center">
		<a href="./index.html" target="_blank"><div class="logo fl"></div></a>
		
		<div class="wdgwc fl ml40">我的购物车</div>
		<div class="wxts fl ml20">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</div>
		<div class="dlzc fr">
			<ul>
					<% 
					String username = (String)session.getAttribute("username");
					
					if(username!=null){
					%>
						<li><%=username %></li>
						<li><a href="UserServlet?operate=selfinfo">个人中心</a></li>
						<li><a href="UserServlet?operate=logout">退出登录 </a> </li>
						
				<% }else{%>
				
						<li><a href="login.jsp" >登录</a></li>
						<li>|</li>
						<li><a href="register.jsp" >注册</a></li>
						<li>|</li>
						<li><a href="">消息通知</a></li>
				<%} %>	
			</ul>
			
		</div>
		<div class="clear"></div>
	</div>
	<div class="xiantiao"></div>
	<div class="page_main">
		<div class="container">
	        <div class="cart-empty cart-empty-nologin" id="J_cartEmpty">
	            <h2>您的购物车还是空的</h2>
	            <p class="login-desc">登录后将显示您之前加入的商品</p>
	            <a href="login.jsp" class="btn btn-primary btn-login" id="J_loginBtn">立即登录</a>
	            <a href="index.jsp" class="btn btn-primary btn-shoping">马上去购物</a>
	        </div>	
			<div class="clear"></div>        
		</div>
	</div>
	<!-- footer -->
	<footer class="center">	
		<div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
		<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
		<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
	</footer>
</body>
<script>
	var uid = <%=uid%>
	$(function(){
		if(uid == null){
			$(".login-desc").eq(0).show()
			$("#J_loginBtn").show()
		}else{
			$(".login-desc").eq(0).hide()
			$("#J_loginBtn").hide()
		}
		
	})
</script>
</html>
