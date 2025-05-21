package com.laptopcoursework.controller;

import com.laptopcoursework.config.DbConfig;

import com.laptopcoursework.model.CartItemModel;
//import com.laptopcoursework.model.OrderModel;
import com.laptopcoursework.service.DeleteProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve the cart items from the session
        HttpSession session = request.getSession();
        List<CartItemModel> cartItems = (List<CartItemModel>) session.getAttribute("cartItems");
        cartItems.stream().forEach(a -> System.out.print(a.getName()));

        if (cartItems == null || cartItems.isEmpty()) {
            response.sendRedirect("cart.jsp");  // If cart is empty, redirect back to the cart page
            return;
        }

        // Get user information from the session
        int userId = (int) session.getAttribute("userId");  // Assuming user_id is stored in session
        //HttpSession userId = session.getAttribute("userId");
        System.out.print(userId);
        double totalAmount = 0;

        try (Connection conn = DbConfig.getDbConnection()) {
            // Insert the order into the 'orders' table
            String insertOrderSql = "INSERT INTO orders (order_date, total_amount, status, user_id) VALUES (?, ?, ?, ?)";
            PreparedStatement orderStmt = conn.prepareStatement(insertOrderSql, Statement.RETURN_GENERATED_KEYS);
            orderStmt.setString(1, new java.sql.Date(System.currentTimeMillis()).toString());
            orderStmt.setDouble(2, totalAmount);  // updating total amount
            orderStmt.setString(3, "Pending");  // Default status is 'Pending'
            orderStmt.setInt(4, userId);

            int affectedRows = orderStmt.executeUpdate();
            if (affectedRows > 0) {
                // Get the generated order ID
                ResultSet generatedKeys = orderStmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int orderId = generatedKeys.getInt(1);

                    // Insert products into the 'orders_product' table
                    String insertOrderProductSql = "INSERT INTO order_product (order_id, product_id, price_at_purchase, quantity_ordered) VALUES (?, ?, ?, ?)";
                    PreparedStatement productStmt = conn.prepareStatement(insertOrderProductSql);

                    for (CartItemModel cartItem : cartItems) {
                        productStmt.setInt(1, orderId);
                        productStmt.setInt(2, cartItem.getProductId());
                        productStmt.setDouble(3, cartItem.getPrice()); 
                        productStmt.setInt(4, cartItem.getQuantity());
                        productStmt.addBatch();
                        totalAmount += cartItem.getPrice() * cartItem.getQuantity();
                    }

                    productStmt.executeBatch();  // Execute all insertions at once

                    // Update the total amount in the 'orders' table
                    String updateOrderSql = "UPDATE orders SET total_amount = ? WHERE order_id = ?";
                    PreparedStatement updateStmt = conn.prepareStatement(updateOrderSql);
                    updateStmt.setDouble(1, totalAmount);
                    updateStmt.setInt(2, orderId);
                    updateStmt.executeUpdate();
                    
                    DeleteProductService cartSvc = new DeleteProductService();
                    cartSvc.clearCart(userId);
                }
            }

            // Clear the cart after the order is placed
            session.removeAttribute("cartItems");

            // Redirect to a confirmation or success page
            response.sendRedirect(request.getContextPath() + "/order-success");

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error placing the order");
        }
    }
}
