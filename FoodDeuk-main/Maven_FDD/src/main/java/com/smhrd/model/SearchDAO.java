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
        
    	public List<Search> searchByMenu(String menu_name) {
            SqlSession session = sqlSessionFactory.openSession(true);
            List<Search> results = session.selectList("com.smhrd.database.MemberMapper.searchByMenu", menu_name);
            session.close();
            return results;
        }

        // 카테고리로 검색하는 메서드
        public List<Search> searchByCategory(String res_no) {
            SqlSession session = sqlSessionFactory.openSession(true);
            List<Search> results = session.selectList("com.smhrd.database.MemberMapper.searchByCategory", res_no);
            session.close();
            return results;
        }
}