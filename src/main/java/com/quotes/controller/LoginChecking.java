package com.quotes.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.quotes.dao.UserBo;
import com.quotes.model.Users;

@WebServlet("/loginUser")
public class LoginChecking extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        
        UserBo userBo = UserBo.objUserBoImp();
        
        Users usr = userBo.getLogin(name, password);
        
        if (usr != null) {
        	session.setAttribute("name", name);
            
            response.sendRedirect("home.jsp");
            
        } else {
            request.setAttribute("errorMessage", "Invalid credentials. Please try again");
            request.getRequestDispatcher("login.jsp").forward(request, response);;
        }
        
    }
    
    
    
    
}

