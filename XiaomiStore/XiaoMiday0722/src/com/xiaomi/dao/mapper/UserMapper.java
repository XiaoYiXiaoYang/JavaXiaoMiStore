package com.xiaomi.dao.mapper;

import java.util.List;

import com.xiaomi.dao.vo.User;

public interface UserMapper {
	public int InsertUser(User user);   //ע�� �û���  ����  �ֻ�
	public int UpdateUser(User user);   //�����û� �ǳ�  �ֻ���  ����  ����ǩ�� ���� �ջ��ַ
	public User selectOneUser(int id);
	public User loginCheck(User user);
	
//	public int DeleteUser(int uid);
//	public List<User> selectAllUser();
	
}
