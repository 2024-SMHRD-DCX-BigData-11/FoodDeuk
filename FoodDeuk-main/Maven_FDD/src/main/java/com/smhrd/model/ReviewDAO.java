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

public class ReviewDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
    private List<Review> reviews;

    public ReviewDAO() {
        reviews = new ArrayList<>();
        // 샘플 데이터 추가
        reviews.add(new Review(1, 1,1,"포켓몬 (1).png", "음식이 정말 맛있어요!", "4.5", "2023-05-01"));
        reviews.add(new Review(2, 2, 2,"포켓몬 (2).png", "음식이 별로였어요.", "2.0", "2023-05-02"));
        reviews.add(new Review(3, 3, 3,"포켓몬 (2).png", "최고의 레스토랑이에요!", "3.0", "2023-05-03"));
        reviews.add(new Review(4, 4, 4,"포켓몬 (2).png", "최고의 레스토랑이에요!", "4.0", "2023-05-04"));
        reviews.add(new Review(5, 5, 5,"포켓몬 (2).png", "최고의 레스토랑이에요!", "5.0", "2023-05-05"));
    }

    public List<Review> getAllReviews() {
        return reviews;
    }

    public Review getReviewById(int id) {
        for (Review review : reviews) {
            if (review.getUser_no() == id) {
                return review;
            }
        }
        return null;
    }

    public void addReview(Review review) {
        reviews.add(review);
        int i = 1;
       
    }

    public void updateReview(Review review) {
        for (int i = 0; i < reviews.size(); i++) {
            if (reviews.get(i).getUser_no() == review.getUser_no()) {
                reviews.set(i, review);
                break;
            }
        }
    }

    public void deleteReview(int id) {
        for (int i = 0; i < reviews.size(); i++) {
            if (reviews.get(i).getUser_no() == id) {
                reviews.remove(i);
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