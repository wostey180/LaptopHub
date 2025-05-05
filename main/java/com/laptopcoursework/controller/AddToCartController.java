package com.laptopcoursework.controller;

import com.laptopcoursework.config.DbConfig;
import com.laptopcoursework.model.UserModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/add-to-cart")
public class AddToCartController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the session and user data
        HttpSession session = request.getSession();
        UserModel user = (UserModel) session.getAttribute("user");

        // If user is not logged in, redirect to login
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String productIdStr = request.getParameter("productId");

        // Check if productId is valid
        if (productIdStr == null || productIdStr.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Product ID is required");
            return;
        }

        int productId = -1;
        try {
            productId = Integer.parseInt(productIdStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Product ID");
            return;
        }

        String username = user.getUsername();

        try (Connection conn = DbConfig.getDbConnection()) {

            // Get or create cart ID for the user
            int cartId = getOrCreateCartId(conn, username);

            // Check if the product already exists in the cart
            String checkSql = "SELECT quantity FROM cart_product WHERE cart_id = ? AND product_id = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkSql);
            checkStmt.setInt(1, cartId);
            checkStmt.setInt(2, productId);

            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Product already in cart, increase quantity by 1
                int existingQty = rs.getInt("quantity");
                String updateSql = "UPDATE cart_product SET quantity = ? WHERE cart_id = ? AND product_id = ?";
                PreparedStatement updateStmt = conn.prepareStatement(updateSql);
                updateStmt.setInt(1, existingQty + 1);
                updateStmt.setInt(2, cartId);
                updateStmt.setInt(3, productId);
                updateStmt.executeUpdate();
            } else {
                // Product not in cart, insert new product with quantity = 1
                String insertSql = "INSERT INTO cart_product (cart_id, product_id, quantity) VALUES (?, ?, ?)";
                PreparedStatement insertStmt = conn.prepareStatement(insertSql);
                insertStmt.setInt(1, cartId);
                insertStmt.setInt(2, productId);
                insertStmt.setInt(3, 1);
                insertStmt.executeUpdate();
            }

            // Redirect user to the cart page after successful addition
            response.sendRedirect(request.getContextPath() + "/cart");

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error adding product to cart");
        }
    }

    private int getOrCreateCartId(Connection conn, String username) throws SQLException {
        // Check if cart already exists for the user
        String selectSql = "SELECT cart_id FROM cart WHERE username = ?";
        PreparedStatement selectStmt = conn.prepareStatement(selectSql);
        selectStmt.setString(1, username);

        ResultSet rs = selectStmt.executeQuery();
        if (rs.next()) {
            return rs.getInt("cart_id");
        } else {
            // Create new cart for user if none exists
            String insertSql = "INSERT INTO cart (username) VALUES (?)";
            PreparedStatement insertStmt = conn.prepareStatement(insertSql, PreparedStatement.RETURN_GENERATED_KEYS);
            insertStmt.setString(1, username);
            insertStmt.executeUpdate();

            ResultSet generatedKeys = insertStmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                return generatedKeys.getInt(1);
            } else {
                throw new SQLException("Failed to create cart for user");
            }
        }
    }
}
