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
    
    public OrderModel getOrderWithItems(int orderId) {
        OrderModel order = null;

        String query = "SELECT o.*, u.username, p.product_id, p.product_name, p.image_path, op.price_at_purchase, op.quantity_ordered " +
                       "FROM orders o " +
                       "JOIN user u ON o.user_id = u.user_id " +
                       "JOIN order_product op ON o.order_id = op.order_id " +
                       "JOIN product p ON op.product_id = p.product_id " +
                       "WHERE o.order_id = ?";

        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();

            List<OrderModel.OrderItem> items = new ArrayList<>();
            order = new OrderModel();

            while (rs.next()) {
                if (order.getOrder_id() == 0) {
                    order.setOrder_id(rs.getInt("order_id"));
                    order.setOrder_date(rs.getDate("order_date"));
                    order.setTotal_amount(rs.getDouble("total_amount"));
                    order.setStatus(rs.getString("status"));

                    UserModel user = new UserModel();
                    user.setUsername(rs.getString("username"));
                    user.setUser_id(rs.getInt("user_id"));
                    order.setUser(user);
                }

                OrderModel.OrderItem item = new OrderModel.OrderItem();
                item.setProduct_id(rs.getInt("product_id"));
                item.setProduct_name(rs.getString("product_name"));
                item.setImage_path(rs.getString("image_path"));
                item.setPrice_at_purchase(rs.getDouble("price_at_purchase"));
                item.setQuantity_ordered(rs.getInt("quantity_ordered"));
                items.add(item);
            }

            order.setItems(items);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return order;
    }
    
    public void updateOrderStatus(int orderId, String newStatus) {
        String query = "UPDATE orders SET status = ? WHERE order_id = ?";

        try (Connection conn = DbConfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            
            stmt.setString(1, newStatus);
            stmt.setInt(2, orderId);
            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
