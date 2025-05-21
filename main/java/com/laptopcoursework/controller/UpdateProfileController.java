package com.laptopcoursework.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.File;
import java.io.IOException;

import com.laptopcoursework.model.UserModel;
import com.laptopcoursework.service.UpdateProfileService;
import com.laptopcoursework.util.PasswordUtil;
import com.laptopcoursework.util.RedirectionUtil;

@WebServlet(urlPatterns = { "/profile/update-profile" })
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
public class UpdateProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UpdateProfileService updateProfileService;
    private RedirectionUtil redirectionUtil;

    public void init() throws ServletException {
        this.updateProfileService = new UpdateProfileService();
        this.redirectionUtil = new RedirectionUtil();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/update-profile.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            System.out.println("Entered Do Post"); // For debugging
            HttpSession session = request.getSession();
            UserModel currentUser = (UserModel) session.getAttribute("user");

            if (currentUser == null) {
                // User is not logged in
            	System.out.println("User Not Logged in");
                session.setAttribute("error", "User not logged in.");
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            System.out.println("Entered 2nd Part"); // For debugging
            String username = currentUser.getUsername();
            String newEmail = request.getParameter("user_email");
            String newAddress = request.getParameter("user_address");
            String newPhone = request.getParameter("user_phone");
            String currentPasswordInput = request.getParameter("user_current_password");
            String newPassword = request.getParameter("user_new_password");

            

            boolean changePassword = currentPasswordInput != null && !currentPasswordInput.trim().isEmpty()
                    && newPassword != null && !newPassword.trim().isEmpty();

            String updatedPassword = currentUser.getUser_password(); // default = old one

            if (changePassword) {
                // Decrypt the stored password and compare it with the input
                String decryptedCurrentInput = PasswordUtil.decrypt(currentUser.getUser_password(), username);
                System.out.println("Decrypted Current Password: " + decryptedCurrentInput);  // Debugging line

                if (decryptedCurrentInput == null) {
                    session.setAttribute("error", "Decryption failed. Invalid password format.");
                    response.sendRedirect(request.getContextPath() + RedirectionUtil.updateProfileUrl);
                    return;
                }

                if (!decryptedCurrentInput.equals(currentPasswordInput)) {
                    session.setAttribute("error", "Incorrect current password.");
                    response.sendRedirect(request.getContextPath() + RedirectionUtil.updateProfileUrl);
                    return;
                }

                // Encrypt the new password for storage
                updatedPassword = PasswordUtil.encrypt(username, newPassword);
            }
            
            String newImagePath = handleImageUpload(request, username, currentUser.getImageUrl());

            // Create the updated user object
            UserModel updatedUser = new UserModel(
                    username,
                    newEmail,
                    updatedPassword,
                    newAddress,
                    newPhone,
                    newImagePath,
                    currentUser.getUser_role()
            );

            // try update the user profile
            boolean isUpdated = updateProfileService.updateUser(updatedUser);

            if (isUpdated) {
                // Profile updated successfully
                session.setAttribute("user", updatedUser);
                session.setAttribute("email", newEmail);
                session.setAttribute("address", newAddress);
                session.setAttribute("phone", newPhone);
                response.sendRedirect(request.getContextPath() + "/profile");
            } else {
                // Profile update failed
                session.setAttribute("error", "Profile update failed. Try again.");
                response.sendRedirect(request.getContextPath() + RedirectionUtil.updateProfileUrl);
            }
        } catch (Exception e) {
            e.printStackTrace();
            setErrorAndRedirect(request, response, "System error during updating");
            response.sendRedirect(request.getContextPath() + RedirectionUtil.updateProfileUrl);
        }
    }

      
    private String handleImageUpload(HttpServletRequest request, String username, String currentImage)
            throws IOException, ServletException {
        Part filePart = request.getPart("userImage");
        if (filePart == null || filePart.getSize() == 0) {
            return currentImage != null ? currentImage : "images/userimgs/default.png";
        }

        String uploadPath = request.getServletContext().getRealPath("/images/userimgs");
        System.out.println("Updated Upload path: " + uploadPath); //delete debugging
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        String fileName = username + "_Photo" + getFileExtension(filePart.getSubmittedFileName());
        filePart.write(uploadPath + File.separator + fileName);

        return "images/userimgs/" + fileName;
    }

    private String getFileExtension(String fileName) {
        return fileName == null || !fileName.contains(".") ? 
               ".png" : fileName.substring(fileName.lastIndexOf("."));
    }
    
    private void setErrorAndRedirect(HttpServletRequest request, 
            HttpServletResponse response, 
            String message) throws IOException {
			request.getSession().setAttribute("error", message);
			response.sendRedirect(request.getContextPath() + RedirectionUtil.updateProfileUrl);
	}
}
