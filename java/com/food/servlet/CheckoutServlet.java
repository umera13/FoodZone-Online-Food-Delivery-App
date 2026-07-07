package com.food.servlet;

import java.io.IOException;

import com.food.model.Cart;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("loggedInUser");

        if(user == null) {

            session.setAttribute("redirectAfterLogin", "checkout");

            response.sendRedirect("login.jsp");

            return;
        }
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {

            response.sendRedirect("cart.jsp");
            return;
        }

        request.setAttribute("cart", cart);
        request.setAttribute("totalAmount", cart.getTotalAmount());
        request.setAttribute("user", user);

        request.getRequestDispatcher("checkout.jsp")
                .forward(request, response);
    }
}