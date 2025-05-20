<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>LaptopHub - Products</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/products.css" />
  <link rel="stylesheet"  href="<%= request.getContextPath() %>/css/style.css" />
  <link rel="icon" href="${pageContext.request.contextPath}/images/logo/logo1.png" type="image/png">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
  <style>
    .badge {
      position: absolute;
      top: 10px;
      right: 10px;
      background-color: #4CAF50;
      color: white;
      padding: 4px 8px;
      border-radius: 3px;
      font-size: 12px;
    }
    .sale-badge {
      background-color: #f44336;
    }
    .product-image {
      position: relative;
    }
  </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <section class="page-banner">
      <div class="container">
          <h1>Our Laptops</h1>
          <p>Browse our wide selection of premium laptops for every need</p>
      </div>
    </section>

    <main class="products-page">
      <section class="container">
        <h2><p>&nbsp;<p></h2>
        <% if (session.getAttribute("userRole") != null && session.getAttribute("userRole").equals("admin")) { %>
        <h2 class="admin-title">
  			    <a href="${pageContext.request.contextPath}/admin/add-product" class="admin-button">Add Products</a>
			    <a href="${pageContext.request.contextPath}/admin/manage-product" class="admin-button">Manage Products</a>
	    	
    	 </h2>
    	 <% } %>
        

        <div class="products-grid">
          <c:forEach var="product" items="${products}">
            <div class="product-card">
              <div class="product-image">
                <img src="${pageContext.request.contextPath}/${product.image_path}" 
                     alt="${product.product_name}"
                     onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/product.png'">
              </div>
              <div class="product-info">
                <div class="product-category">${product.brand}</div>
                <h3 class="product-title">${product.product_name}</h3>
                <div class="product-price">$${product.price}</div>
                <a href="${pageContext.request.contextPath}/product-details?id=${product.product_id}" 
                   class="product-button">View Details</a>
              </div>
            </div>
          </c:forEach>
          
          <c:if test="${empty products}">
            <div class="no-products">
              <p>No products available at the moment.</p>
            </div>
          </c:if>
        </div>
        
        <p>&nbsp;</p>
        <hr>
      </section>
    </main>

    <jsp:include page="footer.jsp" />
</body>
</html>