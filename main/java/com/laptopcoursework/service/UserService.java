package com.laptopcoursework.service;

import com.laptopcoursework.config.DbConfig;
import com.laptopcoursework.model.UserModel;

import java.sql.*;

public class UserService {

    public UserModel getUserById(int userId) {
        String query = "SELECT * FROM user WHERE user_id = ?";
        try (Connection connection = DbConfig.getDbConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, userId);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                UserModel user = new UserModel();
                user.setUser_id(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setUser_email(rs.getString("user_email"));
                user.setUser_phone(rs.getString("user_phone"));
                user.setUser_address(rs.getString("user_address"));
                user.setImageUrl(rs.getString("image_path"));
                return user;
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
}
