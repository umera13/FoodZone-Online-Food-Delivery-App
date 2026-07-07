package com.food.dao;

import java.util.List;
import com.food.model.OrderItem;

public interface OrderItemDAO {

    int addOrderItem(OrderItem orderItem);

    List<OrderItem> getOrderItemsByOrderId(int orderId);

}