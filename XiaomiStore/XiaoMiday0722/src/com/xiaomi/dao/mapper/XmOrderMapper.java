package com.xiaomi.dao.mapper;

import java.util.List;

import com.xiaomi.dao.vo.XmOrder;

public interface XmOrderMapper {
	public int InsertOrder(XmOrder order);   //插入一条订单	
	public int DeleteOrder(int order_id);   //删除一条订单
	public XmOrder selectOneOrder(int order_id);  //订单详情
	public List<XmOrder> selectOrdersByUid(int uid); //查询我的订单
	public int UpdateOrder(XmOrder order);     //更新订单状态
	public int UpdateOrder_status(XmOrder order);
	public int selectOneorder(XmOrder order);   //根据信息返回orderid
	
	//public List<Order> selectAllOrders();  
	
}
