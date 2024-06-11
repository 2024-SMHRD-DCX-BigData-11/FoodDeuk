package com.smhrd.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/JoinProgram")
public class JoinProgram extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// post 방식 인코딩
		System.out.println("[JoinProgram]");
				request.setCharacterEncoding("UTF-8");
				//요청데이터 가져오기
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				String nick=request.getParameter("nick");
				String email=request.getParameter("email");
				String tel=request.getParameter("tel");
				
				//System.out.print(id+pw+name);
				
				Connection conn = null;
				
				PreparedStatement psmt = null;
				
				//1. 오라클 드라이버 동적로딩
				int cnt=0;
				try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				
				//2. db 연결 (Connection)
				String url ="jdbc:oracle:thin:@localhost:1521:xe";
				String db_id ="hr";
				String db_pw ="12345";
				conn=DriverManager.getConnection(url,db_id,db_pw);
				
				// 3. sql문 작성 밑 전송(PreparedStatement)
				
				String sql = "insert into book_member VALUES(?,?,?,?,?)";
				
				psmt=conn.prepareStatement(sql);
				
				psmt.setString(1,id);
				psmt.setString(2,pw);
				psmt.setString(3,nick);
				psmt.setString(4,email);
				psmt.setString(5,tel);
				
				cnt = psmt.executeUpdate();
				System.out.print(cnt);
				}catch(Exception e){
					e.printStackTrace(); // 콘솔에 어떤 예외 상황인지 출력
				}finally{
					try{
						psmt.close();
						conn.close();
					}catch(Exception e){
						e.printStackTrace();
					}
				}
				// 페이지 이동
				// 회원가입 성공시 main
				if(cnt==1){
					response.sendRedirect("main.jsp");
				}else{
				// 회원가입 실패시 join
					response.sendRedirect("Join.jsp");
				}
	
	}

}
