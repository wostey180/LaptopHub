package com.laptopcoursework.model;

import java.util.Date;

public class OrderModel {
    private int order_id;
    private Date order_date;
    private double total_amount;
    private String status;
    private int user_id;
    private UserModel user;  

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
}
