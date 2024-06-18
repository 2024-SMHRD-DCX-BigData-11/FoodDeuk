package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@Setter
@ToString
public class Search {
    private String keyword;
    private int menu_price;
    private double lat;
    private double lng;

    // 기본 생성자
    public Search() {}
}
