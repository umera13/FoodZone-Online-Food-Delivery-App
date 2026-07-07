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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

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

        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        // Duplicate Username Check
        if(userDAO.isUsernameExists(username)) {
        	
        	System.out.println("Username Already Exists");

            request.setAttribute("error",
                    "Username already exists!");

            request.getRequestDispatcher("register.jsp")
                    .forward(request, response);

            return;
        }

        // Duplicate Email Check
        if(userDAO.isEmailExists(email)) {

            request.setAttribute("error",
                    "Email already registered!");

            request.getRequestDispatcher("register.jsp")
                    .forward(request, response);

            return;
        }

        User user = new User();

        user.setName(name);
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);
        user.setRole("Customer");

        int result = userDAO.addUser(user);

        if(result > 0) {

            response.sendRedirect("login.jsp?success=1");

        } else {

            request.setAttribute("error",
                    "Registration Failed!");

            request.getRequestDispatcher("register.jsp")
                    .forward(request, response);
        }
        
    }
}