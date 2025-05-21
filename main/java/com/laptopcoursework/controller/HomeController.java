package com.laptopcoursework.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.laptopcoursework.model.ProductModel;
import com.laptopcoursework.service.ProductService;

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
            request.getRequestDispatcher("/WEB-INF/pages/products.jsp").forward(request, response);
        } 
        else if (path.equals("/products_expanded")) {
            request.getRequestDispatcher("/WEB-INF/pages/products_expanded.jsp").forward(request, response);
            }
        else if (path.equals("/about")) {
            request.getRequestDispatcher("/WEB-INF/pages/about.jsp").forward(request, response);
            }
        else if (path.equals("/admin")) {
            // Forward to products.jsp if the path is "/products"
            request.getRequestDispatcher("/WEB-INF/pages/admin.jsp").forward(request, response);
            }
        else if (path.equals("/admin/add-product")) {
            request.getRequestDispatcher("/WEB-INF/pages/add-product.jsp").forward(request, response);
            }
        else if (path.equals("/admin/update-product")) {
            request.getRequestDispatcher("/WEB-INF/pages/update-product.jsp").forward(request, response);
            }
        else if (path.equals("/admin/dashboard")) {
            request.getRequestDispatcher("/WEB-INF/pages/admin.jsp").forward(request, response);
            }
        else if (path.equals("/admin/manage-product")) {
            request.getRequestDispatcher("/WEB-INF/pages/manage-product.jsp").forward(request, response);
            }
        else if (path.equals("/cart")) {
            request.getRequestDispatcher("/WEB-INF/pages/cart.jsp").forward(request, response);
            }
        else if (path.equals("/contact")) {
            request.getRequestDispatcher("/WEB-INF/pages/contact.jsp").forward(request, response);
            }
        else if (path.equals("/error")) {
            request.getRequestDispatcher("/WEB-INF/pages/error.jsp").forward(request, response);
            }
        else if (path.equals("/profile")) {
            // Forward to products.jsp if the path is "/products"
            request.getRequestDispatcher("/WEB-INF/pages/profile.jsp").forward(request, response);
            }
        else if (path.equals("/access-denied")) {
            request.getRequestDispatcher("/WEB-INF/pages/access-denied.jsp").forward(request, response);
            }
        else if (path.equals("/order-success")) {
            request.getRequestDispatcher("/WEB-INF/pages/order-success.jsp").forward(request, response);
            }
        
        else if (path.equals("/home")) {
            // Forward to products.jsp if the path is "/products"
        	ProductService productService = new ProductService();
        	List<ProductModel> featuredProducts = productService.getInStockProducts();
        	request.setAttribute("featuredProducts", featuredProducts);
            request.getRequestDispatcher("/WEB-INF/pages/home.jsp").forward(request, response);
            }
        else if (path.equals("/")) {
        	ProductService productService = new ProductService();
        	List<ProductModel> featuredProducts = productService.getInStockProducts();
        	request.setAttribute("featuredProducts", featuredProducts);
            request.getRequestDispatcher("/WEB-INF/pages/home.jsp").forward(request, response);
            }
        else {
            // Default: Forward to home.jsp for "/home" or "/"
            request.getRequestDispatcher("/WEB-INF/pages/error.jsp").forward(request, response);
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
