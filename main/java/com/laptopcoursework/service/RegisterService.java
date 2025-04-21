package com.laptopcoursework.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.laptopcoursework.config.DbConfig;
import com.laptopcoursework.model.UserModel;

public class RegisterService {
    private Connection dbConn;
    
    public RegisterService() {
        try {
            this.dbConn = DbConfig.getDbConnection();
            if (this.dbConn == null) {
                throw new RuntimeException("Failed to establish database connection");
            }
        } catch(Exception ex) {
            throw new RuntimeException("Database initialization failed", ex);
        }
    }
    
    public boolean addUser(UserModel userModel) {
        if (userModel == null) {
            System.err.println("UserModel is null");
            return false;
        }

        String sql = "INSERT INTO user(username, user_email, user_password, user_address, user_phone, image_path) " +
                    "VALUES (?, ?, ?, ?, ?, ?)";
        
        try (PreparedStatement stmt = dbConn.prepareStatement(sql)) {
            stmt.setString(1, userModel.getUsername());
            stmt.setString(2, userModel.getUser_email());
            stmt.setString(3, userModel.getUser_password());
            stmt.setString(4, userModel.getUser_address());
            stmt.setString(5, userModel.getUser_phone());
            stmt.setString(6, userModel.getImageUrl());
            
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected <= 0) {
                System.err.println("No rows affected by insert");
            }
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println("SQL Error during registration:");
            System.err.println("Error Code: " + e.getErrorCode());
            System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Message: " + e.getMessage());
            return false;
        }
    }
    
    public boolean isUsernameTaken(String username) {
        if (username == null || username.trim().isEmpty()) {
            return false;
        }

        String sql = "SELECT username FROM user WHERE username = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(sql)) {
            stmt.setString(1, username);
            return stmt.executeQuery().next();
        } catch (SQLException e) {
            System.err.println("Error checking username availability");
            return false;
        }
    }
}