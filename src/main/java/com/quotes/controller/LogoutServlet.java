package com.quotes.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/logoutservlet")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false); // Fetch the current session
        if (session != null) {
            session.invalidate(); // Invalidate the session
        }
        
        // Redirect to the login page or home page
//        response.sendRedirect(request.getContextPath() + "/login.jsp");
        response.sendRedirect( "login.jsp");
    }
}
