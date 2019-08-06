package com.xiaomi.dao.mapper;

import java.util.List;

import com.xiaomi.dao.vo.Good;

public interface GoodMapper {
	public int InsertGood(Good good);
	public List<Good> selectAllGoods();   //�б�������Ʒ
	public Good selectOneGood(int good_id);  //��good_id��һ̨�ֻ��ļ۸�ȵ�
	public List<Good> selectGoodByName(String good_name);   //��С��6�����һ��name���ֻ�����ɫ���ͺŲ�ͬ
	public List<Good> searchGoodsByName(String good_name);   //ģ����ѯ   �б�����С�׵��ֻ�
	public List<Good> selectdisName();   //��Ʒ�б� ����Ʒ  ȥ����Ʒ����  
	public List<Good> selectdisType(String good_name);
	public List<Good> selectdisColor(String good_name);
	//public int DeleteGood(int good_id);
	public Good selectgoodid(String good_name, String good_type,
			String good_color);     //
	public int Updategoodnum(Good good);
	
}
