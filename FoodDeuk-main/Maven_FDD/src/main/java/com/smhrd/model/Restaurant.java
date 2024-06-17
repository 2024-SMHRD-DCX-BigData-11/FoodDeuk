package com.smhrd.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Restaurant {
	private int res_no;
	private String res_name;
	private double lat;
	private double lng;
	private String res_addr;
	private String res_image;
	private String res_phone;
	private String res_common_addr;
	
	private Map<Integer, Menu> menus = new HashMap<>();
	
	public void addMenu(Menu menu) {
		this.menus.put(menu.getMenu_no(), menu);
	}

	public void setMenus(Map<Integer, Menu> menus) {
		this.menus = menus;
	}
	
	public Map<Integer, Menu> getMenus() {
		return menus;
	}
}
