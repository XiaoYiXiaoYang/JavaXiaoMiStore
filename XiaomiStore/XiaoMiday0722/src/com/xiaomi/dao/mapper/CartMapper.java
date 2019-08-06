package com.xiaomi.dao.mapper;

import java.util.List;

import com.xiaomi.dao.vo.Cart;

public interface CartMapper {
	public int InsertCart(Cart cart);     //购物车插入一条记录
	public int DeleteCart(int pre_id);   //删除购物车一条记录
	public Cart selectOneCart(int pre_id); //根据cart_id查购物车一条记录
	public List<Cart> selectCartByUid(int uid);  //根据uid查这个人的购物车se
	public int UpdateCart_status(Cart cart);       //修改购物车状态
	public int UpdateCart_num_price(Cart cart);    //修改购物车金额和商品数量
	public Cart selectCartBygood_id(int good_id, int uid);
	
	//public List<Cart> selectAllCarts();
}
