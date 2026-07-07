package com.food.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.OrderDAO;
import com.food.model.Order;
import com.food.model.OrderDetails;
import com.food.util.DBConnection;
import com.food.model.OrderHistory;
import com.food.model.OrderItemDetails;

import java.time.LocalDateTime;

public class OrderDAOImpl implements OrderDAO {

	private static final String INSERT_ORDER =
			"INSERT INTO ordertable(UserID, RestaurantID, TotalAmount, Status, DeliveryAddress, PaymentMethod, EstimatedDelivery) VALUES(?,?,?,?,?,?,?)";

    private static final String GET_ORDER_BY_ID =
            "SELECT * FROM ordertable WHERE OrderID=?";

    private static final String GET_ORDERS_BY_USER =
            "SELECT * FROM ordertable WHERE UserID=? ORDER BY OrderDate DESC";

    private static final String UPDATE_STATUS =
            "UPDATE ordertable SET Status=? WHERE OrderID=?";

    private static final String GET_ALL_ORDERS =
            "SELECT * FROM ordertable ORDER BY OrderDate DESC";
    
    private static final String GET_ORDER_HISTORY =
            "SELECT o.OrderID, o.OrderDate, o.TotalAmount, o.Status, " +
            "m.ItemName, m.ImagePath " +
            "FROM ordertable o " +
            "JOIN orderitem oi ON o.OrderID = oi.OrderID " +
            "JOIN menu m ON oi.MenuID = m.MenuID " +
            "WHERE o.UserID=? " +
            "ORDER BY o.OrderDate DESC";
    
    private static final String GET_ORDER_ITEMS =
    	    "SELECT " +
    	    "m.ItemName, " +
    	    "m.Price, " +
    	    "oi.Quantity, " +
    	    "oi.ItemTotal AS TotalPrice " +
    	    "FROM orderitem oi " +
    	    "JOIN menu m ON oi.MenuID = m.MenuID " +
    	    "WHERE oi.OrderID=?";

    @Override
    public Order addOrder(Order order) {

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement pstmt =
                    connection.prepareStatement(
                            INSERT_ORDER,
                            Statement.RETURN_GENERATED_KEYS);

            pstmt.setInt(1, order.getUserId());
            pstmt.setInt(2, order.getRestaurantId());
            pstmt.setDouble(3, order.getTotalAmount());
            pstmt.setString(4, order.getStatus());
            pstmt.setString(5, order.getDeliveryAddress());
            pstmt.setString(6, order.getPaymentMethod());
            pstmt.setString(7, order.getEstimatedDelivery());

            int rows = pstmt.executeUpdate();

            if(rows > 0) {

                ResultSet rs = pstmt.getGeneratedKeys();

                if(rs.next()) {

                    order.setOrderId(rs.getInt(1));
                }

                return order;
            }

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return null;
    }

    @Override
    public Order getOrderById(int orderId) {

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement pstmt =
                    connection.prepareStatement(GET_ORDER_BY_ID);

            pstmt.setInt(1, orderId);

            ResultSet rs = pstmt.executeQuery();

            if(rs.next()) {

                return extractOrder(rs);
            }

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<Order> getAllOrders() {

        List<Order> orders = new ArrayList<>();

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement pstmt =
                    connection.prepareStatement(GET_ALL_ORDERS);

            ResultSet rs = pstmt.executeQuery();

            while(rs.next()) {

                orders.add(extractOrder(rs));
            }

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return orders;
    }

    @Override
    public List<Order> getOrdersByUserId(int userId) {

        List<Order> orders = new ArrayList<>();

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement pstmt =
                    connection.prepareStatement(GET_ORDERS_BY_USER);

            pstmt.setInt(1, userId);

            ResultSet rs = pstmt.executeQuery();

            while(rs.next()) {

                orders.add(extractOrder(rs));
            }

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return orders;
    }
    
    @Override
    public List<OrderHistory> getOrderHistory(int userId) {

        List<OrderHistory> history = new ArrayList<>();

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement pstmt =
                    connection.prepareStatement(GET_ORDER_HISTORY);

            pstmt.setInt(1, userId);

            ResultSet rs = pstmt.executeQuery();

            while(rs.next()) {

                OrderHistory order = new OrderHistory();

                order.setOrderId(rs.getInt("OrderID"));

                if(rs.getTimestamp("OrderDate") != null) {

                    order.setOrderDate(
                            rs.getTimestamp("OrderDate").toLocalDateTime());
                }

                order.setFoodName(rs.getString("ItemName"));

                order.setFoodImage(rs.getString("ImagePath"));

                order.setTotalAmount(rs.getDouble("TotalAmount"));

                order.setStatus(rs.getString("Status"));

                history.add(order);
            }

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return history;
    }
    
    @Override
    public OrderDetails getOrderDetails(int orderId) {

        OrderDetails order = null;

        String sql =
                "SELECT * FROM ordertable WHERE OrderID=?";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, orderId);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                order = new OrderDetails();

                order.setOrderId(rs.getInt("OrderID"));
                order.setUserId(rs.getInt("UserID"));
                order.setRestaurantId(rs.getInt("RestaurantID"));
                order.setOrderDate(rs.getTimestamp("OrderDate").toLocalDateTime());
                order.setTotalAmount(rs.getDouble("TotalAmount"));
                order.setStatus(rs.getString("Status"));
                order.setDeliveryAddress(rs.getString("DeliveryAddress"));
                order.setPaymentMethod(rs.getString("PaymentMethod"));
                order.setEstimatedDelivery(rs.getString("EstimatedDelivery"));

            }

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return order;
    }
    
    @Override
    public List<OrderItemDetails> getOrderItems(int orderId) {

        List<OrderItemDetails> items = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(GET_ORDER_ITEMS);

            ps.setInt(1, orderId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                OrderItemDetails item =
                        new OrderItemDetails();

                item.setItemName(rs.getString("ItemName"));

                item.setPrice(rs.getDouble("Price"));

                item.setQuantity(rs.getInt("Quantity"));

                item.setTotalPrice(rs.getDouble("TotalPrice"));

                items.add(item);
            }

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return items;
    }

    
    
    @Override
    public boolean updateOrderStatus(int orderId, String status) {

        try {

            Connection connection = DBConnection.getConnection();

            PreparedStatement pstmt =
                    connection.prepareStatement(UPDATE_STATUS);

            pstmt.setString(1, status);
            pstmt.setInt(2, orderId);

            return pstmt.executeUpdate() > 0;

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    private Order extractOrder(ResultSet rs) {

        try {

            Order order = new Order();

            order.setOrderId(rs.getInt("OrderID"));
            order.setUserId(rs.getInt("UserID"));
            order.setRestaurantId(rs.getInt("RestaurantID"));

            if(rs.getTimestamp("OrderDate") != null) {

                order.setOrderDate(
                        rs.getTimestamp("OrderDate")
                        .toLocalDateTime());
            }

            order.setTotalAmount(rs.getDouble("TotalAmount"));
            order.setStatus(rs.getString("Status"));
            order.setDeliveryAddress(rs.getString("DeliveryAddress"));
            order.setPaymentMethod(rs.getString("PaymentMethod"));
            order.setEstimatedDelivery(rs.getString("EstimatedDelivery"));

            return order;

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return null;
    }
}