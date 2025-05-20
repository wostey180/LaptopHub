<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Products - Laptop Hub</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manage-product.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo/logo1.png" type="image/png">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="header.jsp" />

    <main class="manage-main">
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
	                    <li><a href="${pageContext.request.contextPath}/admin/dashboard"><i class="fas fa-tachometer-alt"></i>Dashboard</a></li>
	                </ul>
	            </nav>
	            
	            <nav>
	                <ul class="admin-nav">
	                    <li><a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-in-alt"></i> Logout</a></li>
	                    <li><a href="${pageContext.request.contextPath}/profile"><i class="fas fa-user"></i> Profile</a></li>
	                </ul>
	            </nav>
        	</aside>
        <div class="manage-container">
        	
            <div class="manage-header">
                <h2>Manage Products</h2>
                <a href="${pageContext.request.contextPath}/add-product" class="action-btn edit-btn">+ Add New Product</a>
            </div>

            <c:if test="${not empty error}">
                <div class="alert alert-error">${error}</div>
            </c:if>
            <c:if test="${not empty success}">
                <div class="alert alert-success">${success}</div>
            </c:if>
			<c:if test="${empty products}">
    <p>No products found.</p>
</c:if>
			
            <table class="manage-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Brand</th>
                        <th>Model</th>
                        <th>Specs</th>
                        <th>Price</th>
                        <th>Stock</th>
                        <th>Description</th>
                        <th>Image</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${products}">
                        <tr>
                            <td>${product.product_id}</td>
                            <td>${product.product_name}</td>
                            <td>${product.brand}</td>
                            <td>${product.model}</td>
                            <td>${product.specs}</td>
                            <td>${product.price}</td>
                            <td>${product.stock_quantity}</td>
                            <td>${product.description}</td>
                            <td>
                                <img src="${pageContext.request.contextPath}/${product.image_path}" alt="Product Image"
                                     onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/default-product.png'">
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/update-product?product_id=${product.product_id}" 
                                   class="action-btn edit-btn">Edit</a>
                                <a href="${pageContext.request.contextPath}/admin/delete-product?product_id=${product.product_id}" 
                                   class="action-btn delete-btn" onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </main>

    <jsp:include page="footer.jsp" />
</body>
</html>
