package com.laptopcoursework.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.laptopcoursework.config.DbConfig;
import com.laptopcoursework.model.ProductModel;

public class ViewProductService {

	public List<?> getAllProducts() {
		
		try(Connection conn = DbConfig.getDbConnection()){
			String qurey = "Select * from product";
			PreparedStatement ps = conn.prepareStatement(qurey);
			
			ResultSet rs = ps.executeQuery();
			List<ProductModel> products = new ArrayList();
			while(rs.next()) {
				ProductModel product = new ProductModel();
				product.setProduct_id(Integer.parseInt(rs.getString("product_id")));
				product.setProduct_name(rs.getString("product_name"));
				product.setDescription(rs.getString("description"));
				product.setBrand(rs.getString("brand"));
				product.setModel(rs.getString("model"));
				product.setSpecs(rs.getString("specs"));
				product.setStock_quantity(Integer.parseInt(rs.getString("stock_quantity")));
				product.setPrice(Double.parseDouble(rs.getString("price")));
				product.setImage_path(rs.getString("image_path"));
				products.add(product);
			}
			return products;
			
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
			return null;
		}
	}
	
	public ProductModel getProductById(int productId) {
	    try (Connection conn = DbConfig.getDbConnection()) {
	        String query = "SELECT * FROM product WHERE product_id = ?";
	        PreparedStatement ps = conn.prepareStatement(query);
	        ps.setInt(1, productId);

	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            return new ProductModel(
	                rs.getInt("product_id"),
	                rs.getString("product_name"),
	                rs.getString("brand"),
	                rs.getString("model"),
	                rs.getString("specs"),
	                rs.getDouble("price"),
	                rs.getInt("stock_quantity"),
	                rs.getString("description"),
	                rs.getString("image_path")
	            );
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}


}
