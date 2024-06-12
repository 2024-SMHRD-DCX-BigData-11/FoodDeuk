package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Member;
import com.smhrd.model.memberDAO;

@WebServlet("/JoinProgram")
public class JoinProgram extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("userId");
	      String pw = request.getParameter("userPw");
	      String addr = request.getParameter("userAddr");
	      
	      Member member= new Member(id,pw,addr);
	      
	      int cnt = new memberDAO().join(member);
	      
	      
	      if(cnt==1) {
	    	  System.out.println("회원가입 성공!!");
	    
	    	  request.setAttribute("user_id", member.getUser_id());
	    
	    	  response.sendRedirect("main.jsp");
	    	
	      }else {
	    	  System.out.println("회원가입 실패..");
	    	  response.sendRedirect("Join.jsp");
	      }
				
	
	}

}
