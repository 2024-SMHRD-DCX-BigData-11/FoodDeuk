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
	private String res_image;
    private String res_name;
    private String res_phone;
    private String menu_name;
    private int menu_price;
    private double ratings;

    // 기본 생성자
    public Banner() {}
}
