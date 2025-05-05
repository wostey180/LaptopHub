package com.laptopcoursework.controller;

import com.laptopcoursework.model.ProductModel;
import com.laptopcoursework.service.ManageProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/manage-product")
public class ManageProductController extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ManageProductService productService = new ManageProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch products from the service
        List<ProductModel> products = productService.getAllProducts();
        //System.out.println(products);
        
        // Debugging: print the number of products fetched
        System.out.println("Products fetched in controller: " + products.size());

        // Set the product list in the request attribute
        request.setAttribute("products", products);
        
        // Forward the request to the JSP page
        request.getRequestDispatcher("/WEB-INF/pages/manage-product.jsp").forward(request, response);
    }
}
