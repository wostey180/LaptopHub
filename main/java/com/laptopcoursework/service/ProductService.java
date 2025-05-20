package com.laptopcoursework.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.laptopcoursework.config.DbConfig;
import com.laptopcoursework.model.ProductModel;
import java.util.ArrayList;
import java.util.List;
public class ProductService {
	


	public ProductModel getProductById(int productId) {
		String query = "Select * from product where product_id= ?";
		
		
		try (Connection conn = DbConfig.getDbConnection()){
	         PreparedStatement ps = conn.prepareStatement(query);
	         ps.setInt(1, productId);
	         ResultSet rs = ps.executeQuery();
	         if (rs.next()) {
	        	 String productName = rs.getString("product_name");
	        	 ProductModel product = new ProductModel(
	        			 rs.getString("product_name"),
	        			 rs.getString("brand"),
	        			 rs.getString("model"),
	        			 rs.getString("specs"),
	        			 Double.parseDouble(rs.getString("price")),
	        			 Integer.parseInt(rs.getString("stock_quantity")),
	        			 rs.getString("description"),
	        			 rs.getString("image_path")
	        			 );
	        	 System.out.println(productId);
	        	 System.out.println(product);
	        	 return product;
	         }
	         return null;
	            
	        } catch (SQLException | ClassNotFoundException e) {
	            e.printStackTrace();
	            return null;
	        }
	}
	
	  /**
     * Searches for products based on a keyword in their name.
     *
     * @param keyword The search keyword to match against product names.
     * @return A list of ProductModel objects whose names match the keyword.
     */
	public List<ProductModel> searchProductsByName(String keyword) {
        String query = "SELECT * FROM product WHERE product_name LIKE ?";
        List<ProductModel> productList = new ArrayList<>();

        try (Connection conn = DbConfig.getDbConnection()) {
        	// Prepare the SQL statement
            PreparedStatement ps = conn.prepareStatement(query);
            // Set the search keyword with wildcard characters for partial matching
            ps.setString(1, "%" + keyword + "%"); 
            // Execute the query
            ResultSet rs = ps.executeQuery();
            // Process each result row and map to ProductModel
            while (rs.next()) {
                ProductModel product = new ProductModel(
                    rs.getString("product_name"),
                    rs.getString("brand"),
                    rs.getString("model"),
                    rs.getString("specs"),
                    Double.parseDouble(rs.getString("price")),
                    Integer.parseInt(rs.getString("stock_quantity")),
                    rs.getString("description"),
                    rs.getString("image_path")
                );
                // Add the product to the result list
                productList.add(product);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Print exception if any occurs
        }
        // Return the list of matching products
        return productList;
    }
}
