package com.laptopcoursework.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.laptopcoursework.service.ViewProductService;


@WebServlet(asyncSupported = true, urlPatterns = { "/products" })
public class ViewProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("i am here!");
		ViewProductService viewProducts = new ViewProductService();
		
		List<?> allProducts = viewProducts.getAllProducts();
		System.out.println(allProducts);
		
		request.setAttribute("products", allProducts);
		request.getRequestDispatcher("/WEB-INF/pages/products.jsp").forward(request, response);
	}


}
