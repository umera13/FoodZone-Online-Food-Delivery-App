package com.food.dao;

import java.util.List;
import com.food.model.Menu;

public interface MenuDAO {

    int insertMenu(Menu menu);

    Menu getMenuById(int menuID);

    List<Menu> getAllMenus();
    
    List<Menu> getMenuByRestaurantId(int restaurantId);

    int updateMenu(Menu menu);

    int deleteMenu(int menuID);
    
    Menu searchMenu(String keyword);
}