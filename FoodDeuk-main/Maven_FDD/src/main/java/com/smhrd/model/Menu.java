package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Menu {
	private int res_no;
	private int menu_no;
	private String menu_name;
	private int menu_price;
	private String menu_desc;
	private String menu_image;
}
