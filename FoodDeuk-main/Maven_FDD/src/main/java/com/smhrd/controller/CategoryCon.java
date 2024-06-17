package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.model.Category;
import com.smhrd.model.CategoryDAO;

@WebServlet("/CategoryCon")
public class CategoryCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		
		List<String> result = new ArrayList<>();
		
		List<Category> listCategory = new CategoryDAO().listAll();
		Collections.shuffle(listCategory);
		listCategory = listCategory.subList(0, 10);
		
		for (Category category : listCategory) {
			result.add(category.getCategory_name());
		}

		ObjectMapper mapper = new ObjectMapper();
		String jsonResult = mapper.writeValueAsString(result);
		response.getWriter().write(jsonResult);
	}
}
