package com.laptopcoursework.model;

import java.util.Date;
import java.util.List;

public class OrderModel {
    private int order_id;
    private Date order_date;
    private double total_amount;
    private String status;
    private int user_id;
    private UserModel user;  
    
    private List<OrderItem> items;

    public OrderModel() {
    }

    public OrderModel(int order_id, Date order_date, double total_amount, String status, int user_id) {
        this.order_id = order_id;
        this.order_date = order_date;
        this.total_amount = total_amount;
        this.status = status;
        this.user_id = user_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public double getTotal_amount() {
        return total_amount;
    }

    public void setTotal_amount(double total_amount) {
        this.total_amount = total_amount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public UserModel getUser() {
        return user;
    }

    public void setUser(UserModel user) {
        this.user = user;
    }
    
    public List<OrderItem> getItems() {
        return items;
    }
    
    public void setItems(List<OrderItem> items) {
        this.items = items;
    }
    
    public static class OrderItem {
        private int product_id;
        private String product_name;
        private String image_path;
        private double price_at_purchase;
        private int quantity_ordered;

        // Getters and setters
        public int getProduct_id() {
            return product_id;
        }

        public void setProduct_id(int product_id) {
            this.product_id = product_id;
        }

        public String getProduct_name() {
            return product_name;
        }

        public void setProduct_name(String product_name) {
            this.product_name = product_name;
        }

        public String getImage_path() {
            return image_path;
        }

        public void setImage_path(String image_path) {
            this.image_path = image_path;
        }

        public double getPrice_at_purchase() {
            return price_at_purchase;
        }

        public void setPrice_at_purchase(double price_at_purchase) {
            this.price_at_purchase = price_at_purchase;
        }

        public int getQuantity_ordered() {
            return quantity_ordered;
        }

        public void setQuantity_ordered(int quantity_ordered) {
            this.quantity_ordered = quantity_ordered;
        }
    }
}
