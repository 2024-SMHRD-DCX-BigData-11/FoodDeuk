package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor

@Getter
@Setter
@ToString

public class Review {
	public Review(String review_content, String filename, String ratings2) {
		super();
		this.review_content = review_content;
		this.filename = filename;
		this.ratings = ratings2;
		
	}



	private int review_no;
	private int res_no;
	private int user_no;
	private String filename;
	private String review_content;
	private String ratings;
	private String r_date;
}