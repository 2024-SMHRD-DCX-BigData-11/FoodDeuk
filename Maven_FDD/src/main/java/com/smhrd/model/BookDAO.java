package com.smhrd.model;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;


public class BookDAO {
	SqlSessionFactory sqlSessionFactory= SqlSessionManager.getSqlSession();
	public int join(member member) {
		SqlSession session=sqlSessionFactory.openSession(true);
		
		//session.insert(경로, 넘겨줄 파라미터);
		//실행 시 정수 데이터 return (0,1)            이거는 namespace
		int cnt = session.insert("com.smhrd.database.MemberMapper.join", member);
		session.close();
		return cnt;
	}

	public member login(member member) {
		SqlSessionFactory sqlSessionFactory= SqlSessionManager.getSqlSession();
		SqlSession session=sqlSessionFactory.openSession(true);
		
		member login_member= session.selectOne("com.smhrd.database.MemberMapper.login", member);
		session.close();
		return login_member;
		
		
	}

}
