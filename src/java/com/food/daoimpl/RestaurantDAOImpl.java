package com.food.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.RestaurantDAO;
import com.food.model.Restaurant;
import com.food.util.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {

    private static final String INSERT_RESTAURANT =
            "INSERT INTO restaurant(Name, CuisineType, DeliveryTime, Address, Ratings, IsActive) VALUES(?,?,?,?,?,?)";

    private static final String GET_RESTAURANT_BY_ID =
            "SELECT * FROM restaurant WHERE RestaurantID=?";

    private static final String GET_ALL_RESTAURANTS =
            "SELECT * FROM restaurant";
    
    private static final String SEARCH_RESTAURANT =

    		"SELECT * FROM restaurant WHERE Name LIKE ? OR CuisineType LIKE ? LIMIT 1";

    private static final String UPDATE_RESTAURANT =
            "UPDATE restaurant SET Name=?, CuisineType=?, DeliveryTime=?, Address=?, Ratings=?, IsActive=? WHERE RestaurantID=?";


    private static final String DELETE_RESTAURANT =
            "DELETE FROM restaurant WHERE RestaurantID=?";
    


    @Override
    public int addRestaurant(Restaurant restaurant) {

        try {
        	
        	Connection connection =
        	        DBConnection.getConnection();

            PreparedStatement pstmt = connection.prepareStatement(INSERT_RESTAURANT);

            pstmt.setString(1, restaurant.getName());
            pstmt.setString(2, restaurant.getCuisineType());
            pstmt.setInt(3, restaurant.getDeliveryTime());
            pstmt.setString(4, restaurant.getAddress());
            pstmt.setDouble(5, restaurant.getRatings());
            pstmt.setBoolean(6, restaurant.isActive());

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public Restaurant getRestaurantById(int restaurantID) {

        Restaurant restaurant = null;

        try {
        	
        	Connection connection =
        	        DBConnection.getConnection();

            PreparedStatement pstmt = connection.prepareStatement(GET_RESTAURANT_BY_ID);

            pstmt.setInt(1, restaurantID);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                restaurant = extractRestaurant(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return restaurant;
    }

    @Override
    public List<Restaurant> getAllRestaurants() {

        List<Restaurant> restaurants = new ArrayList<>();

        try {
        	
        	Connection connection =
        	        DBConnection.getConnection();

            PreparedStatement pstmt = connection.prepareStatement(GET_ALL_RESTAURANTS);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                restaurants.add(extractRestaurant(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return restaurants;
    }

    @Override
    public boolean updateRestaurant(Restaurant restaurant) {

        try {
        	
        	Connection connection =
        	        DBConnection.getConnection();

            PreparedStatement pstmt = connection.prepareStatement(UPDATE_RESTAURANT);

            pstmt.setString(1, restaurant.getName());
            pstmt.setString(2, restaurant.getCuisineType());
            pstmt.setInt(3, restaurant.getDeliveryTime());
            pstmt.setString(4, restaurant.getAddress());
            pstmt.setDouble(5, restaurant.getRatings());
            pstmt.setBoolean(6, restaurant.isActive());
            pstmt.setInt(7, restaurant.getRestaurantID());

            return pstmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean deleteRestaurant(int restaurantID) {

        try {
        	
        	Connection connection =
        	        DBConnection.getConnection();

            PreparedStatement pstmt = connection.prepareStatement(DELETE_RESTAURANT);

            pstmt.setInt(1, restaurantID);

            return pstmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    
    @Override
    public Restaurant searchRestaurant(String keyword) {

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement pstmt =
                    connection.prepareStatement(SEARCH_RESTAURANT);

            pstmt.setString(1, "%" + keyword + "%");

            pstmt.setString(2, "%" + keyword + "%");

            ResultSet rs = pstmt.executeQuery();

            if(rs.next()) {

                return extractRestaurant(rs);

            }

        }

        catch(Exception e) {

            e.printStackTrace();

        }

        return null;

    }
    
    
    private Restaurant extractRestaurant(ResultSet rs) {

        try {

            return new Restaurant(
                    rs.getInt("RestaurantID"),
                    rs.getString("Name"),
                    rs.getString("CuisineType"),
                    rs.getInt("DeliveryTime"),
                    rs.getString("Address"),
                    rs.getDouble("Ratings"),
                    rs.getBoolean("IsActive"),
                    rs.getString("ImagePath")
            );

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}