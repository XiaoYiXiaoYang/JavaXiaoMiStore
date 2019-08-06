package com.xiaomi.dao.mapper;

import java.util.List;

import com.xiaomi.dao.vo.XmOrder;

public interface XmOrderMapper {
	public int InsertOrder(XmOrder order);   //����һ������	
	public int DeleteOrder(int order_id);   //ɾ��һ������
	public XmOrder selectOneOrder(int order_id);  //��������
	public List<XmOrder> selectOrdersByUid(int uid); //��ѯ�ҵĶ���
	public int UpdateOrder(XmOrder order);     //���¶���״̬
	public int UpdateOrder_status(XmOrder order);
	public int selectOneorder(XmOrder order);   //������Ϣ����orderid
	
	//public List<Order> selectAllOrders();  
	
}
