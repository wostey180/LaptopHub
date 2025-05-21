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
import com.laptopcoursework.util.ValidationUtil;


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
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            Part userImagePart = request.getPart("userImage");
            if (username == null || username.trim().isEmpty()) {
                setErrorAndRedirect(request, response, "Username is required");
                return;
            }

            if (registerService.isUsernameTaken(username)) {
                setErrorAndRedirect(request, response, "Username is already taken");
                return;
            }
            
            if (password == null || password.trim().isEmpty()) {
                setErrorAndRedirect(request, response, "password is required");
                return;
            }
            
         // Validations
            if (!ValidationUtil.isValidUsername(username)) {
                setErrorAndRedirect(request, response, "Username must be more than 4 characters, not start with a number, contain no spaces.");
                return;
            }

            if (!ValidationUtil.isValidEmail(email)) {
                setErrorAndRedirect(request, response, "Invalid email format.");
                return;
            }

            if (!ValidationUtil.isValidPassword(password)) {
                setErrorAndRedirect(request, response, "Password must be more than 4 characters.");
                return;
            }

            if (address == null || address.trim().isEmpty()) {
                setErrorAndRedirect(request, response, "Address cannot be empty.");
                return;
            }

            if (!ValidationUtil.isValidPhone(phone)) {
                setErrorAndRedirect(request, response, "Phone must be exactly 10 digits and contain only numbers.");
                return;
            }

            if (!ValidationUtil.isValidImage(userImagePart)) {
                setErrorAndRedirect(request, response, "Invalid image file. Only png, jpg, jpeg, gif under 2MB are allowed.");
                return;
            }
            //Password encryption
            password = PasswordUtil.encrypt(username, password);

            String imagePath = handleImageUpload(request, username);

            UserModel userModel = createUserModel(request, username, imagePath,password);
            boolean isAdded = registerService.addUser(userModel);

            if (isAdded) {
            	request.getSession().setAttribute("user", userModel);
                response.sendRedirect(request.getContextPath() + RedirectionUtil.loginUrl);
            } else {
            	request.getSession().setAttribute("error", "Registration failed. Please try again");
                response.sendRedirect(request.getContextPath() + RedirectionUtil.registerUrl);
            }
        } catch (Exception e) {
            e.printStackTrace();
            setErrorAndRedirect(request, response, "System error during registration");
            response.sendRedirect(request.getContextPath() + RedirectionUtil.registerUrl);
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
            imagePath,
            "user"
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