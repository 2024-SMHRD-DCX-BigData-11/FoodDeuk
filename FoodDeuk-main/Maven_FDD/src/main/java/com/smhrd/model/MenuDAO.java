package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class MenuDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public List<Menu> listAll() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Menu> results = session.selectList("com.smhrd.database.MenuMapper.listAll");
		session.close();
		return results;
	}

	public List<Restaurant> listByHighPrice(Menu menu) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Restaurant> results = session.selectList("com.smhrd.database.MenuMapper.upperPrice", menu);
		session.close();
		return results;
	}
}