package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.Review;
import com.smhrd.model.ReviewDAO;

/**
 * Servlet implementation class ReviewCon
 */
@WebServlet("/ReviewCon")
public class ReviewCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 파일 업로드를 위한 변수 설정
		// 1. request
		// 2. 파일을 저장할 경로(상대경로)
		String path = request.getServletContext().getRealPath("./images");
		System.out.println(path);
		// 3. 파일 허용 용량
		int maxSize = 10 * 1024 * 1024; // 10MB
		// 4. 인코딩방식
		String encoding = "UTF-8";
		// 5. 중복제거
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		MultipartRequest multi;
		int res_no = 0;
		try {
			multi = new MultipartRequest(request, path, maxSize, encoding, rename);
			res_no = Integer.parseInt(multi.getParameter("res_no"));
			int user_no = Integer.parseInt(multi.getParameter("user_no"));
			String content = multi.getParameter("review_content");
			String filename = multi.getFilesystemName("filename");
			String ratings = multi.getParameter("ratings");

			Review review = new Review(res_no, user_no, content, filename, ratings);

			System.out.println(review.toString());

			int cnt = new ReviewDAO().insertReview(review);

			if (cnt == 1) {
				System.out.println("파일 업로드 성공");
			} else {
				System.out.println("파일 업로드 실패");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("ReviewMain.jsp?res_no=" + res_no);
	}
}
