package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@Setter
@ToString
public class Banner {
	private String res_img;
    private String res_name;
    private String menu_name;
    private int price;

    // 기본 생성자
    public Banner() {}
}
