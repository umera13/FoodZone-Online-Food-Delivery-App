package com.food.dao;

import java.util.List;
import com.food.model.Restaurant;

public interface RestaurantDAO {

    int addRestaurant(Restaurant restaurant);

    Restaurant getRestaurantById(int restaurantID);

    List<Restaurant> getAllRestaurants();

    boolean updateRestaurant(Restaurant restaurant);

    boolean deleteRestaurant(int restaurantID);
    
    Restaurant searchRestaurant(String keyword);
}