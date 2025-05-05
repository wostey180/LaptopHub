package com.laptopcoursework.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.laptopcoursework.config.DbConfig;
import com.laptopcoursework.model.UserModel;

public class UpdateProfileService {
    private Connection dbConn;

    public UpdateProfileService() {
        try {
            this.dbConn = DbConfig.getDbConnection();
        } catch (Exception e) {
            throw new RuntimeException("Database connection failed", e);
        }
    }

    public boolean updateUser(UserModel userModel) {
        if (userModel == null) {
            return false;
        }

        String sql = "UPDATE user SET user_email = ?, user_password = ?, user_address = ?, user_phone = ?, image_path = ? WHERE username = ?";

        try (PreparedStatement stmt = dbConn.prepareStatement(sql)) {
            stmt.setString(1, userModel.getUser_email());
            stmt.setString(2, userModel.getUser_password());
            stmt.setString(3, userModel.getUser_address());
            stmt.setString(4, userModel.getUser_phone());
            stmt.setString(5, userModel.getImageUrl());
            stmt.setString(6, userModel.getUsername());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Profile update SQL Error: " + e.getMessage());
            return false;
        }
    }
}
