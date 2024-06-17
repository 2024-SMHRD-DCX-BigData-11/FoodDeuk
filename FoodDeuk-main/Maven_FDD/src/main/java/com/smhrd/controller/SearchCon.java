package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.model.Restaurant;
import com.smhrd.model.SearchDAO;

@WebServlet("/SearchCon")
public class SearchCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");

		String search = request.getParameter("search");
		
		System.out.println("search : " + search);

		SearchDAO dao = new SearchDAO();
		List<Restaurant> searchResults = dao.searchByMenu(search);

		ObjectMapper mapper = new ObjectMapper();
		String jsonResult = mapper.writeValueAsString(searchResults);
		response.getWriter().write(jsonResult);
	}
}
