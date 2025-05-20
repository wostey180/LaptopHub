package com.laptopcoursework.service;

import com.laptopcoursework.config.DbConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
    	// SQL query to delete the product from the user's cart
        String sql = "DELETE FROM cart_product WHERE cart_id = ? AND product_id = ?";
        try (
        	//Get database connection
        	Connection conn = DbConfig.getDbConnection();
        	//Initialize the sql query with parameters	
            PreparedStatement ps = conn.prepareStatement(sql)) {
        	// Set the user ID and product ID in the SQL statement
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            // Execute the SQL update and return true if at least one row was affected
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
        	// Print the exception stack trace and return false if any error occurs
            e.printStackTrace();
            return false;
        }
    }
    
    /**
	 * Removes all items from a user's cart.
	 *
	 * @param userId The ID of the user whose cart is being cleared.
	 * @return true if the cart was successfully cleared; false otherwise.
	 */
    public boolean clearCart(int userId) {
    	// SQL statement to delete all products from the user's cart
        String sql = "DELETE FROM cart_product WHERE cart_id = ?";
        // Get database connection
        try (Connection conn = DbConfig.getDbConnection();
        	//Initialize the sql query with parameters	
             PreparedStatement ps = conn.prepareStatement(sql)) {
        	// Set the user ID in the SQL statement
            ps.setInt(1, userId);
            // Execute the SQL update and return true if at least one row was affected
            return ps.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
        	// Print the exception stack trace and return false if any error occurs
        	e.printStackTrace();
            return false;
        }
    }
}
