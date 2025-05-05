package com.laptopcoursework.controller;

import com.laptopcoursework.model.ProductModel;
import com.laptopcoursework.service.ViewProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/product-details")
public class ProductDetailsController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String productIdParam = request.getParameter("id");

        if (productIdParam == null || productIdParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/products");
            return;
        }

        try {
            int productId = Integer.parseInt(productIdParam);

            ViewProductService viewService = new ViewProductService();
            List<ProductModel> allProducts = (List<ProductModel>) viewService.getAllProducts();

            ProductModel selectedProduct = null;

            for (ProductModel product : allProducts) {
                if (product.getProduct_id() == productId) {
                    selectedProduct = product;
                    break;
                }
            }

            if (selectedProduct != null) {
                request.setAttribute("product", selectedProduct);
                request.getRequestDispatcher("/WEB-INF/pages/products_expanded.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/products");
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/products");
        }
    }
}
