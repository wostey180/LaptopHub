package com.laptopcoursework.model;

public class UserModel {
	private int user_id;
	private String username;
	private String user_email;
	private String user_password;
	private String user_address;
	private String user_phone;
	private String imageUrl;
	private String user_role;

	
	private ProductModel product;
	
	//
	public ProductModel getProduct() {
		return product;
	}
	
	public void setProduct(ProductModel product) {
		this.product = product;
	}
	//
	
	public UserModel(String username, String user_password) {
		this.username = username;
		this.user_password = user_password;
		this.user_role = "user";
	}
	
	public UserModel(int user_id, String username, String user_email, String user_password, String user_address,
			String user_phone, String imageUrl, String user_role) {
		super();
		this.user_id = user_id;
		this.username = username;
		this.user_email = user_email;
		this.user_password = user_password;
		this.user_address = user_address;
		this.user_phone = user_phone;
		this.imageUrl = imageUrl;
		this.user_role = user_role;
	
	}
	
	public UserModel(String username, String user_email, String user_password, String user_address,
			String user_phone, String imageUrl, String userRole) {
		this.username = username;
		this.user_email = user_email;
		this.user_password = user_password;
		this.user_address = user_address;
		this.user_phone = user_phone;
		this.imageUrl = imageUrl;
		this.user_role = user_role;
		
	}
	
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getUser_role() {
		return user_role;
	}
	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}
}
	