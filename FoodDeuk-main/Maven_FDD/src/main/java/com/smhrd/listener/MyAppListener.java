package com.smhrd.listener;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.smhrd.model.Category;
import com.smhrd.model.Menu;
import com.smhrd.model.MenuDAO;
import com.smhrd.model.Restaurant;
import com.smhrd.model.RestaurantDAO;

@WebListener
public class MyAppListener implements ServletContextListener {

	public static Map<Integer, Restaurant> restaurants = new HashMap<>();
	public static Map<Integer, Category> categorys = new HashMap<>();
	public static Map<Integer, List<Restaurant>> cat_to_res = new HashMap<>();
	public static Map<Integer, Menu> menus = new HashMap<>();

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// 웹 애플리케이션이 시작될 때 실행되는 코드
		System.out.println("웹 애플리케이션이 시작되었습니다.");

		List<Restaurant> r_list = new RestaurantDAO().listAll();
		for (Restaurant restaurant : r_list) {
			restaurants.put(restaurant.getRes_no(), restaurant);
		}

		List<Menu> m_list = new MenuDAO().listAll();
		for (Menu menu : m_list) {
			if (menu.getMenu_price() > 0) {
				restaurants.get(menu.getRes_no()).addMenu(menu);
			}
		}
//        
//        List<Category> c_list = new CategoryDAO().listAll();
//        for (Category category : c_list) {
//        	categorys.put(category.getCategory_no(), category);
//        }

		// 초기화 작업을 여기서 수행할 수 있습니다.
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// 웹 애플리케이션이 종료될 때 실행되는 코드
		System.out.println("웹 애플리케이션이 종료되었습니다.");
		// 정리 작업을 여기서 수행할 수 있습니다.
	}
}