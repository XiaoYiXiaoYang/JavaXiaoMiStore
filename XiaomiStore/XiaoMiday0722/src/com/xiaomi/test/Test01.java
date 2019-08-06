package com.xiaomi.test;

import org.apache.ibatis.session.SqlSession;

import com.xiaomi.dao.mapper.UserMapper;
import com.xiaomi.dao.vo.User;
import com.xiaomi.utils.db.DBUtil;

public class Test01 {
	public static void main(String[] args) {
		SqlSession session = DBUtil.getSession();
		
		System.out.println(session);
		UserMapper um = session.getMapper(UserMapper.class);
		User user = um.selectOneUser(1);
		System.out.println(user.getUsername()+"====="+user.getUid());
	}
}
