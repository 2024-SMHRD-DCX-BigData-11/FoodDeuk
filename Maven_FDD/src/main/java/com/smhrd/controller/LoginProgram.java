package com.smhrd.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.member;

/**
 * Servlet implementation class LoginProgram
 */
@WebServlet("/LoginProgram")
public class LoginProgram extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// post 방식 인코딩
		request.setCharacterEncoding("UTF-8");
		//요청데이터 가져오기
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		member member = null;
		//System.out.print(id+pw+name);

		Connection conn = null;

		PreparedStatement psmt = null;

		ResultSet rs = null;
		

		//1. 오라클 드라이버 동적로딩
		int cnt = 0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//2. db 연결 (Connection)
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id = "hr";
			String db_pw = "12345";
			conn = DriverManager.getConnection(url, db_id, db_pw);

			// 3. sql문 작성 밑 전송(PreparedStatement)

			String sql = "select * from book_member where id=? and pw =?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, id);
			psmt.setString(2, pw);

			rs = psmt.executeQuery();
			if (rs.next()) {
				String logIn_id = rs.getString(1);
				String logIn_pw = rs.getString(2);


				member = new member(logIn_id, logIn_pw);
			}

			System.out.print(cnt);
		} catch (Exception e) {
			e.printStackTrace(); // 콘솔에 어떤 예외 상황인지 출력
		} finally {
			try {
				rs.close();
				psmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (member != null) {
			
			HttpSession session= request.getSession();
			session.setAttribute("member", member);

			
			response.sendRedirect("main.jsp");
		} else {
			response.sendRedirect("LoginFail.jsp");

		}
	}

}
