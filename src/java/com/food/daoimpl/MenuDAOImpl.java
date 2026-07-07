package com.food.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.MenuDAO;
import com.food.model.Menu;
import com.food.util.DBConnection;

public class MenuDAOImpl implements MenuDAO {

	private static final String INSERT_MENU =
			"INSERT INTO menu(RestaurantID, ItemName, Description, Price, IsAvailable, ImagePath) VALUES(?,?,?,?,?,?)";

    private static final String GET_MENU_BY_ID =
            "SELECT * FROM menu WHERE MenuID=?";

    private static final String GET_ALL_MENUS =
            "SELECT * FROM menu";

    private static final String UPDATE_MENU =
    		"UPDATE menu SET RestaurantID=?, ItemName=?, Description=?, Price=?, IsAvailable=?, ImagePath=? WHERE MenuID=?";

    private static final String DELETE_MENU =
            "DELETE FROM menu WHERE MenuID=?";
    
    private static final String GET_MENU_BY_RESTAURANT =
            "SELECT * FROM Menu WHERE RestaurantID=?";
    
    private static final String SEARCH_MENU =

    		"SELECT * FROM menu WHERE ItemName LIKE ? OR Description LIKE ? LIMIT 1";

    @Override
    public int insertMenu(Menu menu) {

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(INSERT_MENU)) {

            pstmt.setInt(1, menu.getRestaurantID());
            pstmt.setString(2, menu.getItemName());
            pstmt.setString(3, menu.getDescription());
            pstmt.setDouble(4, menu.getPrice());
            pstmt.setBoolean(5, menu.isAvailable());
            pstmt.setString(6, menu.getImagePath());

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
    
    @Override
    public List<Menu> getMenuByRestaurantId(int restaurantId) {

        List<Menu> menuList = new ArrayList<>();

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement pstmt =
                    con.prepareStatement(GET_MENU_BY_RESTAURANT)
        ) {

            pstmt.setInt(1, restaurantId);

            ResultSet rs = pstmt.executeQuery();

            while(rs.next()) {

                menuList.add(extractMenu(rs));
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return menuList;
    }
    @Override
    public Menu getMenuById(int menuID) {

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(GET_MENU_BY_ID)) {

            pstmt.setInt(1, menuID);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return extractMenu(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<Menu> getAllMenus() {

        List<Menu> menuList = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(GET_ALL_MENUS);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                menuList.add(extractMenu(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return menuList;
    }

    @Override
    public int updateMenu(Menu menu) {

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(UPDATE_MENU)) {

            pstmt.setInt(1, menu.getRestaurantID());
            pstmt.setString(2, menu.getItemName());
            pstmt.setString(3, menu.getDescription());
            pstmt.setDouble(4, menu.getPrice());
            pstmt.setBoolean(5, menu.isAvailable());
            pstmt.setString(6, menu.getImagePath());
            pstmt.setInt(7, menu.getMenuID());

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public int deleteMenu(int menuID) {

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(DELETE_MENU)) {

            pstmt.setInt(1, menuID);

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
    
    @Override
    public Menu searchMenu(String keyword) {

        try (

            Connection con = DBConnection.getConnection();

            PreparedStatement pstmt =
                    con.prepareStatement(SEARCH_MENU);

        ){

            pstmt.setString(1, "%" + keyword + "%");

            pstmt.setString(2, "%" + keyword + "%");

            ResultSet rs = pstmt.executeQuery();

            if(rs.next()){

                return extractMenu(rs);

            }

        }

        catch(Exception e){

            e.printStackTrace();

        }

        return null;

    }

    private Menu extractMenu(ResultSet rs) {

        try {

            return new Menu(
                    rs.getInt("MenuID"),
                    rs.getInt("RestaurantID"),
                    rs.getString("ItemName"),
                    rs.getString("Description"),
                    rs.getDouble("Price"),
                    rs.getBoolean("IsAvailable"),
                    rs.getString("ImagePath")
            );

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}