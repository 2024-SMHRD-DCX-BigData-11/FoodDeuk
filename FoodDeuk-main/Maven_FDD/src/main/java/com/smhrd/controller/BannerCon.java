package com.smhrd.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.model.Banner;
import com.smhrd.model.BannerDAO;

@WebServlet("/BannerCon")
public class BannerCon extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        BannerDAO dao = new BannerDAO();
        List<Banner> bannerData = dao.selectBannerData();

        // 로그 추가
//        System.out.println("Banner data: " + bannerData);

        ObjectMapper mapper = new ObjectMapper();
        String jsonResult = mapper.writeValueAsString(bannerData);
        response.getWriter().write(jsonResult);
    }
}
