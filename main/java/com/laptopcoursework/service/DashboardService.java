package com.laptopcoursework.service;

import com.laptopcoursework.config.DbConfig;
import com.laptopcoursework.model.UserModel;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DashboardService {

    public List<UserModel> getAllUsers() {
        List<UserModel> users = new ArrayList<>();
        String query = "SELECT * FROM user";  // Update if your actual table name is different

        try (Connection connection = DbConfig.getDbConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet rs = statement.executeQuery()) {

            System.out.println("Executing user fetch query...");
            

            while (rs.next()) {

                UserModel user = new UserModel();
                user.setUser_id( rs.getInt("user_id"));
                user.setUser_email(rs.getString("user_email"));
                user.setUser_phone(rs.getString("user_phone"));
                user.setUser_password(rs.getString("user_password"));
                user.setUser_address(rs.getString("user_address"));
                user.setUsername(rs.getString("username"));
                users.add(user);
            }

            System.out.println("Fetched " + users.size() + " users.");
            return users;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }
}
