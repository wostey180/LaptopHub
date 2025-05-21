package com.laptopcoursework.controller;

import com.laptopcoursework.model.OrderModel;
import com.laptopcoursework.service.OrderService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/admin/order-details")
public class OrderDetailsController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String orderIdParam = request.getParameter("order_id");

        // Check if the order_id parameter is valid
        if (orderIdParam != null && !orderIdParam.isEmpty()) {
            try {
                int orderId = Integer.parseInt(orderIdParam);

                // Fetch the order details from the service
                OrderModel order = orderService.getOrderWithItems(orderId);

                if (order != null) {
                    // If order exists, forward to the order details page
                    request.setAttribute("order", order);
                    request.getRequestDispatcher("/WEB-INF/pages/order-details.jsp").forward(request, response);
                } else {
                    // If the order is not found in the database
                    response.sendRedirect(request.getContextPath() + "/admin/orders?error=OrderNotFound");
                }
            } catch (NumberFormatException e) {
                // If the order_id is not a valid integer
                response.sendRedirect(request.getContextPath() + "/admin/orders?error=InvalidOrderId");
            }
        } else {
            // If the order_id parameter is missing
            response.sendRedirect(request.getContextPath() + "/admin/orders?error=MissingOrderId");
        }
    }
}
