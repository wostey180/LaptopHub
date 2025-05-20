package com.laptopcoursework.controller;
import com.laptopcoursework.model.CartItemModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import jakarta.servlet.http.HttpSession;
import com.laptopcoursework.service.DeleteProductService;
import com.laptopcoursework.service.ProductService;
/**
 * Servlet implementation class RemoveFromCartController
 */
@WebServlet("/RemoveFromCartController")
public class RemoveFromCartController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    	HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        int userId = (Integer) session.getAttribute("userId");


        String pid = request.getParameter("product_id");
        if (pid == null) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }
        int productId = Integer.parseInt(pid);

        // remove from DB
        DeleteProductService svc = new DeleteProductService();
        svc.removeProductFromCart(userId, productId);

        // redirect back to cart
        response.sendRedirect(request.getContextPath() + "/cart");
    }
}
