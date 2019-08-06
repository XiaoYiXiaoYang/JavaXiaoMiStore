<%@ page language="java" import="java.util.*,com.xiaomi.dao.vo.Good" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>手机详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
	<link rel="stylesheet" type="text/css" href="./css/style.css">
	<script type="text/javascript">
	   function check(){
	     //document.getElementById("color").style.display='none';
	     var type1 = document.form.type.value;
	     var type2 = document.getElementsByName("t1");
	     var col = document.getElementsByName("c1");
	     var color = document.getElementsByName("color");
	     for(var i=0;i<color.length;i++)
	     {  
	        //console.log(color[i].value);
	        //console.log(i );
	        document.getElementById(color[i].value).style.display='none';
	     }
	     var indexs = []; 
	     type2.forEach(function(item,index){
	     	if(item.value === type1){
	     		indexs.push(index)
	     	}
	     })
	     var colors = [];
	     for(i in indexs){
	         colors.push(col[indexs[i]])
	     }
	     var flg =[];
	     for(i in color){
	        for(j in colors){
	           if(color[i].value===colors[j].value)
	          { 
	            document.getElementById(colors[j].value).style.display='block';
	            flg.push(i)
	           }
	        }
	     }    
	   }
	   function check1(){
	       var type = document.form.type.value;
	       console.log(type.value);
	       var color = document.form.color.value;
	       if(type.length<=0)
	       {
	          alert("您尚未选择类型");
	       }
	       else if(color.length<=0)
	       {
	          alert("您尚未选择颜色");
	       }
	       else{
	          document.form.submit();
	       }
	   }
	   function changeclo(){
	       var colors = document.getElementsByName("c1");
	       var imgs = document.getElementsByName("img");
	      var color = document.form.color.value;
	       var photo=document.getElementById("photo");
	       //console.log(imgs);
          for(var j=0;j<colors.length;j++){
              if(color===colors[j].value) 
                photo.src=imgs[j].value;
          }
	   }
	</script>
	<style>
	div>input{
	    display: none;
	}
	.jrgwc{
		clear:both;
		display: block;
	}
	div>label{
	    position: relative;
	    margin-right: 34px;
	}
	div>label::before{
	    display: inline-block;
	    content: "";
	    width: 16px;
	    height: 16px;
	    border-radius: 50%;
	    border: 1px solid rgb(219, 219, 219);
	    margin-right: 6px;
	    vertical-align: bottom;
	}
	div>input:checked+label::before{
	    background-color: rgb(239, 66, 56);
	}
	div>input:checked+label::after{
	    display: inline-block;
	    content: "";
	    width: 6px;
	    height: 6px;
	    border-radius: 50%;
	    position: absolute;
	    left: 6px;
	    bottom: 6px;
	    background-color: white;
	  
	}
	.banbens>.banbenb,.colors>.colorc{
		width:280px;
		float:left;
		margin-bottom:10px;
	}
	.choosecolor{
		clear:both;
	}
</style>
	<% List<Good> goods = (List)request.getAttribute("goodsList");%>
  </head>
  
  <body>
    <!-- <start header -->
       <form name="form1">
           <c:forEach items="${goodsList}" var="good" >
              <input type="hidden" name="img" value=${good.good_img} />
              <input type="hidden" name="t1" value=${good.good_type} />
              <input type="hidden" name="c1" value=${good.good_color} />
           </c:forEach>
        </form>
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
	<!--end header -->
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
						<input type="text" class="shuru" name="good_name"  placeholder="小米6&nbsp;小米MIX现货">
					</div>
					<div class="submit fl">
						<input type="hidden" id="operate" name="operate" value="search"/>
						<input type="submit" class="sousuo" value="搜索"/>
					</div>
					<div class="clear"></div>
				</form>
				<div class="clear"></div>
			</div>
		</div>
<!-- end banner_x -->
<form action="GoodServlet?operate=buy" method="post" name = "form"> 
 <!--  <input type="hidden" id="operate" name="operate" value="buy"/> -->
  <input type="hidden" name="good_name" value="<%=goods.get(0).getGood_name() %>"/>
	<div class="xiangqing">
		<div class="neirong w">
			<div class="xiaomi6 fl"><%=goods.get(0).getGood_name() %></div>
			<nav class="fr">
				<li><a href="">概述</a></li>
				<li>|</li>
				<li><a href="">变焦双摄</a></li>
				<li>|</li>
				<li><a href="">设计</a></li>
				<li>|</li>
				<li><a href="">参数</a></li>
				<li>|</li>
				<li><a href="">F码通道</a></li>
				<li>|</li>
				<li><a href="">用户评价</a></li>
				<div class="clear"></div>
			</nav>
			<div class="clear"></div>
		</div>	
	</div>
	
	<div class="jieshao mt20 w">
		<div class="left fl"><img class="detailimg" id="photo" src=<%=goods.get(0).getGood_img() %>></div>
		<div class="right fr">
			  <div class="h3 ml20 mt20"><%=goods.get(0).getGood_name() %></div>
			  <div class="jianjie mr40 ml20 mt10"><%=goods.get(0).getGood_desc() %></div>
			  <div class="jiage ml20 mt10"><%=goods.get(0).getGood_price() %>元</div>
			  <div class="ft20 ml20 mt20">选择版本</div>	
			  <% int count = 1; %>
			  <div class='banbens'>
	    <c:forEach items="${goodtList}" var="goods">
		        <div class="xzbb ml20 mt10 banbenb">
					<div class="banben fl">
						<a>
						    <input type="radio" id="type<%=count %>" name ="type" value=${goods.good_type} onclick="check()"/>
						    <label for="type<%=count %>" style="cursor:pointer">
								<span>${goods.good_type} </span>
								<span>${goods.good_price}元</span>
							</label>
						</a>
					</div>
			</div>
			<%count += 1; %>
	    </c:forEach>	
	    </div>
	    <div class="ft20 ml20 mt20 choosecolor">选择颜色</div>
	    <% int count2 = 1; %>
	    <div class='colors'>
	    <c:forEach items="${goodcList}" var="goods">
			<div class="xzbb ml20 mt10 colorc" id="${goods.good_color}" >
				<div class="banben">
					<a>
					    <input type="radio" id="color<%=count2 %>" name="color" value="${goods.good_color}" onclick="changeclo()" />
					    <label for="color<%=count2 %>" style="cursor:pointer">
							<span>${goods.good_color}</span>
						</label>
					</a>
				</div>
			</div>
			<% count2 += 1; %>
	    </c:forEach>
	    </div>
	    <br/>
   		<% 
		if(username!=null){
		%>
			<div class="xiadan ml20 mt20">
					<input class="jrgwc" type="button" value="加入购物车" onclick="check1()"/>
			</div>
		<%}%>
		</div>
		<div class="clear"></div>
	</div>
	</form>
  </body>
</html>
