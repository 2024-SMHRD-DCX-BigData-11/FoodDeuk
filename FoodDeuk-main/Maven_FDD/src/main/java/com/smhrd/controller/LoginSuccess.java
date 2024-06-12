package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Member;
import com.smhrd.model.memberDAO;

/**
 * Servlet implementation class LoginSuccess
 */
@WebServlet("/LoginSuccess")
public class LoginSuccess extends HttpServlet {protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String pw = request.getParameter("userPw");
	String id= request.getParameter("userId");
	
    Member member = new Member(id,pw);
	
    
    Member login_member= new memberDAO().login(member);
    
    if(id.equals("admin") && pw.equals("1234")) {
    	//로그인 성공
    	System.out.println("로그인 성공");
    	HttpSession session = request.getSession();
    	session.setAttribute("login_member", login_member);
    }else {
    	//로그인 실패
    	System.out.println("로그인 실패");
    }
    response.sendRedirect("main.jsp");
	}

}
