package com.food.util;

import java.util.List;
import com.food.daoimpl.MenuDAOImpl;
import com.food.model.Menu;

public class TestMenu {

    public static void main(String[] args) {

        MenuDAOImpl dao = new MenuDAOImpl();

        List<Menu> menus = dao.getAllMenus();

        for(Menu m : menus) {
            System.out.println(m);
        }
    }
}