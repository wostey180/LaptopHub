<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>View Orders | LaptopHub</title>
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

        <!-- Main Content -->
        <main class="orders-main">
            <h2 class="orders-section-title">Orders</h2>

            <div class="orders-table-container">
                <table class="orders-table">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Order Date</th>
                            <th>Total Amount</th>
                            <th>Status</th>
                            <th>Username</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${orders}">
                            <tr>
                                <td>${order.order_id}</td>
                                <td>${order.order_date}</td>
                                <td>${order.total_amount}</td>
                                <td class="orders-status ${order.status}">${order.status}</td>
                                <td>${order.user.username}</td>
                                <td>
                                    <!-- <button class="action-btn view-profile-btn" onclick="window.location.href='${pageContext.request.contextPath}/profile?user_id=${order.user.user_id}'">View Profile</button> -->
                                    
                                    <a href="${pageContext.request.contextPath}/admin/user-profile?user_id=${order.user.user_id}" 
                                   class="action-btn view-profile-btn">View Profile</a>
                                   <button class="action-btn view-order-btn" onclick="window.location.href='${pageContext.request.contextPath}/profile?order_id=${order.order_id}'">Order Details</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</body>
</html>
