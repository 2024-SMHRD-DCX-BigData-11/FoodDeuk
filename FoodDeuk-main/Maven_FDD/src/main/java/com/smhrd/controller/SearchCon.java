package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.listener.MyAppListener;
import com.smhrd.model.Menu;
import com.smhrd.model.MenuDAO;
import com.smhrd.model.Restaurant;
import com.smhrd.model.Search;
import com.smhrd.model.SearchDAO;

@WebServlet("/SearchCon")
public class SearchCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");

		String keyword = request.getParameter("search");
		String upperSearch = request.getParameter("upperSearch");
		String searchType = request.getParameter("searchType");
		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");

		System.out.println("lat : " + lat);
		System.out.println("lng : " + lng);

		int upperPrice = Integer.MAX_VALUE;
		double latitude = -1; // 경도 1도당 55.8km, 0.01이면 558m
		double longitude = -1; // 위도 1도당 111.3km 0.005면 556.5m

		try {
			upperPrice = Integer.parseInt(upperSearch);
		} catch (NumberFormatException e) {
		}

		try {
			latitude = Double.parseDouble(lat);
			longitude = Double.parseDouble(lng);
		} catch (NumberFormatException e) {
		}

		System.out.println("search : " + keyword);
		List<Restaurant> searchResults = null;

		Search search = new Search();
		search.setKeyword(keyword);
		search.setMenu_price(upperPrice);
		search.setLat(latitude);
		search.setLng(longitude);

		if (upperPrice != Integer.MAX_VALUE) {
			MenuDAO dao = new MenuDAO();
			searchResults = dao.listByHighPrice(search);
		} else {
			SearchDAO dao = new SearchDAO();
			if (searchType.equals("menu")) {
				// 메뉴 검색
				searchResults = dao.searchByMenu(search);
			} else {
				// 카테고리 검색
				searchResults = dao.searchByCategory(search);
			}
		}

		if (searchType.equals("menu")) {
			for (Restaurant restaurant : searchResults) {
				for (Menu menu : MyAppListener.restaurants.get(restaurant.getRes_no()).getMenus().values()) {
					if (menu.getMenu_name().contains(keyword)) {
						if (upperPrice < menu.getMenu_price()) {
							continue;
						}
						restaurant.addMenu(menu);
					}
				}
			}
		} else {
			for (Restaurant restaurant : searchResults) {
				restaurant.setMenus(MyAppListener.restaurants.get(restaurant.getRes_no()).getMenus());
			}
		}

		ObjectMapper mapper = new ObjectMapper();
		String jsonResult = mapper.writeValueAsString(searchResults);
		response.getWriter().write(jsonResult);
	}
}
