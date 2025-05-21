<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Add Product | LaptopHub</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/add-product.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin.css" />
    <link rel="stylesheet"  href="<%= request.getContextPath() %>/css/style.css" />
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo/logo1.png" type="image/png">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }
        .form-actions {
            grid-column: span 2;
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <main class="add-product-main">
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
        <div class="add-product-container">
            <h2>Add Product</h2>
            <% if (session.getAttribute("error") != null) { %>
                <div class="error-message">
                    <%= session.getAttribute("error") %>
                </div>
                <% session.removeAttribute("error"); %>
            <% } %>
            <form action="${pageContext.request.contextPath}/add-product" method="post" enctype="multipart/form-data">
                <div class="form-grid">
                    <!-- Left Column -->
                    <div class="form-group">
                        <label for="product_name">Product Name:</label>
                        <input type="text" id="product_name" name="product_name" required/>
                    </div>

                    <div class="form-group">
                        <label for="brand">Brand:</label>
                        <input type="text" id="brand" name="brand" required/>
                    </div>

                    <div class="form-group">
                        <label for="model">Model:</label>
                        <input type="text" id="model" name="model" required/>
                    </div>

                    <div class="form-group">
                        <label for="price">Price:</label>
                        <input type="number" id="price" name="price" step="0.01" required/>
                    </div>

                    <!-- Right Column -->
                    <div class="form-group">
                        <label for="stock_quantity">Stock Quantity:</label>
                        <input type="number" id="stock_quantity" name="stock_quantity" required/>
                    </div>

                    <div class="form-group">
                        <label for="specs">Specifications:</label>
                        <textarea id="specs" name="specs" rows="3" required></textarea>
                    </div>

                    <div class="form-group">
                        <label for="description">Description:</label>
                        <textarea id="description" name="description" rows="3" required></textarea>
                    </div>

                    <div class="form-group">
                        <label for="product_image">Product Image:</label>
                        <input type="file" id="product_image" name="product_image" accept="image/*" required>
                    </div>

                    <!-- Form Actions -->
                    <div class="form-actions">
                        <button type="submit" class="add-product-button">Add Product</button>
                        <a href="<%= request.getContextPath() %>/admin/dashboard" class="add-product-cancel">Cancel</a>
                    </div>
                </div>
            </form>
        </div>
    </main>
    <jsp:include page="footer.jsp" />
</body>
</html>