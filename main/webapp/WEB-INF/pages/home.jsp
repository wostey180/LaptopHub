<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Home | LaptopHub</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
  <link rel="icon" href="${pageContext.request.contextPath}/images/logo/logo1.png" type="image/png">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
  <jsp:include page="header.jsp" />

  <main>
    <section class="hero">
        <div class="container">
            <h1>Discover Premium Laptops</h1>
            <p>Find the perfect laptop for work, gaming, or everyday use. Premium quality, competitive prices, exceptional service.</p>
            <a href="${pageContext.request.contextPath}/products" class="cta-button">Shop Now <i class="fas fa-arrow-right"></i></a>
        </div>
    </section>

    <!--  <% if (session.getAttribute("username") != null) { %>
            <p>Hello, <%= session.getAttribute("username") %>! <a href="${pageContext.request.contextPath}/logout"> Logout</a></p>
        <% } %>
	-->
	
    <section class="featured">
    <div class="container">
      <h2 class="section-title">Featured Laptops</h2>
      <div class="products-grid">
        <c:set var="count" value="0" />
        <c:forEach var="product" items="${featuredProducts}">
        <c:if test="${count < 3}">
            <div class="product-card">
              <div class="product-image">
                <img src="${pageContext.request.contextPath}/${product.image_path}" alt="${product.product_name}"
                     onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/product.png'">
                <span class="badge">HOT</span>
              </div>
              <div class="product-info">
                <div class="product-category">${product.brand}</div>
                <h3 class="product-title">${product.product_name}</h3>
                <div class="product-price">Rs.${product.price}</div>
                <a href="${pageContext.request.contextPath}/product-details?id=${product.product_id}" class="product-button">View Details</a>
              </div>
            </div>
       	<c:set var="count" value="${count + 1}" />
    	</c:if>
        </c:forEach>
        
  
      </div>
    </div>
  </section> 

    <h2 class="section-title">EXPLORE OUR PAGE</h2>

    <section class="home-links">
      <div class="links-container">
        <a href="#" class="home-link">
            <i class="fas fa-home"></i>
            <span>Home Page</span>
          </a>
        <a href="${pageContext.request.contextPath}/products" class="home-link">
            <i class="fas fa-laptop"></i>
            <span>Product</span>
          </a>
        <a href="${pageContext.request.contextPath}/about" class="home-link">
            <i class="fas fa-info-circle"></i>
            <span>About us</span>
          </a>
        <a href="${pageContext.request.contextPath}/contact" class="home-link">
          <i class="fas fa-envelope"></i>
          <span>Contact Us</span>
        </a>
      </div>
    </section>
  </main>
  <jsp:include page="footer.jsp" />
</body>
</html>