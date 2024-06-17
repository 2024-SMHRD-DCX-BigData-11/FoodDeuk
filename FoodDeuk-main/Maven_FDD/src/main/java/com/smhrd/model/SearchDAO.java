package com.smhrd.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;
import com.smhrd.model.Review;

public class SearchDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
        
    	public List<Restaurant> searchByMenu(String menu_name) {
            SqlSession session = sqlSessionFactory.openSession(true);
            List<Restaurant> results = session.selectList("com.smhrd.database.SearchMapper.searchByMenu", menu_name);
            session.close();
            return results;
        }

        // 카테고리로 검색하는 메서드
        public List<Restaurant> searchByCategory(String res_no) {
            SqlSession session = sqlSessionFactory.openSession(true);
            List<Restaurant> results = session.selectList("com.smhrd.database.SearchMapper.searchByCategory", res_no);
            session.close();
            return results;
        }
}