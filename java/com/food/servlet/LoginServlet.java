package com.food.servlet;

import java.io.IOException;

import com.food.dao.UserDAO;
import com.food.daoimpl.UserDAOImpl;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {

        userDAO = new UserDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userDAO.loginUser(email, password);

        if(user != null) {

            HttpSession session = request.getSession();

            session.setAttribute("loggedInUser", user);

            String redirect =
                    (String) session.getAttribute("redirectAfterLogin");

            if (redirect != null) {

                session.removeAttribute("redirectAfterLogin");

                response.sendRedirect(redirect);

            } else {

                response.sendRedirect("index.jsp");
            }
        }
        else {

            request.setAttribute("error",
                    "Invalid Email or Password!");

            request.getRequestDispatcher("login.jsp")
                   .forward(request, response);
        }
    }
}