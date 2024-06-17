package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class CategoryDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public List<Category> listAll() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Category> results = session.selectList("com.smhrd.database.CategoryMapper.listAll");
		session.close();
		return results;
	}

	public List<Category> listAll2() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Category> results = session.selectList("com.smhrd.database.CategoryMapper.listAll2");
		session.close();
		return results;
	}
}