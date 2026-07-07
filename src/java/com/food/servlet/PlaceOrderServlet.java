package com.food.servlet;

import java.io.IOException;

import com.food.dao.OrderDAO;
import com.food.dao.OrderItemDAO;
import com.food.daoimpl.OrderDAOImpl;
import com.food.daoimpl.OrderItemDAOImpl;
import com.food.model.Cart;
import com.food.model.CartItem;
import com.food.model.Order;
import com.food.model.OrderItem;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/placeOrder")
public class PlaceOrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
    	
    	
    	

        HttpSession session = request.getSession();

        // Logged In User
        User user = (User) session.getAttribute("loggedInUser");

        if (user == null) {

        	session.setAttribute("redirectAfterLogin", "checkout");
        	response.sendRedirect("login.jsp");
        	return;
        }

        // Cart
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {

            response.sendRedirect("cart.jsp");
            return;
        }

        // Read Form Data
        String paymentMethod =
                request.getParameter("paymentMethod");

        String addressType =
                request.getParameter("addressType");
        
        
        String deliveryAddress;

        if("saved".equals(addressType))
        {
            deliveryAddress = user.getAddress();
        }
        else
        {
            deliveryAddress =
                    request.getParameter("deliveryAddress");

            if(deliveryAddress == null ||
               deliveryAddress.trim().isEmpty())
            {
                deliveryAddress = user.getAddress();
            }
        }

        double totalAmount =
                Double.parseDouble(
                        request.getParameter("totalAmount"));

        // Create Order Object
        Order order = new Order();

        order.setUserId(user.getUserId());

        order.setRestaurantId(cart.getRestaurantId());

        order.setTotalAmount(totalAmount);

        order.setStatus("Confirmed");
        System.out.println("Order Status = " + order.getStatus());
        
        order.setDeliveryAddress(deliveryAddress);
        order.setPaymentMethod(paymentMethod);
        order.setEstimatedDelivery("30 - 40 Minutes");

        // Create DAO Objects
        OrderDAO orderDAO =
                new OrderDAOImpl();

        OrderItemDAO orderItemDAO =
                new OrderItemDAOImpl();

        // Save Order
        Order savedOrder =
                orderDAO.addOrder(order);

        if (savedOrder == null) {

            response.sendRedirect("checkout");

            return;
        }

        // Save Order Items
        for (CartItem cartItem :
                cart.getItems().values()) {

            OrderItem orderItem =
                    new OrderItem();

            orderItem.setOrderId(
                    savedOrder.getOrderId());

            orderItem.setMenuId(
                    cartItem.getMenu().getMenuID());

            orderItem.setQuantity(
                    cartItem.getQuantity());

            orderItem.setItemTotal(
                    cartItem.getTotalPrice());

            orderItemDAO.addOrderItem(orderItem);
        }

        // Clear Cart
        cart.clear();

        session.setAttribute("cart", cart);

        // Send Data To Success Page
        request.setAttribute(
                "order",
                savedOrder);

        request.setAttribute(
                "paymentMethod",
                paymentMethod);

        request.setAttribute(
                "deliveryAddress",
                deliveryAddress);

        request.getRequestDispatcher(
                "orderSuccess.jsp")
                .forward(request, response);
    }
}