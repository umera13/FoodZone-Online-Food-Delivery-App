package com.food.servlet;

import java.io.IOException;
import java.util.List;

import com.food.daoimpl.RestaurantDAOImpl;
import com.food.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/restaurants")
public class RestaurantServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        RestaurantDAOImpl dao =
                new RestaurantDAOImpl();

        List<Restaurant> restaurantList =
                dao.getAllRestaurants();

        request.setAttribute(
                "restaurantList",
                restaurantList);

        request.getRequestDispatcher(
                "restaurants.jsp")
                .forward(request, response);
    }
}