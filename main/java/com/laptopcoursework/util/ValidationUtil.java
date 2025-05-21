package com.laptopcoursework.util;

import jakarta.servlet.http.Part;

public class ValidationUtil {

    public static boolean isValidUsername(String username) {
        return username != null 
            && username.length() > 4 
            && !username.contains(" ") 
            && !Character.isDigit(username.charAt(0));
    }

    public static boolean isValidEmail(String email) {
        return email != null && email.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$");
    }

    public static boolean isValidPassword(String password) {
        return password != null && password.length() > 4;
    }

    public static boolean isValidPhone(String phone) {
        return phone != null && phone.matches("\\d{10}");
    }

    public static boolean isValidAddress(String address) {
        return address != null && !address.trim().isEmpty();
    }

    public static boolean isValidImage(Part part) {
        if (part == null || part.getSize() == 0) {
            return true; // Optional image upload — defaults to default.png
        }

        long maxSize = 2 * 1024 * 1024; // 2MB
        String fileName = part.getSubmittedFileName();
        String lowerName = fileName.toLowerCase();

        return part.getSize() <= maxSize && (
            lowerName.endsWith(".png") ||
            lowerName.endsWith(".jpg") ||
            lowerName.endsWith(".jpeg") ||
            lowerName.endsWith(".gif")
        );
    }
}
