package com.laptopcoursework.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.laptopcoursework.config.DbConfig;
import com.laptopcoursework.model.ProductModel;

public class AddProductService {
    public boolean addProduct(ProductModel product) {
        String sql = "INSERT INTO product (product_name, brand, model, specs, price, stock_quantity, description, image_path) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, product.getProduct_name());
            stmt.setString(2, product.getBrand());
            stmt.setString(3, product.getModel());
            stmt.setString(4, product.getSpecs());
            stmt.setDouble(5, product.getPrice());
            stmt.setInt(6, product.getStock_quantity());
            stmt.setString(7, product.getDescription());
            stmt.setString(8, product.getImage_path());
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }
}