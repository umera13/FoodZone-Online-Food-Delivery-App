package com.food.servlet;

import java.io.IOException;

import com.food.dao.MenuDAO;
import com.food.dao.RestaurantDAO;
import com.food.daoimpl.MenuDAOImpl;
import com.food.daoimpl.RestaurantDAOImpl;
import com.food.model.Menu;
import com.food.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");

        if(keyword == null || keyword.trim().isEmpty()) {

            response.sendRedirect("index.jsp");
            return;
        }

        keyword = keyword.trim();

        RestaurantDAO restaurantDAO = new RestaurantDAOImpl();

        MenuDAO menuDAO = new MenuDAOImpl();

        // Search Restaurant

        Restaurant restaurant =
                restaurantDAO.searchRestaurant(keyword);

        if(restaurant != null) {

            response.sendRedirect(
                    "MenuServlet?restaurantID="
                    + restaurant.getRestaurantID());

            return;
        }

        // Search Menu Item

        Menu menu = menuDAO.searchMenu(keyword);

        if(menu != null) {

            response.sendRedirect(
                    "MenuServlet?restaurantID="
                    + menu.getRestaurantID());

            return;
        }

        // No Result Found

        request.setAttribute("keyword", keyword);

        request.getRequestDispatcher("searchResult.jsp")
               .forward(request, response);
    }
}