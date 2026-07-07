package com.food.servlet;

import java.io.IOException;

import com.food.daoimpl.MenuDAOImpl;
import com.food.model.Cart;
import com.food.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        int menuID = Integer.parseInt(request.getParameter("menuID"));

        HttpSession session = request.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {

            cart = new Cart();

            session.setAttribute("cart", cart);
        }

        MenuDAOImpl menuDAO = new MenuDAOImpl();

        // ================= ADD =================

        if ("add".equals(action)) {

            Menu menu = menuDAO.getMenuById(menuID);

            int restaurantID = menu.getRestaurantID();

            if (cart.isEmpty()) {

                cart.setRestaurantId(restaurantID);

                cart.addItem(menu);
            }
            else if (cart.getRestaurantId() == restaurantID) {

                cart.addItem(menu);
            }
            else {

                cart.clear();

                cart.setRestaurantId(restaurantID);

                cart.addItem(menu);
            }
        }

        // ================= UPDATE =================

        else if ("update".equals(action)) {

            int quantity = Integer.parseInt(request.getParameter("quantity"));

            cart.updateItem(menuID, quantity);

            if (cart.isEmpty()) {

                cart.setRestaurantId(0);
            }
        }

        // ================= REMOVE =================

        else if ("remove".equals(action)) {

            cart.removeItem(menuID);

            if (cart.isEmpty()) {

                cart.setRestaurantId(0);
            }
        }

        session.setAttribute("cart", cart);

        response.sendRedirect("cart.jsp");
    }
}