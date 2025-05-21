package com.laptopcoursework.service;

import com.laptopcoursework.config.DbConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DeleteProductService {

    public boolean deleteProductById(int productId) {
        String query = "DELETE FROM product WHERE product_id = ?";

        try (Connection connection = DbConfig.getDbConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setInt(1, productId);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Removes a specific product from the user's cart.
     *
     * @param userId    The ID of the user whose cart is being modified.
     * @param productId The ID of the product to be removed from the cart.
     * @return true if the product was successfully removed; false otherwise.
     */
    public boolean removeProductFromCart(int userId, int productId) {
        String findCartIdSql = "SELECT cart_id FROM cart WHERE user_id = ?";
        String deleteFromCartProductSql = "DELETE FROM cart_product WHERE cart_id = ? AND product_id = ?";

        try (
            Connection conn = DbConfig.getDbConnection();
            PreparedStatement findCartStmt = conn.prepareStatement(findCartIdSql)
        ) {
            findCartStmt.setInt(1, userId);

            try (ResultSet rs = findCartStmt.executeQuery()) {
                if (rs.next()) {
                    int cartId = rs.getInt("cart_id");

                    try (PreparedStatement deleteStmt = conn.prepareStatement(deleteFromCartProductSql)) {
                        deleteStmt.setInt(1, cartId);
                        deleteStmt.setInt(2, productId);

                        int rowsAffected = deleteStmt.executeUpdate();
                        return rowsAffected > 0;
                    }
                } else {
                    System.out.println("[ERROR] No cart found for user ID: " + userId);
                }
            }

        } catch (Exception e) {
            System.out.println("[ERROR] Exception in removeProductFromCart");
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Removes all items from a user's cart.
     *
     * @param userId The ID of the user whose cart is being cleared.
     * @return true if the cart was successfully cleared; false otherwise.
     */
    public boolean clearCart(int userId) {
        // SQL statement to delete all products from the user's cart
        String sql = "DELETE FROM cart_product WHERE cart_id IN (SELECT cart_id FROM cart WHERE user_id = ?)";

        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            // Set the user ID in the SQL statement
            ps.setInt(1, userId);

            // Execute the SQL update and return true if at least one row was affected
            return ps.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean removeOutOfStockItemsFromCart(int userId) {
        String deleteSql = """
            DELETE FROM cart_product 
            WHERE cart_id IN (SELECT cart_id FROM cart WHERE user_id = ?)
            AND product_id IN (SELECT product_id FROM product WHERE stock_quantity < 1)
        """;

        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement ps = conn.prepareStatement(deleteSql)) {

            ps.setInt(1, userId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }
}
