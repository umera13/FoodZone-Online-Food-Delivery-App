package com.food.dao;

import java.util.List;
import com.food.model.Order;
import com.food.model.OrderDetails;
import com.food.model.OrderHistory;
import com.food.model.OrderItemDetails;

public interface OrderDAO {

    Order addOrder(Order order);

    Order getOrderById(int orderId);

    List<Order> getOrdersByUserId(int userId);

    boolean updateOrderStatus(int orderId, String status);
    
    List<Order> getAllOrders();
    
    List<OrderHistory> getOrderHistory(int userId);
    
    OrderDetails getOrderDetails(int orderId);

    List<OrderItemDetails> getOrderItems(int orderId);

}