package com.laptopcoursework.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import com.laptopcoursework.model.ProductModel;
import com.laptopcoursework.service.AddProductService;
import com.laptopcoursework.util.RedirectionUtil;

@WebServlet("/add-product")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,    // 2MB Megabyte
    maxFileSize = 1024 * 1024 * 10,         // 10MB
    maxRequestSize = 1024 * 1024 * 50       // 50MB
)
public class AddProductController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AddProductService addProductService;
    private RedirectionUtil redirectionUtil;

    public void init() throws ServletException {
        this.addProductService = new AddProductService();
        this.redirectionUtil = new RedirectionUtil();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/add-product.jsp").forward(request, response);
    }

    //post method
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // Handle image upload
            String imagePath = handleImageUpload(request);
            
            // Creating product model
            ProductModel product = new ProductModel(
                request.getParameter("product_name"),
                request.getParameter("brand"),
                request.getParameter("model"),
                request.getParameter("specs"),
                Double.parseDouble(request.getParameter("price")),
                Integer.parseInt(request.getParameter("stock_quantity")),
                request.getParameter("description"),
                imagePath
            );
            
            // Adding to database
            boolean isAdded = addProductService.addProduct(product);
            
            if (isAdded) {
                request.getSession().setAttribute("success", "Product added successfully");
                response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            } else {
                request.getSession().setAttribute("error", "Failed to add product");
                response.sendRedirect(request.getContextPath() + "/add-product");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("error", "Error adding product: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/add-product");
        }
    }

    private String handleImageUpload(HttpServletRequest request) 
            throws IOException, ServletException {
        Part filePart = request.getPart("product_image");
        if (filePart == null || filePart.getSize() == 0) {
            throw new ServletException("Product image is required");
        }

        String uploadPath = request.getServletContext().getRealPath("/images/products");
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        
        String product_name = request.getParameter("product_name");
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        String fileName = product_name + "_" + brand + "_" + model + "_Photo" + getFileExtension(filePart.getSubmittedFileName());
        filePart.write(uploadPath + File.separator + fileName);
        
        return "images/products/" + fileName;
    }
    
    private String getFileExtension(String fileName) {
        return fileName == null || !fileName.contains(".") ? 
               ".png" : fileName.substring(fileName.lastIndexOf("."));
    }
}