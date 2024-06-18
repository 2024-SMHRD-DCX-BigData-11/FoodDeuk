package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class SearchDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
        
    	public List<Restaurant> searchByMenu(Search search) {
            SqlSession session = sqlSessionFactory.openSession(true);
            List<Restaurant> results = session.selectList("com.smhrd.database.SearchMapper.searchByMenu", search);
            session.close();
            return results;
        }

        // 카테고리로 검색하는 메서드
        public List<Restaurant> searchByCategory(Search search) {
            SqlSession session = sqlSessionFactory.openSession(true);
            List<Restaurant> results = session.selectList("com.smhrd.database.SearchMapper.searchByCategory", search);
            session.close();
            return results;
        }
}