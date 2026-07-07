package com.food.servlet;

import java.io.IOException;
import java.util.List;

import com.food.daoimpl.MenuDAOImpl;
import com.food.model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet
{

	@Override
	protected void doGet(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{
		int restaurantID = Integer.parseInt(req.getParameter("restaurantID"));
		MenuDAOImpl menuDAOImpl=new MenuDAOImpl();
		List<Menu> getMenuByRestaurantId = menuDAOImpl.getMenuByRestaurantId(restaurantID);
		for(Menu menu : getMenuByRestaurantId) {
			System.out.println(menu);
		}
		req.setAttribute("getMenuByRestaurantId", getMenuByRestaurantId);
		RequestDispatcher rd=req.getRequestDispatcher("/menu.jsp");
		rd.forward(req, resp);
	}

}
