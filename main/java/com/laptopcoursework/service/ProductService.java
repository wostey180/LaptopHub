package com.laptopcoursework.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.laptopcoursework.config.DbConfig;
import com.laptopcoursework.model.ProductModel;

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
}
