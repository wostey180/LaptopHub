package com.laptopcoursework.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.util.List;

import com.laptopcoursework.config.DbConfig;
import com.laptopcoursework.model.ProductModel;
import com.laptopcoursework.service.ProductService;
import com.laptopcoursework.service.UpdateProductService;
import com.laptopcoursework.util.RedirectionUtil;

@WebServlet(urlPatterns = { "/admin/update-product" })
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
public class UpdateProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UpdateProductService updateProductService;

    public void init() throws ServletException {
        this.updateProductService = new UpdateProductService();
    }
    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	if(request.getParameter("product_id") == null) {
    		request.getRequestDispatcher("/WEB-INF/pages/admin.jsp").forward(request, response);
    	}
    	int productId= Integer.parseInt(request.getParameter("product_id"));
    	ProductService productService = new ProductService();
    	
    	ProductModel product = productService.getProductById(productId);
    	product.setProduct_id(productId);
    	request.setAttribute("product_info", product);
        request.getRequestDispatcher("/WEB-INF/pages/update-product.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(request.getParameter("product_id"));
            String productName = request.getParameter("product_name");
            String brand = request.getParameter("brand");
            String model = request.getParameter("model");
            String specs = request.getParameter("specs");
            String description = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));
            int stockQuantity = Integer.parseInt(request.getParameter("stock_quantity"));

            String imagePath = handleImageUpload(request, productId);

            ProductModel updatedProduct = new ProductModel(
                productId, productName, brand, model, specs,
                price, stockQuantity, description, imagePath
            );

            boolean isUpdated = updateProductService.updateProduct(updatedProduct);

            if (isUpdated) {
                response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            } else {
                request.getSession().setAttribute("error", "Product update failed.");
                response.sendRedirect(request.getContextPath() + "/admin/update-product");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("error", "System error during update.");
            response.sendRedirect(request.getContextPath() + "/admin/update-product");
        }
    }

    private String handleImageUpload(HttpServletRequest request, int productId)
            throws IOException, ServletException {
        Part filePart = request.getPart("product_image");
        
        String existingImage = request.getParameter("existing_image");
        
        if (filePart == null || filePart.getSize() == 0) {
            return existingImage;
        }

        String uploadPath = request.getServletContext().getRealPath("/images/products");
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        String fileName = "product_" + productId + getFileExtension(filePart.getSubmittedFileName());
        filePart.write(uploadPath + File.separator + fileName);

        return "images/products/" + fileName;
    }

    private String getFileExtension(String fileName) {
        return fileName == null || !fileName.contains(".")
                ? ".png"
                : fileName.substring(fileName.lastIndexOf("."));
    }
}
