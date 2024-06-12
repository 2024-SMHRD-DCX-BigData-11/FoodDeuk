package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class BoardDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	public int insertBoard(BoardDAO board) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.smhrd.database.BoardMapper.insertBoard",board);
		session.close();
		return cnt;
	}
	
	public List<BoardDAO> showBoard() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<BoardDAO> list = session.selectList("com.smhrd.database.BoardMapper.showBoard");
		session.close();
		
		
		return list;
	}
	public Board detailBoard(int num) {
		SqlSession session = sqlSessionFactory.openSession(true);
		Board board = session.selectOne("com.smhrd.database.BoardMapper.detailBoard",num);
		session.close();
		return board;
	}

}
