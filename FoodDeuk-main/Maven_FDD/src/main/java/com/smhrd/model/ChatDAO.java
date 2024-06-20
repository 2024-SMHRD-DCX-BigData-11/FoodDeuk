package com.smhrd.model;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList; 

public class ChatDAO {

	private Connection conn;
 
	public ChatDAO() {
		try {
			String dbURL = "jdbc:oracle:thin:@project-db-cgi.smhrd.com:1524:xe";
			String dbID = "sc_DCX_bigdata11_p2_2";
			String dbPassword = "smhrd2";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
 
	}

	// 특정한 시간대에서 메시지를 가져오는 메소드
	public ArrayList<Chat> getChatList(String nowTime) {
		ArrayList<Chat> chatList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String SQL = "SELECT * FROM CHAT WHERE chatTime > ? ORDER BY chatTime";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, nowTime);
			rs = pstmt.executeQuery();
			chatList = new ArrayList<Chat>();

			while (rs.next()) {
				Chat chat = new Chat();
				chat.setUserName(rs.getString("user_Name"));
				chat.setChatContent(rs.getString("chatContent"));
				chat.setChatTime(rs.getString("chatTime"));
				chatList.add(chat);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return chatList;
	}

	// input method 정상적인 값은 1 , 아니면 -1

	public int submit(String UserName, String chatContent) {
		System.out.println("dao");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "INSERT INTO CHAT VALUES(t_chat_SEQ.nextval,?, ?, sysdate)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(2, UserName);
			pstmt.setString(3, chatContent);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
}