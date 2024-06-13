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

public class Board {
	private int num;
	@NonNull
	private String title;
	@NonNull
	private String writer;
	@NonNull
	private String filename;
	@NonNull
	private String content;
	private String b_date;
}
