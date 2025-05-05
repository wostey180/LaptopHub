package com.laptopcoursework.controller;

import com.laptopcoursework.model.UserModel;
import com.laptopcoursework.service.DashboardService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/dashboard")
public class DashboardController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private DashboardService dashboardService = new DashboardService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<UserModel> users = dashboardService.getAllUsers();
        
        // Set attributes for JSP
        request.setAttribute("users", users);
        request.setAttribute("totalUsers", users.size()); // Using list.size()
        
        request.getRequestDispatcher("/admin").forward(request, response);
    }
}
