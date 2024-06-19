package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class RestaurantDAO {
	static SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public List<Restaurant> listAll() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Restaurant> results = session.selectList("com.smhrd.database.RestaurantMapper.listAll");
		session.close();
		return results;
	}
	public static String resName(String res_no) {
		SqlSession session = sqlSessionFactory.openSession(true);

		String login_member = session.selectOne("com.smhrd.database.RestaurantMapper.resName", res_no);
		session.close();
		return login_member;
	}
	public static String resNames(int res_no) {
		SqlSession session = sqlSessionFactory.openSession(true);

		String login_member = session.selectOne("com.smhrd.database.RestaurantMapper.resNames", res_no);
		session.close();
		return login_member;
	}
	
}