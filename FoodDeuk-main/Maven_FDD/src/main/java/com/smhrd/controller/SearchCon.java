package com.smhrd.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Search;
import com.smhrd.model.SearchDAO;

@WebServlet("/SearchCon")
public class SearchCon extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String menu_name = request.getParameter("menu_name");
        String res_no = request.getParameter("res_no");

        SearchDAO dao = new SearchDAO();
        List<Search> searchResults = null;

        if (menu_name != null && !menu_name.isEmpty()) {
            searchResults = dao.searchByMenu(menu_name);
        } else if (res_no != null && !res_no.isEmpty()) {
            searchResults = dao.searchByCategory(res_no);
        }

        if (searchResults != null) {
            System.out.println("검색 성공");
            HttpSession session = request.getSession();
            session.setAttribute("search_results", searchResults);
        } else {
            System.out.println("검색 실패");
        }
    }
}
