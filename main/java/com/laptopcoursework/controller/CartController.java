package com.laptopcoursework.controller;

import com.laptopcoursework.config.DbConfig;
import com.laptopcoursework.model.CartItemModel;
import com.laptopcoursework.model.UserModel;
import com.laptopcoursework.service.DeleteProductService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart")
public class CartController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        UserModel user = (UserModel) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        //removing out of stock from cart
        DeleteProductService deleteService = new DeleteProductService();
        boolean removed = deleteService.removeOutOfStockItemsFromCart(user.getUser_id());
        if (removed) {
            request.setAttribute("outOfStockRemoved", true);
        }

        List<CartItemModel> cartItems = new ArrayList<>();
        try (Connection conn = DbConfig.getDbConnection()) {
            int cartId = getCartId(conn, user.getUsername());
            
            if (cartId == -1) {
                request.setAttribute("cartItems", cartItems); // empty list
                request.setAttribute("total_amount", 0.0);
                request.getRequestDispatcher("/WEB-INF/pages/cart.jsp").forward(request, response);
                return;
            }

            // Fetch all cart items for the user
            String sql = "SELECT p.product_id, p.product_name, p.description, p.image_path, p.specs, p.model, p.price, cp.quantity " +
                         "FROM cart_product cp " +
                         "JOIN product p ON cp.product_id = p.product_id " +
                         "WHERE cp.cart_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, cartId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                CartItemModel item = new CartItemModel();
                item.setProductId(rs.getInt("product_id"));
                item.setName(rs.getString("product_name"));
                item.setDescription(rs.getString("description"));
                item.setImagePath(rs.getString("image_path"));
                item.setSpecs(rs.getString("specs"));
                item.setModel(rs.getString("model"));
                item.setPrice(rs.getDouble("price"));
                item.setQuantity(rs.getInt("quantity"));
                cartItems.add(item);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching cart items");
            //request.getRequestDispatcher("/WEB-INF/pages/cart.jsp").forward(request, response);
        }

        // Set the cart items as a request attribute
        
        session.setAttribute("cartItems", cartItems);
        double totalAmount = cartItems.stream().map(c -> c.getPrice()*c.getQuantity()).count();
        request.setAttribute("total_amount", totalAmount);

        // Forward to the cart JSP page
        request.getRequestDispatcher("/WEB-INF/pages/cart.jsp").forward(request, response);
    }

    private int getCartId(Connection conn, String username) throws SQLException {
        String sql = "SELECT cart_id FROM cart WHERE username = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return rs.getInt("cart_id");
        } else {
        	return -1;
            //throw new SQLException("Cart not found for user: " + username);
            
        }
    }

}
