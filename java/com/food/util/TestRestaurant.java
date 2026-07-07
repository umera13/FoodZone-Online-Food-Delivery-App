package com.food.util;

import java.util.List;
import com.food.daoimpl.RestaurantDAOImpl;
import com.food.model.Restaurant;

public class TestRestaurant {

    public static void main(String[] args) {

        RestaurantDAOImpl dao = new RestaurantDAOImpl();

        List<Restaurant> restaurants = dao.getAllRestaurants();

        for(Restaurant r : restaurants) {
            System.out.println(r);
        }
    }
}