package com.laptopcoursework.service;

import com.laptopcoursework.model.ProductModel;
import com.laptopcoursework.config.DbConfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ManageProductService {

    public List<ProductModel> getAllProducts() {
        List<ProductModel> products = new ArrayList<>();
        String query = "SELECT * FROM product";  // Ensure this is your actual table name

        try (Connection connection = DbConfig.getDbConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            // Debugging: print query execution to ensure database connection
            System.out.println("Executing query: " + query);

            while (resultSet.next()) {
                ProductModel product = new ProductModel();
                product.setProduct_id(resultSet.getInt("product_id"));
                product.setProduct_name(resultSet.getString("product_name"));
                product.setBrand(resultSet.getString("brand"));
                product.setModel(resultSet.getString("model"));
                product.setSpecs(resultSet.getString("specs"));
                product.setPrice(resultSet.getDouble("price"));
                product.setStock_quantity(resultSet.getInt("stock_quantity"));
                product.setDescription(resultSet.getString("description"));
                product.setImage_path(resultSet.getString("image_path"));

                products.add(product);
            }

            // Debugging: Check if products are retrieved
            System.out.println("Fetched " + products.size() + " products.");

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();  // Log the error for debugging
        }

        return products;
    }
}
