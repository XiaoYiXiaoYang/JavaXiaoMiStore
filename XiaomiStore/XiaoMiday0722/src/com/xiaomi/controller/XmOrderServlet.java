package com.xiaomi.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.xiaomi.dao.mapper.CartMapper;
import com.xiaomi.dao.mapper.GoodMapper;
import com.xiaomi.dao.mapper.UserMapper;
import com.xiaomi.dao.mapper.XmOrderMapper;
import com.xiaomi.dao.vo.Cart;
import com.xiaomi.dao.vo.Good;
import com.xiaomi.dao.vo.XmOrder;
import com.xiaomi.utils.db.DBUtil;

public class XmOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String operate=request.getParameter("operate");
	
		SqlSession session=DBUtil.getSession();
	
		 if("xmorder".equals(operate)){
			 	int uid = (Integer) request.getSession().getAttribute("uid");
				String pageChange = request.getParameter("pageChange");

				XmOrderMapper orderMapper = session.getMapper(XmOrderMapper.class);

				List<XmOrder> orders = orderMapper.selectOrdersByUid(uid);
				if(orders.size() == 0) {
					request.getRequestDispatcher("CartServlet").forward(request, response);
				}
				

				List<String> imgsrc = new ArrayList<String>();
				List<Integer> order_id = new ArrayList<Integer>();
				List<Integer> order_status = new ArrayList<Integer>();
				List<Double> price = new ArrayList<Double>();
				List<String> create_time = new ArrayList<String>();
				
				
				GoodMapper goodMapper = session.getMapper(GoodMapper.class);
				
				
				
				for(int i = Integer.parseInt(pageChange)*3; i < orders.size(); i++) {
					String Order_cartid = orders.get(i).getCart_id().substring(0, 1);
					Good good = goodMapper.selectOneGood(Integer.parseInt(Order_cartid));
					/*
					imgsrc.add(i, (String)good.getGood_img());
					order_id.add(i, orders.get(i).getOrder_id());
					order_status.add(i, orders.get(i).getOrder_status());
					price.add(i, good.getGood_price());
					create_time.add(i, orders.get(i).getCreate_time());
					*/
					imgsrc.add((String)good.getGood_img());
					order_id.add(orders.get(i).getOrder_id());
					order_status.add(orders.get(i).getOrder_status());
					price.add(good.getGood_price());
					create_time.add(orders.get(i).getCreate_time().substring(0, 10));
				}
//
				
				//response.sendRedirect("order.jsp");
				request.setAttribute("imgsrc", imgsrc);
				request.setAttribute("order_id", order_id);
				request.setAttribute("order_status", order_status);
				request.setAttribute("price", price);
				request.setAttribute("create_time", create_time);
				
				request.getRequestDispatcher("xmorder.jsp").forward(request, response);
			

		 }else if("xmorderdetail".equals(operate)){
			 	int order_id = Integer.parseInt(request.getParameter("order_id"));
			
				XmOrderMapper orderMapper = session.getMapper(XmOrderMapper.class);
				XmOrder order = orderMapper.selectOneOrder(order_id);
			
				Integer order_status = 0;
				List<String> imgsrc = new ArrayList<String>();
				List<String> cart_id = new ArrayList<String>();
				List<Double> price = new ArrayList<Double>();
				String create_time = null;
				List<String> good_name = new ArrayList<String>();
				List<String> good_type = new ArrayList<String>();
				List<String> good_color = new ArrayList<String>();
				List<String> good_img = new ArrayList<String>();
				List<String> good_desc = new ArrayList<String>();
				
				String CartidStr = order.getCart_id();
				CartMapper cartMapper = session.getMapper(CartMapper.class);
				int i = 0;
				for(i = 0 ; CartidStr.length() != 0 ; i++){
					int index1 = CartidStr.indexOf("#");
					String str1 = CartidStr.substring(0, index1);
					int cartid1 = Integer.parseInt(str1);
					cart_id.add(str1);
					
					Cart cart = cartMapper.selectOneCart(cartid1);
					CartidStr = CartidStr.substring(CartidStr.indexOf("#")+1);
				
					GoodMapper goodMapper = session.getMapper(GoodMapper.class);
					//
					System.out.print("------------------");
					//System.out.print(Integer.parseInt(order.getCart_id().substring(0, CartidStr.indexOf("#")-1)));
					Good good = goodMapper.selectOneGood(cart.getGood_id());
					
					order_status = order.getOrder_status();
					
					price.add((double) good.getGood_price());
					create_time = order.getCreate_time();
					good_name.add(good.getGood_name());
					good_type.add(good.getGood_type());
					good_color.add(good.getGood_color());
					good_img.add(good.getGood_img());
					good_desc.add(good.getGood_desc());
					
				}
							
				request.setAttribute("num", i);
				request.setAttribute("order_id", order_id);
				request.setAttribute("order_status", order_status);
				request.setAttribute("cart_id", cart_id);
				request.setAttribute("price", price);
				request.setAttribute("create_time", create_time);	
				request.setAttribute("good_name", good_name);
				request.setAttribute("good_type", good_type);
				request.setAttribute("good_color", good_color);
				request.setAttribute("good_img", good_img);
				request.setAttribute("good_desc", good_desc);
				
				request.getRequestDispatcher("xmorderDetail.jsp").forward(request, response);
		 }else if("errpay".equals(operate)){
			 int order_id = Integer.parseInt(request.getParameter("order_id"));
			 XmOrderMapper orderMapper = session.getMapper(XmOrderMapper.class);
			 XmOrder order = orderMapper.selectOneOrder(order_id);
			 order.setOrder_status(2);
			 orderMapper.UpdateOrder_status(order);
			 session.commit();
			 response.sendRedirect("index.jsp");
		 }else if("successpay".equals(operate)){
			 int order_id = Integer.parseInt(request.getParameter("order_id"));
			 XmOrderMapper orderMapper = session.getMapper(XmOrderMapper.class);
			 XmOrder order = orderMapper.selectOneOrder(order_id);
			 order.setOrder_status(3);
			 orderMapper.UpdateOrder_status(order);
			 session.commit();
			 

			 String CartidStr = order.getCart_id();
			 CartMapper cartMapper = session.getMapper(CartMapper.class);

			 for(int i = 0 ; CartidStr.length() != 0 ; i++){
				 int index1 = CartidStr.indexOf("#");
				 String str1 = CartidStr.substring(0, index1);
				 int cartid1 = Integer.parseInt(str1);	
				
				 Cart cart = cartMapper.selectOneCart(cartid1);
				 CartidStr = CartidStr.substring(CartidStr.indexOf("#")+1);				
				 GoodMapper goodMapper = session.getMapper(GoodMapper.class);	
				 Good good = goodMapper.selectOneGood(cart.getGood_id());
				 int tempcount = good.getGood_count() - cart.getGood_num();
				 good.setGood_count(tempcount);
				 goodMapper.Updategoodnum(good);
				 session.commit();
			 }			 		 
			 			 
			 response.sendRedirect("index.jsp");
		 }else if("pay".equals(operate)){
			 int order_id = Integer.parseInt(request.getParameter("order_id"));
			 XmOrderMapper orderMapper = session.getMapper(XmOrderMapper.class);
			 XmOrder order = orderMapper.selectOneOrder(order_id);			 

			 String CartidStr = order.getCart_id();
			 CartMapper cartMapper = session.getMapper(CartMapper.class);
			 
			 int tempprice = 0;
			 for(int i = 0 ; CartidStr.length() != 0 ; i++){
				 int index1 = CartidStr.indexOf("#");
				 String str1 = CartidStr.substring(0, index1);
				 int cartid1 = Integer.parseInt(str1);	
				
				 Cart cart = cartMapper.selectOneCart(cartid1);
				 CartidStr = CartidStr.substring(CartidStr.indexOf("#")+1);				
				 GoodMapper goodMapper = session.getMapper(GoodMapper.class);	
				 Good good = goodMapper.selectOneGood(cart.getGood_id());
				 tempprice+=good.getGood_price();
			 }
			 
			 response.sendRedirect("alipay.jsp?total_price=" + tempprice +"&order_id="+Integer.toString(order_id));
			 
		 }else{
			System.out.println("Î´ÖªÇëÇó"); 
		 }
		
	}
}
