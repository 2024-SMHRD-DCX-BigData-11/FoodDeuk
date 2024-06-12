package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.memberDAO;

/**
 * Servlet implementation class EmailCheckCon
 */
@WebServlet("/IdCheckCon")
public class IdCheckCon extends HttpServlet {protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String inputId= request.getParameter("userId");
		System.out.println(inputId);
		
		boolean result = new memberDAO().IdCheck(inputId);
		System.out.println(result);
		
		PrintWriter out= response.getWriter();
		out.print(result);
	}

}
