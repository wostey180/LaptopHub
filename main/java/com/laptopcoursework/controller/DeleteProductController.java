package com.laptopcoursework.controller;

import com.laptopcoursework.service.DeleteProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/delete-product")
public class DeleteProductController extends HttpServlet {

    private final DeleteProductService deleteService = new DeleteProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productIdParam = request.getParameter("product_id");
        String message;

        try {
            int productId = Integer.parseInt(productIdParam);
            boolean success = deleteService.deleteProductById(productId);

            if (success) {
                message = "Product deleted successfully.";
                request.getSession().setAttribute("success", message);
            } else {
                message = "Product deletion failed.";
                request.getSession().setAttribute("error", message);
            }
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Invalid product ID.");
        }

        response.sendRedirect(request.getContextPath() + "/admin/manage-product");
    }
}
