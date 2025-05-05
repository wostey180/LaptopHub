package com.laptopcoursework.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter("/admin/*")
public class AdminFilter implements Filter {
    
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);
        
        // Check if user is logged in and is admin
        if (session == null || session.getAttribute("userRole") == null || 
            !"admin".equals(session.getAttribute("userRole"))) {
            
            // Redirect to access denied or home page
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/access-denied");
            return;
        }
        
        
        
        // User is admin, continue to requested admin page
        chain.doFilter(request, response);
    }
    
    // init() and destroy() methods can remain empty
}