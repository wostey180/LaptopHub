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
}
