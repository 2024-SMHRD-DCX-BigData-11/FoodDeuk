package com.smhrd.model;

public class Chat {
	
	int chatID;
	String user_Name;
	String chatContent;
	String chatTime;
	public String getUserName() {
		return user_Name;
	}
	public void setUserName(String user_Name) {
		this.user_Name = user_Name;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
	public String getChatTime() {
		return chatTime;
	}
	public void setChatTime(String chatTime) {
		this.chatTime = chatTime;
	}
	public int getChatID() {
		return chatID;
	}
	public void setChatID(int chatID) {
		this.chatID = chatID;
	}
	
	
	
}