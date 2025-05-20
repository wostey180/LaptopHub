package com.laptopcoursework.controller;

import com.laptopcoursework.model.UserModel;
import com.laptopcoursework.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/admin/user-profile")
public class UserProfileController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userIdParam = request.getParameter("user_id");

        if (userIdParam != null && !userIdParam.isEmpty()) {
            try {
                int userId = Integer.parseInt(userIdParam);
                UserModel user = userService.getUserById(userId);

                if (user != null) {
                    request.setAttribute("user", user);
                    request.getRequestDispatcher("/WEB-INF/pages/user-profile.jsp").forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/admin/orders?error=UserNotFound");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/admin/orders?error=InvalidUserId");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/orders?error=MissingUserId");
        }
    }
}
