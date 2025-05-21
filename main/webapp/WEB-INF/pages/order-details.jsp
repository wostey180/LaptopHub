<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Order Details | LaptopHub</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/orders.css" />
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin.css" />
  <link rel="icon" href="${pageContext.request.contextPath}/images/logo/logo1.png" type="image/png">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
  <jsp:include page="header.jsp" />

  <div class="admin-container">
    <!-- Sidebar -->
        <aside class="admin-sidebar">
            <div class="admin-brand">LaptopHub</div>
            <nav>
                <ul class="admin-nav">
                    <li><a href="${pageContext.request.contextPath}/admin/orders"><i class="fas fa-tachometer-alt"></i> View Orders</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/manage-product"><i class="fas fa-box"></i> Manage Product</a></li>
                </ul>
            </nav>
            
            <nav>
                <ul class="admin-nav">
                    <li><a href="${pageContext.request.contextPath}/admin/add-product"><i class="fas fa-plus"></i>Add Product</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                </ul>
            </nav>
            
            <nav>
                <ul class="admin-nav">
                    <li><a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-in-alt"></i> Logout</a></li>
                    <li><a href="${pageContext.request.contextPath}/profile"><i class="fas fa-user"></i> Profile</a></li>
                </ul>
            </nav>
        </aside>

    <main class="orders-main">
      <h2 class="orders-section-title">Order Details</h2>

		<div class="order-user-info">
    <h3>Ordered By: ${order.user.username}</h3>
    <a href="${pageContext.request.contextPath}/admin/user-profile?user_id=${order.user.user_id}" 
                                   class="action-btn view-profile-btn">View Profile</a>
</div>
		
      <!-- Your order details content here -->
      <div class="orders-table-container">
        <table class="orders-table">
          <thead>
            <tr>
              <th>Product Image</th>
              <th>Product Name</th>
              <th>Product ID</th>
              <th>Price</th>
              <th>Quantity</th>
              <th>Total</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="item" items="${order.items}">
              <tr>
                <td><img src="${pageContext.request.contextPath}/${item.image_path}" alt="${item.product_name}" style="width: 60px; height: auto;"></td>
                <td>${item.product_name}</td>
                <td>${item.product_id}</td>
                <td>Rs. ${item.price_at_purchase}</td>
                <td>${item.quantity_ordered}</td>
                <td>Rs. ${item.price_at_purchase * item.quantity_ordered}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>

      <div style="text-align: center; margin-top: 2rem;">
        <strong>Order Status:</strong>
        <span class="orders-status-${order.status}">${order.status}</span>
      </div>
    </main>
  </div>
  <jsp:include page="footer.jsp" />
</body>
</html>
