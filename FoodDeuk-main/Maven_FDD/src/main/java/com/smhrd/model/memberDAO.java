package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class memberDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int join(Member member) {
		SqlSession session = sqlSessionFactory.openSession(true);

		// session.insert(경로, 넘겨줄 파라미터);
		// 실행 시 정수 데이터 return (0,1) 이거는 namespace
		int cnt = session.insert("com.smhrd.database.MemberMapper.join", member);
		session.close();
		return cnt;
	}

	public Member login(Member member) {
		SqlSession session = sqlSessionFactory.openSession(true);

		Member login_member = session.selectOne("com.smhrd.database.MemberMapper.login", member);
		session.close();
		return login_member;
	}

	public int update(Member update_member) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.update("com.smhrd.database.MemberMapper.update", update_member);
		session.close();
		return cnt;
	}

	public List<Member> showMember() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Member> list = session.selectList("com.smhrd.database.MemberMapper.showMember");
		session.close();
		return list;
	}
	public List<Member> search() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Member> list = session.selectList("com.smhrd.database.MemberMapper.showMember");
		session.close();
		return list;
	}

	public int delete(String email) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.delete("com.smhrd.database.MemberMapper.delete", email);
		session.close();
		return cnt;

	}
	public boolean IdCheck(String inputId) {
		SqlSession session =sqlSessionFactory.openSession(true);
		boolean result=session.selectOne("com.smhrd.database.MemberMapper.idCheck", inputId);
		session.close();
		return result;
	}
}
