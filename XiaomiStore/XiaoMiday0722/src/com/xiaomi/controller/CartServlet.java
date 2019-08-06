package com.xiaomi.controller;

import java.awt.print.Book;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Date;
//寮曞叆Timestamp
import java.sql.Timestamp;
//寮曞叆DateFormat
import java.text.*;

import org.apache.ibatis.session.SqlSession;

import com.xiaomi.dao.mapper.*;
import com.xiaomi.dao.vo.*;
import com.xiaomi.utils.db.DBUtil;

//@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public CartServlet() {
        super();       
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		request.setCharacterEncoding("utf-8");
		String operate = request.getParameter("operate");
		int uid=-1;
		try {
			 uid= (Integer) request.getSession().getAttribute("uid");
		} catch (Exception e) {
			uid = -1;
		}
			
		int row;
		try {
		if("change_number".equals(operate)) {
			 SqlSession session = DBUtil.getSession();
			 CartMapper cartMapper = session.getMapper(CartMapper.class);
			 GoodMapper goodmapper = session.getMapper(GoodMapper.class);
			 String[] arrayOfString1=  request.getParameterValues("cart_id");
			 String[] arrayOfString2 = request.getParameterValues("good_num");//用于暂时记录前台传来的good_num
			 String[] arrayOfString3 = request.getParameterValues("good_price");//用处同上，记录good_price
			 row = arrayOfString1.length;
			 for(int i = 0; i < row; i++) {
				 String str1 = arrayOfString1[i];
				 String str2 = arrayOfString2[i];
				 String str3 = arrayOfString3[i];
				 int pre_id = Integer.valueOf(str1).intValue();
				 int good_num = Integer.valueOf(str2).intValue();
				 double good_price = Double.parseDouble(str3);
				 Cart c = cartMapper.selectOneCart(pre_id);
				 Good g = goodmapper.selectOneGood(c.getGood_id());
				 int Good_count = g.getGood_count();
				 if(good_num < Good_count)
				 {
					 c.setGood_num(good_num);//修改购物车商品数量
					 c.setPrice(good_price*good_num);//修改购物车的小计					 
				 }else {
					 c.setGood_num(Good_count);//修改购物车商品数量
					 c.setPrice(good_price*Good_count);//修改购物车的小计					 
				 }
				 cartMapper.UpdateCart_num_price(c);//更新购物车
				 session.commit();
			 }
			 System.out.println("更新成功");
			 response.sendRedirect("CartServlet"); 
		}else if("deleteCart".equals(operate)) {
			 SqlSession session = DBUtil.getSession();
			 CartMapper cartMapper = session.getMapper(CartMapper.class);
			 int pre_id = Integer.valueOf(request.getParameter("id")).intValue();
			 int num = cartMapper.DeleteCart(pre_id);
			 session.commit();
			 response.sendRedirect("CartServlet"); 
		}else if("jiesuan".equals(operate)){
			 boolean flag1 = true;//鐢ㄤ簬璁板綍鏄惁鏄涓�釜璐墿杞�
			 String str = "";//鐢ㄤ簬璁板綍cart_id
			 SqlSession session = DBUtil.getSession();
			 CartMapper cartMapper = session.getMapper(CartMapper.class);
			 XmOrderMapper ordermapper = session.getMapper(XmOrderMapper.class);
			 String[] arrayOfString1=  request.getParameterValues("temperate_id");
			 row = arrayOfString1.length;
			 System.out.println(row);
			 XmOrder order_1 = new XmOrder();
			//鑾峰彇褰撳墠绯荤粺鏃堕棿
			 Date currentTime = new Date(System.currentTimeMillis());
			 String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(currentTime);
			 //鎺у埗鍙版樉绀篸ateNow鐨勫�
			 System.out.println("系统时间:"+time);
			 String str1 = "flag";
			 for(int i = 0; i < row; i++){
				 if(arrayOfString1[i] != "flag"){
					 str1 = "";
				 }
			 }
			 if("flag".equals(str1)){
				 response.sendRedirect("CartServlet"); 
			 }
			 for(int i = 0; i < row; i++) {	
				 String str2 = arrayOfString1[i];
				 if("flag".equals(str2)) {
					 //response.sendRedirect("CartServlet"); 
				 }else{
					 int pre_id = Integer.valueOf(str2).intValue();
					 str = str + str2 +"#";
					 Cart c = cartMapper.selectOneCart(pre_id);
					 c.setStatus(0);//淇敼璐墿杞﹀晢鍝佹暟閲�
					 cartMapper.UpdateCart_status(c);//鏇存柊璐墿杞�
					 if(flag1 == true) {
						 order_1.setUid(uid);
						 order_1.setCart_id(str);
						 order_1.setCreate_time(time);
						 order_1.setOrder_status(0);
						 ordermapper.InsertOrder(order_1);
						 session.commit();
						 flag1 = false;
					 }else {
						 order_1.setCart_id(str);
						 
						 ordermapper.UpdateOrder(order_1);
						 session.commit();	
					 }	 
				 }
			 }
			 //temperate_id
			 int tempoid = ordermapper.selectOneorder(order_1);
			 String total_price = request.getParameter("total_price");

			 response.sendRedirect("alipay.jsp?total_price=" + total_price +"&order_id="+Integer.toString(tempoid));
			 
			 //response.sendRedirect("CartServlet"); 
		}else {
			if(uid == -1) {
				request.getRequestDispatcher("errorempty.jsp").forward(request, response);
			}else {
				SqlSession session = DBUtil.getSession();
				CartMapper cartMapper = session.getMapper(CartMapper.class);
				List<Cart> cartlist = cartMapper.selectCartByUid(uid);
				System.out.println(cartlist.size());
				if(cartlist.size()==0){
					request.getRequestDispatcher("errorempty.jsp").forward(request, response);
				}else{
					request.setAttribute("cartlist", cartlist);
					request.getRequestDispatcher("cartlist.jsp").forward(request, response);
				}
			}
		}	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
