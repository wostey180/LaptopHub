<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>LaptopHub - Home</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/home.css" />
  <link rel="stylesheet"  href="<%= request.getContextPath() %>/css/style.css" />
  <!-- <link rel="stylesheet" href="<%= request.getContextPath() %>/css/products.css" /> -->
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
        
        <!-- Product 1 -->
        <div class="product-card">
            <div class="product-image">
              <img src="${pageContext.request.contextPath}/images/products/laptop1.png" alt="Gaming Laptop">
              <span class="badge">New</span> <!-- Badge -->
            </div>
            <div class="product-info">
              <div class="product-category">Gaming</div>
              <h3 class="product-title">Ultra Gaming Pro X15</h3>
              <div class="product-price">$1,299.99</div>
              <a href="products_expanded" class="product-button">View Details</a>
            </div>
          </div>
          
  
        <!-- Product 2 -->
        <div class="product-card">
          <div class="product-image">
            <img src="${pageContext.request.contextPath}/images/products/laptop1.png" alt="Business Laptop">
            <span class="badge">New</span> <!-- Badge -->
          </div>
          <div class="product-info">
            <div class="product-category">Business</div>
            <h3 class="product-title">EliteBook Pro 14"</h3>
            <div class="product-price">$999.99</div>
            <a href="products_expanded" class="product-button">View Details</a>
          </div>
        </div>
  
        <!-- Product 3 -->
        <div class="product-card">
          <div class="product-image">
            <img src="${pageContext.request.contextPath}/images/products/laptop1.png" alt="Ultrabook">
            <span class="badge">New</span> <!-- Badge -->
          </div>
          <div class="product-info">
            <div class="product-category">Ultrabook</div>
            <h3 class="product-title">SlimAir S13</h3>
            <div class="product-price">$1,099.99</div>
            <a href="products_expanded" class="product-button">View Details</a>
          </div>
        </div>
  
        <!-- Product 4 -->
        <div class="product-card">
          <div class="product-image">
            <img src="${pageContext.request.contextPath}/images/products/laptop1.png" alt="Student Laptop">
            <span class="badge">New</span> <!-- Badge -->
          </div>
          <div class="product-info">
            <div class="product-category">Student</div>
            <h3 class="product-title">EduBook 15.6"</h3>
            <div class="product-price">$699.99</div>
            <a href="products_expanded" class="product-button">View Details</a>
          </div>
        </div>
  
        <!-- Product 5 -->
        <div class="product-card">
          <div class="product-image">
            <img src="${pageContext.request.contextPath}/images/products/laptop1.png" alt="Creator Laptop">
            <span class="badge">New</span> <!-- Badge -->
          </div>
          <div class="product-info">
            <div class="product-category">Creator</div>
            <h3 class="product-title">CreatorStudio 17"</h3>
            <div class="product-price">$1,499.99</div>
            <a href="products_expanded" class="product-button">View Details</a>
          </div>
        </div>
  
        <!-- Product 6 -->
        <div class="product-card">
          <div class="product-image">
            <img src="${pageContext.request.contextPath}/images/products/laptop1.png" alt="Convertible Laptop">
            <span class="badge">New</span> <!-- Badge -->
          </div>
          <div class="product-info">
            <div class="product-category">Convertible</div>
            <h3 class="product-title">FlexBook 360</h3>
            <div class="product-price">$849.99</div>
            <a href="products_expanded" class="product-button">View Details</a>
          </div>
        </div>
  
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