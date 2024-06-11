package com.smhrd.model;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.AllArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@RequiredArgsConstructor
@ToString

public class member {
	
	private String id;
	private String pw;
	
	private String nick;
	@NonNull
	private String email;
	@NonNull
	private String tel;
}
