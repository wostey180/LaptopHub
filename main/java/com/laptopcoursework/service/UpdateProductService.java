package com.laptopcoursework.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.laptopcoursework.config.DbConfig;
import com.laptopcoursework.model.ProductModel;

public class UpdateProductService {
    private Connection dbConn;

    public UpdateProductService() {
        try {
            this.dbConn = DbConfig.getDbConnection();
        } catch (Exception e) {
            throw new RuntimeException("Database connection failed", e);
        }
    }

    public boolean updateProduct(ProductModel product) {
        if (product == null) {
            return false;
        }

        String sql = "UPDATE product SET product_name = ?, brand = ?, model = ?, specs = ?, price = ?, stock_quantity = ?, description = ?, image_path = ? WHERE product_id = ?";

        try (PreparedStatement stmt = dbConn.prepareStatement(sql)) {
            stmt.setString(1, product.getProduct_name());
            stmt.setString(2, product.getBrand());
            stmt.setString(3, product.getModel());
            stmt.setString(4, product.getSpecs());
            stmt.setDouble(5, product.getPrice());
            stmt.setInt(6, product.getStock_quantity());
            stmt.setString(7, product.getDescription());
            stmt.setString(8, product.getImage_path());
            stmt.setInt(9, product.getProduct_id());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Product update SQL Error: " + e.getMessage());
            return false;
        }
    }
}
