package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.model.Menu;
import com.smhrd.model.MenuDAO;
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
		String upperSearch = request.getParameter("upperSearch");
		String searchType = request.getParameter("searchType");
		System.out.println("upperSearch : " + upperSearch);
		System.out.println("searchType : " + searchType);

		int upperPrice = Integer.MAX_VALUE;

		try {
			upperPrice = Integer.parseInt(upperSearch);
		} catch (NumberFormatException e) {
		}

		System.out.println("search : " + search);
		List<Restaurant> searchResults = null;
		if ("menu".equals(searchType)) {
			System.out.println("dd");
			if (upperPrice == Integer.MAX_VALUE) {
				SearchDAO dao = new SearchDAO();
				searchResults = dao.searchByMenu(search);
			} else {
				MenuDAO dao = new MenuDAO();
				Menu menu = new Menu();
				menu.setMenu_name(search);
				menu.setMenu_price(upperPrice);
				searchResults = dao.listByHighPrice(menu);
			}
		} else if ("category".equals(searchType)) {
			if (upperPrice == Integer.MAX_VALUE) {
				SearchDAO dao = new SearchDAO();
				searchResults = dao.searchByCategory(search);
			} else {
				MenuDAO dao = new MenuDAO();
				Menu menu = new Menu();
				menu.setMenu_name(search);
				menu.setMenu_price(upperPrice);
				searchResults = dao.listByHighPrice(menu);
			}
		}

		ObjectMapper mapper = new ObjectMapper();
		String jsonResult = mapper.writeValueAsString(searchResults);
		response.getWriter().write(jsonResult);
	}
}
