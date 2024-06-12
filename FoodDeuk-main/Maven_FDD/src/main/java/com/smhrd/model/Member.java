package com.smhrd.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class Member {
	private int user_no;
	@NonNull
	private String user_id;
	@NonNull
	private String user_pw;

	public Member(@NonNull String user_id, @NonNull String user_pw) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
	}

	@NonNull
	private String user_addr;

	private String joined_at;

}