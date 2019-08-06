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
	<title>小米商城-个人中心</title>
	<link rel="stylesheet" type="text/css" href="./css/style.css">

  </head>
  
  <body>
    <!-- start header -->
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
				<div class="gouwuche fr"><a href="">我的订单</a></div>
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
<!--end header -->
<!-- start banner_x -->
	<div class="banner_x center">
		<a href="./index.html" target="_blank"><div class="logo fl"></div></a>
		<a href=""><div class="ad_top fl"></div></a>
		<div class="nav fl">
			<ul>
				<li><a href="">小米手机</a></li>
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
			<form action="GoodServlet?operate=search" method="post">
				<div class="text fl">
					<input type="text" class="shuru" name="good_name"  placeholder="小米6&nbsp;小米MIX现货">
				</div>
				<div class="submit fl">
					<input type="submit" class="sousuo" value="搜索"/>
				</div>
				<div class="clear"></div>
			</form>
			<div class="clear"></div>
		</div>
	</div>
<!-- end banner_x -->
<!-- self_info -->
<div class="grzxbj">
	<div class="selfinfo center">
	<div class="lfnav fl">
		<div class="ddzx">订单中心</div>
		<div class="subddzx">
			<ul>
				<li><a href="" style="color:#ff6700;font-weight:bold;">我的订单</a></li>
				<li><a href="">意外保</a></li>
				<li><a href="">团购订单</a></li>
				<li><a href="">评价晒单</a></li>
			</ul>
		</div>
		<div class="ddzx">个人中心</div>
		<div class="subddzx">
			<ul>
				<li><a href="./self_info.html">我的个人中心</a></li>
				<li><a href="">消息通知</a></li>
				<li><a href="">优惠券</a></li>
				<li><a href="">收货地址</a></li>
			</ul>
		</div>
	</div>
	<div class="rtcont fr">
		<div class="ddzxbt">交易订单</div>
		
		<%
			ArrayList<String> imgsrc = (ArrayList<String>) request.getAttribute("imgsrc");
			ArrayList<Integer> order_id = (ArrayList<Integer>) request.getAttribute("order_id");
			ArrayList<Integer> order_status = (ArrayList<Integer>) request.getAttribute("order_status");
			ArrayList<Double> price = (ArrayList<Double>) request.getAttribute("price");
			ArrayList<String> create_time = (ArrayList<String>) request.getAttribute("create_time");	
			
			int pagecount = 0;
		%>
		<% 
			int order_num = imgsrc.size();
			int j = 0;
	    	for(int i = 0; i< order_num ; i++){	
	    		if(j < 3){
	    			j++;
	    %>
			    <div class="ddxq">
					<div class="ddspt fl"><img style="width:80px;height:80px;"src=<%=imgsrc.get(i) %>></div>
					<div class="ddbh fl">订单号:<%= order_id.get(i) %></div>
					<div class="ztxx fr">
						<ul>
							<% if(order_status.get(i) == 1) { %>
								<li>已发货</li>
							<%	} else if(order_status.get(i) == 0) {%>
								<li>未发货</li>
							<%	} else if(order_status.get(i) == 3){%>
								<li>已支付</li>
							<%	} else if(order_status.get(i) == 2){%>
								<li>未支付</li>
							<%	} %>
							<li>￥<%= price.get(i) %></li>
							<li><%= create_time.get(i) %></li>
							<% String orderDetailsUrl = "XmOrderServlet?operate=xmorderdetail&&order_id="+order_id.get(i); %>
							<li><a href=<%=orderDetailsUrl %>>订单详情></a></li>
							<% if(order_status.get(i) == 2) { %>
							<% String orderPayUrl = "XmOrderServlet?operate=pay&&order_id="+order_id.get(i); %>
							<li><a href=<%=orderPayUrl %>>去支付></a></li>
							<%	} %>
							<div class="clear"></div>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
	     <%	} 
	    		} 
	    	pagecount++;
	    	String url1 = "XmOrderServlet?operate=xmorder&&pageChange="+pagecount;
	    	String url2 = "XmOrderServlet?operate=xmorder&&pageChange="+(pagecount-1);
	     %>
	<div class="ddzxbt"> <a href=<%=url1 %>>下一页</a> &nbsp&nbsp&nbsp  <a href=<%=url2 %>>上一页</a> </div>

		
	</div>
	<div class="clear"></div>
	</div>
</div>
<!-- self_info -->
	
	<footer class="mt20 center">			
		<div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
		<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
		<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
	</footer>
  </body>
</html>
