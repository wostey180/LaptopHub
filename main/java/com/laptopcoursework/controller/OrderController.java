package com.laptopcoursework.controller;

import com.laptopcoursework.model.OrderModel;
import com.laptopcoursework.service.OrderService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/orders")
public class OrderController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Fetch all orders from the service
        List<OrderModel> orders = orderService.getAllOrders();

        // Set the orders as a request attribute
        request.setAttribute("orders", orders);

        // Forward the request to orders.jsp
        request.getRequestDispatcher("/WEB-INF/pages/orders.jsp").forward(request, response);
    }
}
