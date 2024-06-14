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
    private String menu_name;
    private String res_no;
    private String res_name;
    private String address;

    // 기본 생성자
    public Search() {}
}
