package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class RestaurantDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public List<Restaurant> listAll() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Restaurant> results = session.selectList("com.smhrd.database.RestaurantMapper.listAll");
		session.close();
		return results;
	}
}