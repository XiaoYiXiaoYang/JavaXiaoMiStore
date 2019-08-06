package com.xiaomi.dao.mapper;

import java.util.List;

import com.xiaomi.dao.vo.User;

public interface UserMapper {
	public int InsertUser(User user);   //注册 用户名  密码  手机
	public int UpdateUser(User user);   //更新用户 昵称  手机号  密码  个性签名 爱好 收获地址
	public User selectOneUser(int id);
	public User loginCheck(User user);
	
//	public int DeleteUser(int uid);
//	public List<User> selectAllUser();
	
}
