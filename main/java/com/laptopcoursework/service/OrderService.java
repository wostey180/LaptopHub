package com.laptopcoursework.service;

import com.laptopcoursework.config.DbConfig;
import com.laptopcoursework.model.OrderModel;
import com.laptopcoursework.model.UserModel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderService {

    public List<OrderModel> getAllOrders() {
        List<OrderModel> orders = new ArrayList<>();
        String query = "SELECT * FROM orders";  // Assuming the table name is 'orders'

        try (Connection connection = DbConfig.getDbConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet rs = statement.executeQuery()) {

            while (rs.next()) {
                int order_id = rs.getInt("order_id");
                Date order_date = rs.getDate("order_date");
                double total_amount = rs.getDouble("total_amount");
                String status = rs.getString("status");
                int user_id = rs.getInt("user_id");

                // Create the OrderModel object
                OrderModel order = new OrderModel(order_id, order_date, total_amount, status, user_id);

                // Now, fetch the associated UserModel
                UserModel user = getUserById(user_id);
                order.setUser(user);

                orders.add(order);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return orders;
    }

    private UserModel getUserById(int userId) {
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
                return user;
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;  // If user not found
    }
}
