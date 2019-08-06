package com.xiaomi.dao.mapper;

import java.util.List;

import com.xiaomi.dao.vo.Cart;

public interface CartMapper {
	public int InsertCart(Cart cart);     //���ﳵ����һ����¼
	public int DeleteCart(int pre_id);   //ɾ�����ﳵһ����¼
	public Cart selectOneCart(int pre_id); //����cart_id�鹺�ﳵһ����¼
	public List<Cart> selectCartByUid(int uid);  //����uid������˵Ĺ��ﳵse
	public int UpdateCart_status(Cart cart);       //�޸Ĺ��ﳵ״̬
	public int UpdateCart_num_price(Cart cart);    //�޸Ĺ��ﳵ������Ʒ����
	public Cart selectCartBygood_id(int good_id, int uid);
	
	//public List<Cart> selectAllCarts();
}
