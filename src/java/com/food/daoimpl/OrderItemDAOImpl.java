package com.food.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.OrderItemDAO;
import com.food.model.OrderItem;
import com.food.util.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO {

    private static final String INSERT_ORDER_ITEM =
            "INSERT INTO orderitem(OrderID, MenuID, Quantity, ItemTotal) VALUES(?,?,?,?)";

    private static final String GET_ORDER_ITEMS =
            "SELECT * FROM orderitem WHERE OrderID=?";

    @Override
    public int addOrderItem(OrderItem orderItem) {

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement pstmt =
                    connection.prepareStatement(INSERT_ORDER_ITEM)
        ) {

            pstmt.setInt(1, orderItem.getOrderId());
            pstmt.setInt(2, orderItem.getMenuId());
            pstmt.setInt(3, orderItem.getQuantity());
            pstmt.setDouble(4, orderItem.getItemTotal());

            return pstmt.executeUpdate();

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return 0;
    }
    @Override
    public List<OrderItem> getOrderItemsByOrderId(int orderId) {

        List<OrderItem> orderItems = new ArrayList<>();

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement pstmt =
                    connection.prepareStatement(GET_ORDER_ITEMS)
        ) {

            pstmt.setInt(1, orderId);

            ResultSet rs = pstmt.executeQuery();

            while(rs.next()) {

                orderItems.add(extractOrderItem(rs));
            }

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return orderItems;
    }

    private OrderItem extractOrderItem(ResultSet rs) {

        try {

            OrderItem orderItem = new OrderItem();

            orderItem.setOrderItemId(rs.getInt("OrderItemID"));
            orderItem.setOrderId(rs.getInt("OrderID"));
            orderItem.setMenuId(rs.getInt("MenuID"));
            orderItem.setQuantity(rs.getInt("Quantity"));
            orderItem.setItemTotal(rs.getDouble("ItemTotal"));

            return orderItem;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }
}