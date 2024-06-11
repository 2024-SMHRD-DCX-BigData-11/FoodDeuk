package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class memberDAO {
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
		SqlSession session =sqlSessionFactory.openSession(true);
		
		member login_member= session.selectOne("com.smhrd.database.MemberMapper.login", member);
		session.close();
		return login_member;
	}
	public int update(member update_member) {
		SqlSession session =sqlSessionFactory.openSession(true);
		int cnt=session.update("com.smhrd.database.MemberMapper.update", update_member);
		session.close();
		return cnt;
	}
	public boolean emailCheck(String inputEmail) {
		SqlSession session =sqlSessionFactory.openSession(true);
		boolean result=session.selectOne("com.smhrd.database.MemberMapper.emailCheck", inputEmail);
		session.close();
		return result;
	}
	public List<member> showMember(){
		SqlSession session =sqlSessionFactory.openSession(true);
		List<member> list=session.selectList("com.smhrd.database.MemberMapper.showMember");
		session.close();
		return list; 
	}
	public int delete(String email) {
		SqlSession session =sqlSessionFactory.openSession(true);
		int cnt=session.delete("com.smhrd.database.MemberMapper.delete", email);
		session.close();
		return cnt;
		
	}
}
