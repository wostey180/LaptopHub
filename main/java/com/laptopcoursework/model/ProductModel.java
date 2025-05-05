package com.laptopcoursework.model;

public class ProductModel {
    private int product_id;
    private String product_name;
    private String brand;
    private String model;
    private String specs;
    private double price;
    private int stock_quantity;
    private String description;
    private String image_path;

    // Constructors
    public ProductModel() {}

    public ProductModel(String product_name, String brand, String model, 
                      String specs, double price, int stock_quantity, 
                      String description, String image_path) {
        this.product_name = product_name;
        this.brand = brand;
        this.model = model;
        this.specs = specs;
        this.price = price;
        this.stock_quantity = stock_quantity;
        this.description = description;
        this.image_path = image_path;
    }
    
    public ProductModel(int product_id, String product_name, String brand, String model,
            String specs, double price, int stock_quantity,
            String description, String image_path) {
			this.product_id = product_id;
			this.product_name = product_name;
			this.brand = brand;
			this.model = model;
			this.specs = specs;
			this.price = price;
			this.stock_quantity = stock_quantity;
			this.description = description;
			this.image_path = image_path;
	}

    // Getters and Setters
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
    public String getBrand() {
        return brand;
    }
    public void setBrand(String brand) {
        this.brand = brand;
    }
    public String getModel() {
        return model;
    }
    public void setModel(String model) {
        this.model = model;
    }
    public String getSpecs() {
        return specs;
    }
    public void setSpecs(String specs) {
        this.specs = specs;
    }
    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }
    public int getStock_quantity() {
        return stock_quantity;
    }
    public void setStock_quantity(int stock_quantity) {
        this.stock_quantity = stock_quantity;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getImage_path() {
        return image_path;
    }
    public void setImage_path(String image_path) {
        this.image_path = image_path;
    }
}