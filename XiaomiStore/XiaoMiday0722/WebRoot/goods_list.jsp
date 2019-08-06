	<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
	
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<html>
	  <head>
	    <base href="<%=basePath%>">
	   
	   <title>手机列表</title>
	   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	   <%response.setCharacterEncoding("UTF-8"); %>
	</head>
	
	<body>
	  <header>
		<div class="top center">
			<div class="left fl">
				<ul>
					<li><a href="http://www.mi.com/" target="_blank">小米商城</a></li>
					<li>|</li>
					<li><a href="">MIUI</a></li>
					<li>|</li>
					<li><a href="">米聊</a></li>
					<li>|</li>
					<li><a href="">游戏</a></li>
					<li>|</li>
					<li><a href="">多看阅读</a></li>
					<li>|</li>
					<li><a href="">云服务</a></li>
					<li>|</li>
					<li><a href="">金融</a></li>
					<li>|</li>
					<li><a href="">小米商城移动版</a></li>
					<li>|</li>
					<li><a href="">问题反馈</a></li>
					<li>|</li>
					<li><a href="">Select Region</a></li>
					<div class="clear"></div>
				</ul>
			</div>
			<div class="right fr">
				<div class="gouwuche fr"><a href="CartServlet">购物车</a></div>
				<div class="fr">
					<ul>
						<% 
	String username = (String)session.getAttribute("username");
	int uid = (Integer)session.getAttribute("uid");
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
			<div class="clear"></div>
		</div>
	</header>
	
	<!-- start banner_x -->
	<div class="banner_x center">
		<a href="./index.html" target="_blank"><div class="logo fl"></div></a>
		<a href=""><div class="ad_top fl"></div></a>
		<div class="nav fl">
			<ul>
				<li><a href="GoodServlet?operate=xiaomi">小米手机</a></li>
				<li><a href="">红米</a></li>
				<li><a href="">平板·笔记本</a></li>
				<li><a href="">电视</a></li>
				<li><a href="">盒子·影音</a></li>
				<li><a href="">路由器</a></li>
				<li><a href="">智能硬件</a></li>
				<li><a href="">服务</a></li>
				<li><a href="">社区</a></li>
			</ul>
		</div>
		<div class="search fr">
			<form action="GoodServlet" method="post">
				<div class="text fl">
					<input type="text" class="shuru" name="good_name" placeholder="小米6&nbsp;小米MIX现货">
				</div>
				<div class="submit fl">
					<input type="submit" class="sousuo" value="搜索"/>
					<input type="hidden" id="operate" name="operate" value="search"/>
				</div>
				<div class="clear"></div>
			</form>
			<div class="clear"></div>
		</div>
	</div>
	<!-- end banner_x -->
	 <div class="danpin center">
		
		<div class="biaoti center">小米手机</div>/,
		<div class="main center">
		<c:forEach items="${goodsList}" var="goods">
		    <div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
				<div class="sub_mingxing"><a href="GoodServlet?operate=detail&&good_name=${goods.good_name }" ><img src=${goods.good_img } alt=""></a></div>
				<div class="pinpai"><a href="GoodServlet?operate=detail&&good_name=${goods.good_name }" >${goods.good_name }</a></div>
				<div class="youhui">${goods.good_desc}</div>
				<div class="jiage">${goods.good_price }元</div>
			</div>
		</c:forEach>		
				</div>
		</div>
	  </body>
	</html>
