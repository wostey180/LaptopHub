package com.laptopcoursework.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import com.laptopcoursework.model.UserModel;
import com.laptopcoursework.service.RegisterService;
import com.laptopcoursework.util.PasswordUtil;
import com.laptopcoursework.util.RedirectionUtil;

@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,    // 2MB
    maxFileSize = 1024 * 1024 * 10,         // 10MB
    maxRequestSize = 1024 * 1024 * 50       // 50MB
)
public class RegisterController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private RegisterService registerService;
    private RedirectionUtil redirectionUtil;

    public void init() throws ServletException {
        this.registerService = new RegisterService();   
        this.redirectionUtil = new RedirectionUtil();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            if (username == null || username.trim().isEmpty()) {
                setErrorAndRedirect(request, response, "Username is required");
                return;
            }

            if (registerService.isUsernameTaken(username)) {
                setErrorAndRedirect(request, response, "Username is already taken");
                return;
            }
            String password = request.getParameter("password");
            if (password == null || password.trim().isEmpty()) {
                setErrorAndRedirect(request, response, "password is required");
                return;
            }
            //Password encryption
            password = PasswordUtil.encrypt(username, password);

            String imagePath = handleImageUpload(request, username);

            UserModel userModel = createUserModel(request, username, imagePath,password);
            boolean isAdded = registerService.addUser(userModel);

            if (isAdded) {
                redirectionUtil.setMsgAndRedirect(request, response, "success", 
                    "Registration successful!", RedirectionUtil.loginUrl);
            } else {
                setErrorAndRedirect(request, response, "Registration failed. Please try again");
            }
        } catch (Exception e) {
            e.printStackTrace();
            setErrorAndRedirect(request, response, "System error during registration");
        }
    }

    private String handleImageUpload(HttpServletRequest request, String username) 
            throws IOException, ServletException {
        Part filePart = request.getPart("userImage");
        if (filePart == null || filePart.getSize() == 0) {
            return "images/userimgs/default.png";
        }
        

        String uploadPath = request.getServletContext().getRealPath("/images/userimgs");
        
        System.out.println("Upload path: " + uploadPath);
        
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
        	uploadDir.mkdirs();
        }

        String fileName = username + "_Photo" + getFileExtension(filePart.getSubmittedFileName());

        filePart.write(uploadPath + File.separator + fileName);
        
        return "images/userimgs/" + fileName;
        
    }

    private UserModel createUserModel(HttpServletRequest request, String username, String imagePath, String password) {
    	
    	
    	
        return new UserModel(
            username,
            request.getParameter("email"),
            password,
            request.getParameter("address"),
            request.getParameter("phone"),
            imagePath
        );
    }
    

    private String getFileExtension(String fileName) {
        return fileName == null || !fileName.contains(".") ? 
               ".png" : fileName.substring(fileName.lastIndexOf("."));
    }

    private void setErrorAndRedirect(HttpServletRequest request, 
                                   HttpServletResponse response, 
                                   String message) throws IOException {
        request.getSession().setAttribute("error", message);
        response.sendRedirect(request.getContextPath() + RedirectionUtil.registerUrl);
    }
}