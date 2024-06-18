package com.smhrd.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;
import com.smhrd.model.Review;

public class ReviewDAO {
    SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
    List<Review> reviews = new ArrayList<>();
    public List<Review> getAllReviews() {
       
        SqlSession session = sqlSessionFactory.openSession(true);
        try {
        	reviews = session.selectList("com.smhrd.database.ReviewMapper.showReview");
        } finally {
            session.close();
        }
        return reviews;
    }
    
    public List<Review> detailReviews(int res_no) {
        
        SqlSession session = sqlSessionFactory.openSession(true);
        try {
        	reviews = session.selectList("com.smhrd.database.ReviewMapper.detailReview",res_no);
        } finally {
            session.close();
        }
        return reviews;
    }
    
    public void updateReview(Review review) {
        for (int i = 0; i < reviews.size(); i++) {
            if (reviews.get(i).getUser_no() == review.getUser_no()) {
                reviews.set(i, review);
                break;
            }
        }
    }

   
    private Connection conn;
    private PreparedStatement pstmt;

    public int insertReview(Review review) {
    	SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.smhrd.database.ReviewMapper.insertReview",review);
		session.close();
		return cnt;
}

}