package com.laptopcoursework.controller;

import com.laptopcoursework.service.OrderService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/admin/change-order-status")
public class ChangeOrderStatusController extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private OrderService orderService = new OrderService();

    @Override
    //post method
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int orderId = Integer.parseInt(request.getParameter("order_id"));
        String status = request.getParameter("status");

        //updating order status
        orderService.updateOrderStatus(orderId, status);

        response.sendRedirect(request.getContextPath() + "/admin/orders");
    }
}
