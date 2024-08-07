package com.quotes.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.quotes.dao.UserBo;
import com.quotes.model.Users;

@WebServlet("/registerUser")
public class RegisterUser extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name =request.getParameter("name");
		
		String password =request.getParameter("password");
		
	
		Users  c = new Users(name,password);
		
		UserBo userBoImp = UserBo.objUserBoImp();
		
		int i = userBoImp.register(c);
		
		PrintWriter out = response.getWriter();
		if(i == 1)
		{
			request.setAttribute("errorMessage", "User Registration Successfull, Please login.");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			
		}
		else {
			
			 request.setAttribute("errorMessage", "User already exists, please login.");
             request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		
	}
}

