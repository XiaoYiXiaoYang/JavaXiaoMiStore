<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'successbuy.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<title>成功加入购物车</title>
	<link rel="stylesheet" type="text/css" href="./css/style.css">
	<style>
	.page_main{padding:38px;background:rgb(245,245,245);}
	.page_main .container {width: 100%;height:200px;background: rgb(245,245,245);padding-bottom: 20px;margin-right:auto;margin-left:auto;}
	.page-main{padding:38px 0}
	.buy-succ-box{margin-bottom:26px;padding:0 0 28px 0;height:68px;border-bottom:1px solid #e0e0e0}
	.buy-succ-box .goods-content{}
	.buy-succ-box .goods-img{float:left;width:64px;height:64px}
	.buy-succ-box .goods-info{float:left;margin-left:20px}
	.buy-succ-box .goods-info h3{margin:0;color:#424242;font-size:24px;font-weight:normal;margin-top:3px}
	.buy-succ-box .goods-info .name,.buy-succ-box .goods-info .price{margin-right:15px;font-size:14px;color:#757575}
	.buy-succ-box .actions{}
	.buy-succ-box .actions .btn{width:180px;margin-left:12px;margin-top:5px}
	.buy-succ-box .actions .btn-line-gray{background:#fff;color:#757575}
	.buy-succ-box .actions .btn-primary{background:#ff6700;border-color:#ff6700;color:#fff}
	.buy-succ-box .actions .btn-primary:hover{background-color:#f25807;border-color:#f25807;color:#fff}
	.buy-succ-box .actions p{text-align:right;color:red;margin:0;font-size:12px}
	.buy-succ-box .actions .hide{display:none}
	.return{
		display:flex;
		justify-content:center;
		align-items:center;
		width:120px;
		height: 50px;
	}
	.btn-line-gray,.btn-primary{
		text-align:center;
		width:100%;
		font-size: 14px;
		padding:10px;
	}
	.goods-content{
		display:flex;
		justify-content:center;
	}
	.actions{
		margin-top:50px;
		display:flex;
		justify-content:center;
	}
	</style>
  </head>
  
  <body>
	<div class="banner_x center">
		<a href="./index.html" target="_blank"><div class="logo fl"></div></a>
		
		<div class="wdgwc fl ml40">我的购物车</div>
		<div class="wxts fl ml20">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</div>
		<div class="dlzc fr">
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
	<div class="xiantiao"></div>
    <div class="page_main">
      <div class="container">
	    <div class="buy-succ-box clearfix">
	   	 <div class="goods-content" id="J_goodsBox"> 
	    	<div class="goods-img"> 
	    		<img src="./image/success.png" width="64" height="64"> 
	    	</div> 
	    	<div class="goods-info"> 
	    		<h3>已成功加入购物车！</h3>
	    		<span class="name"><%=request.getParameter("good_name") %><%=request.getParameter("type") %> <%=request.getParameter("color") %>  </span>	
	    	</div>
	    </div>
	    <div class="actions">
	    	<div class='return'>
	        	<a href="index.jsp" class="btn btn-line-gray">返回首页</a>
	        </div>
	        <div class='return cart-computed'>
	        	<a href="CartServlet" class="btn btn-primary">去购物车结算</a>
	        </div>
	    </div>
	    </div>
	   </div>
	</div>
	<!-- footer -->
	<footer class="center">	
		<div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
		<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
		<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
	</footer>
  </body>
</html>
