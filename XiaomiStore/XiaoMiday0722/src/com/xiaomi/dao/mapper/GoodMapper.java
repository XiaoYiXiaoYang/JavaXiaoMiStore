package com.xiaomi.dao.mapper;

import java.util.List;

import com.xiaomi.dao.vo.Good;

public interface GoodMapper {
	public int InsertGood(Good good);
	public List<Good> selectAllGoods();   //列表所有商品
	public Good selectOneGood(int good_id);  //用good_id查一台手机的价格等等
	public List<Good> selectGoodByName(String good_name);   //用小米6，查出一个name的手机，颜色、型号不同
	public List<Good> searchGoodsByName(String good_name);   //模糊查询   列表所有小米的手机
	public List<Good> selectdisName();   //商品列表 查商品  去重商品名字  
	public List<Good> selectdisType(String good_name);
	public List<Good> selectdisColor(String good_name);
	//public int DeleteGood(int good_id);
	public Good selectgoodid(String good_name, String good_type,
			String good_color);     //
	public int Updategoodnum(Good good);
	
}
