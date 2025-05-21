package com.laptopcoursework.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.laptopcoursework.config.DbConfig;
import com.laptopcoursework.model.UserModel;


@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	request.getSession().removeAttribute("error");
        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String inputPassword = request.getParameter("password");
        
        //validation
        if (username == null || username.trim().isEmpty() || username.contains(" ")) {
            request.setAttribute("error", "Username is empty.");
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
            return;
        }

        if (inputPassword == null || inputPassword.trim().isEmpty()) {
            request.setAttribute("error", "Password is empty.");
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
            return;
        }
        
        try (Connection conn = DbConfig.getDbConnection()) {
            String sql = "SELECT * FROM user WHERE username = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            
            
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
            	
            	String encryptedPassword = rs.getString("user_password");
            	String decryptedPassword = com.laptopcoursework.util.PasswordUtil.decrypt(encryptedPassword, username);
            	//System.out.print(decryptedPassword);
            	
            	if (decryptedPassword != null && decryptedPassword.equals(inputPassword)) {
            		
        		UserModel loggedInUser = new UserModel(
        				Integer.parseInt(rs.getString("user_id")),
                        username,
                        rs.getString("user_email"),
                        rs.getString("user_password"),  
                        rs.getString("user_address"),
                        rs.getString("user_phone"),
                        rs.getString("image_path"),
                        rs.getString("user_role")
                    );
        		
            	// Create session
                HttpSession session = request.getSession();
                session.setAttribute("user", loggedInUser);
                
                session.setAttribute("username", username);
                session.setAttribute("email", rs.getString("user_email"));
                session.setAttribute("address", rs.getString("user_address"));
                session.setAttribute("phone", rs.getString("user_phone"));
                session.setAttribute("imageUrl", rs.getString("image_path"));
                session.setAttribute("userRole", rs.getString("user_role"));
                session.setAttribute("userId", Integer.parseInt(rs.getString("user_id")));
                
                //Role-based redirection
                String role = rs.getString("user_role");
                if ("admin".equalsIgnoreCase(role)) {
                    response.sendRedirect("admin/dashboard");
                } else {
                    response.sendRedirect(request.getContextPath() + "/home");
                }
                
                // Set JavaScript alert flag
                //request.setAttribute("showLoginSuccess", true);
                
                // Forward to home page with alert
               // request.getRequestDispatcher("/WEB-INF/pages/home.jsp").forward(request, response);
            	}
            	else {
            		request.setAttribute("error", "Invalid username or password");
                    request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
            	}
            } else {
                request.setAttribute("error", "Invalid username or password");
                request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error occurred");
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
        }
    }
    
    
    
    
}