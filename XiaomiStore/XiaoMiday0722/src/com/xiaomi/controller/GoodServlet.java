package com.xiaomi.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.xiaomi.dao.vo.Cart;
import com.xiaomi.dao.vo.Good;
import com.xiaomi.utils.db.DBUtil;

public class GoodServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String operate=request.getParameter("operate");
		
		SqlSession session=DBUtil.getSession();
		GoodMapper goodmapper=session.getMapper(GoodMapper.class);
		
		 if("search".equals(operate)){
			 String goodname = request.getParameter("good_name");
			 List<Good> searchgoods = goodmapper.searchGoodsByName(goodname);
			 
			 System.out.println("模糊查询到手机数量"+searchgoods.size());
			request.setAttribute("searchgoods", searchgoods);
			request.getRequestDispatcher("searchlist.jsp").forward(request, response);
		 }else if("xiaomi".equals(operate)){
				List<Good> goodslist = goodmapper.selectdisName();
				request.setAttribute("goodsList", goodslist);
			        
			    request.getRequestDispatcher("goods_list.jsp").forward(request, response); 
		 }else if("detail".equals(operate)){
			 	String good_name=request.getParameter("good_name");
			 
				List<Good> goodslist = goodmapper.selectGoodByName(good_name);
				List<Good> goodtlist = goodmapper.selectdisType(good_name);
				List<Good> goodclist = goodmapper.selectdisColor(good_name);
				request.setAttribute("goodsList", goodslist);   //Slist
				request.setAttribute("goodtList", goodtlist);	//Tlist
				request.setAttribute("goodcList", goodclist);   //Clist
				
				
			    request.getRequestDispatcher("goods_details.jsp").forward(request, response); 	
		 }else if("buy".equals(operate)){
			 	request.setCharacterEncoding("utf-8");
				String good_name = request.getParameter("good_name");
				String good_type = request.getParameter("type");
				String good_color = request.getParameter("color");
				
				Good good = goodmapper.selectgoodid(good_name,good_type,good_color);
				
				if(good.getGood_count()<0){
					
					response.sendRedirect("errorcount.jsp");  //数量不足
					
				}else{
					CartMapper cartmapper = session.getMapper(CartMapper.class);
					HttpSession session1 =request.getSession();
					
					int uid = (Integer) session1.getAttribute("uid");
					int good_id = good.getGood_id();
					double price = good.getGood_price();
					Cart cart1 = cartmapper.selectCartBygood_id(good_id,uid);
					if(cart1 != null){
						int count = cart1.getGood_num();
						if(count < good.getGood_count()){
							count = count + 1;
						}
						price = price * count;
						cart1.setGood_num(count);
						cart1.setPrice(price);
						System.out.println(cart1.getPre_id());
						cartmapper.UpdateCart_num_price(cart1);
						session.commit();
					}else{
						Cart cart = new Cart();
						cart.setUid(uid);
						cart.setGood_id(good_id);
						cart.setGood_num(1);
						cart.setStatus(1);
						cart.setPrice(price);
						
						int i = cartmapper.InsertCart(cart);
						session.commit();						
					}

					
					request.getRequestDispatcher("success_add_cart.jsp").forward(request, response);
		
				}
		 }else if("indexlist".equals(operate)){
			 	
			List<Good> goodslist = goodmapper.selectdisName();
			
			System.out.println(goodslist.size());
			
			for (Good good : goodslist) {
				System.out.println(good.getGood_name());
			}
			request.setAttribute("isindex", "qingqiuguol");  //请求标志
			request.setAttribute("goodsList", goodslist);
			
			request.getRequestDispatcher("index.jsp").forward(request, response); 
		 }
		 else{
			 System.out.println("未知请求");
		 }
			
	}

}
