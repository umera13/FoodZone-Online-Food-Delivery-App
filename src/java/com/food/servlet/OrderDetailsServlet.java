package com.food.servlet;

import java.io.IOException;
import java.util.List;

import com.food.dao.OrderDAO;
import com.food.daoimpl.OrderDAOImpl;
import com.food.model.OrderDetails;
import com.food.model.OrderItemDetails;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/orderDetails")
public class OrderDetailsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
    	
    	System.out.println("========== ORDER DETAILS SERVLET ==========");

        try {

            int orderId =
                    Integer.parseInt(request.getParameter("orderId"));
            
            System.out.println("Order ID Received : " + orderId);

            OrderDAO dao = new OrderDAOImpl();

            OrderDetails order =
                    dao.getOrderDetails(orderId);

            List<OrderItemDetails> items =
                    dao.getOrderItems(orderId);
            
            System.out.println("Items Found : " + items.size());

            for(OrderItemDetails item : items) {
                System.out.println(item);
            }

            request.setAttribute("order", order);

            request.setAttribute("items", items);

            RequestDispatcher rd =
                    request.getRequestDispatcher("orderDetails.jsp");

            rd.forward(request, response);

        }
        catch(Exception e) {

            e.printStackTrace();

            response.sendRedirect("myOrders");
        }
    }
}