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
 * SearchBarController handles search requests from the user.
 * It fetches products based on the keyword entered in the search bar
 * and forwards the results to the search-result JSP page.
 */
@WebServlet("/SearchBarController")
public class SearchBarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// Service class to handle product-related operations
    private final ProductService productService = new ProductService();

    /**
     * Default constructor for SearchBarController.
     */
    public SearchBarController() {
        super();
    }
    /**
     * Handles GET requests for searching products.
     *
     * @param request  The HttpServletRequest object containing client request data.
     * @param response The HttpServletResponse object for sending responses back to the client.
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	// Get the search keyword from the request
    	String searchQuery = request.getParameter("search");
    	// Retrieve matching products using the service layer
    	List<ProductModel> products = productService.searchProductsByName(searchQuery);
    	// Set attributes to pass data to the JSP
    	request.setAttribute("products", products);
    	request.setAttribute("query", searchQuery);
    	// Forward to the search results page
    	request.getRequestDispatcher("/WEB-INF/pages/search-result.jsp").forward(request, response);
    }
}
