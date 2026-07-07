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

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User loggedInUser =
                (User) session.getAttribute("loggedInUser");

        if(loggedInUser == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        String name = request.getParameter("name");

        String email = request.getParameter("email");

        String phone = request.getParameter("phone");

        String address = request.getParameter("address");
        
        String username = request.getParameter("username");

        User user = new User();

        user.setUserId(loggedInUser.getUserId());

        user.setName(name);

        user.setPassword(loggedInUser.getPassword());

        user.setEmail(email);

        user.setPhone(phone);

        user.setAddress(address);
        
        user.setUsername(username);

        user.setRole(loggedInUser.getRole());

        UserDAO dao = new UserDAOImpl();

     User existingUser = dao.getUserByUsername(username);

     if(existingUser != null &&
        existingUser.getUserId() != loggedInUser.getUserId()){

         request.setAttribute(
                 "error",
                 "Username already exists.");

         request.getRequestDispatcher("editProfile.jsp")
                .forward(request, response);

         return;
     }

     boolean updated = dao.updateUser(user);

     if(updated) {

            session.setAttribute("loggedInUser", user);

            response.sendRedirect("profile.jsp");
        }
        else {

            request.setAttribute(
                    "error",
                    "Profile update failed.");

            request.getRequestDispatcher("editProfile.jsp")
                   .forward(request, response);
        }
    }
}