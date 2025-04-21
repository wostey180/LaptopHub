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
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/products.css" />
  <link rel="icon" href="${pageContext.request.contextPath}/images/logo/logo1.png" type="image/png">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
  <script>
        window.onload = function() {
            <% if (request.getAttribute("showLoginSuccess") != null && (Boolean)request.getAttribute("showLoginSuccess")) { %>
                alert("Logged in successfully!");
            <% } %>
        };
    </script>
</head>
<body>
  <jsp:include page="header.jsp" />
  <main>
    <h2 class="section-title"></h2>
    <section class="home-hero">
        <div class="hero-image-container">
          <img src="./images/banners/welcomeimg.png" alt="Welcome to Laptop" class="hero-image">
        </div>
      </section>

    <h2 class="section-title">FEATURED PRODUCTS</h2>
    <% if (session.getAttribute("username") != null) { %>
            <p>Hello, <%= session.getAttribute("username") %>! <a href="${pageContext.request.contextPath}/logout"> Logout</a></p>
        <% } %>

    <section class="product-grid"> <!-- 1st row-->
        <div class="product-card">
          <a href="${pageContext.request.contextPath}/products_expanded" class="product-link">
            <img src="./images/products/laptop1.png" alt="Laptop 1" />
            <p class="product-title">HP Pavilion 15</p>
            <p class="product-price">Rs. 87,000</p>
            <button>Add to cart</button>
          </a>
        </div>
  
        <div class="product-card">
          <a href="${pageContext.request.contextPath}/products_expanded" class="product-link">
            <img src="./images/products/laptop1.png" alt="Laptop 2" />
            <p class="product-title">Dell Inspiron 14</p>
            <p class="product-price">Rs. 1,04,990</p>
            <button>Add to cart</button>
          </a>
        </div>
  
        <div class="product-card">
          <a href="${pageContext.request.contextPath}/products_expanded" class="product-link">
            <img src="./images/products/laptop2.png" alt="Laptop 3" />
            <p class="product-title">Lenovo IdeaPad 5</p>
            <p class="product-price">Rs. 74,990</p>
            <button>Add to cart</button>
          </a>
        </div>
  
        <div class="product-card">
          <a href="${pageContext.request.contextPath}/products_expanded" class="product-link">
            <img src="./images/products/laptop1.png" alt="Laptop 4" />
            <p class="product-title">Asus VivoBook</p>
            <p class="product-price">Rs. 99,999</p>
            <button>Add to cart</button>
          </a>
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