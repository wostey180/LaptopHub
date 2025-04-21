package com.laptopcoursework.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class HomeController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/home", "/" })
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = request.getServletPath(); // Get the requested path
		
		if (path.startsWith("/images/") || path.startsWith("/css/") || path.startsWith("/js/")) {
            request.getRequestDispatcher(path).forward(request, response);
            return;
        }
        
        if (path.equals("/products")) {
            // Forward to products.jsp if the path is "/products"
            request.getRequestDispatcher("/WEB-INF/pages/products.jsp").forward(request, response);
        } 
        else if (path.equals("/products_expanded")) {
            // Forward to products.jsp if the path is "/products"
            request.getRequestDispatcher("/WEB-INF/pages/products_expanded.jsp").forward(request, response);
            }
        else if (path.equals("/about")) {
            // Forward to products.jsp if the path is "/products"
            request.getRequestDispatcher("/WEB-INF/pages/about.jsp").forward(request, response);
            }
        else if (path.equals("/admin")) {
            // Forward to products.jsp if the path is "/products"
            request.getRequestDispatcher("/WEB-INF/pages/admin.jsp").forward(request, response);
            }
        else if (path.equals("/cart")) {
            // Forward to products.jsp if the path is "/products"
            request.getRequestDispatcher("/WEB-INF/pages/cart.jsp").forward(request, response);
            }
        else if (path.equals("/contact")) {
            // Forward to products.jsp if the path is "/products"
            request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);
            }
        else if (path.equals("/error")) {
            // Forward to products.jsp if the path is "/products"
            request.getRequestDispatcher("/WEB-INF/pages/error.jsp").forward(request, response);
            }
        else if (path.equals("/profile")) {
            // Forward to products.jsp if the path is "/products"
            request.getRequestDispatcher("/WEB-INF/pages/profile.jsp").forward(request, response);
            }
        else if (path.equals("/access-denied")) {
            // Forward to products.jsp if the path is "/products"
            request.getRequestDispatcher("/WEB-INF/pages/access-denied.jsp").forward(request, response);
            }
        else if (path.equals("/home")) {
            // Forward to products.jsp if the path is "/products"
            request.getRequestDispatcher("/WEB-INF/pages/home.jsp").forward(request, response);
            }
        else {
            // Default: Forward to home.jsp for "/home" or "/"
            request.getRequestDispatcher("/WEB-INF/pages/home.jsp").forward(request, response);
        }
        
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
