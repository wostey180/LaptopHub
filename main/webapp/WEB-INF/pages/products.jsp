<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
  <jsp:include page="header.jsp" />
  <main>
    <!-- Navbar -->
    <!-- <header>
      
    </header> -->
    
    <!-- Title -->
    <h2 class="section-title">THE BEST PRODUCT</h2>

    <!-- Product Section -->
    <section class="product-grid"> <!-- 1st row-->
      <div class="product-card">
        <a href="<%= request.getContextPath() %>/products_expanded" class="product-link">
          <img src="<%= request.getContextPath() %>/images/products/laptop1.png" alt="Laptop 1" />
          <p class="product-title">HP Pavilion 15</p>
          <p class="product-price">Rs. 99,999</p>
          <button>Add to cart</button>
        </a>
      </div>

      <div class="product-card">
        <a href="<%= request.getContextPath() %>/products_expanded" class="product-link">
          <img src="<%= request.getContextPath() %>/images/products/laptop2.png" alt="Laptop 2" />
          <p class="product-title">Dell Inspiron 14</p>
          <p class="product-price">Rs. 99,999</p>
          <button>Add to cart</button>
        </a>
      </div>

      <div class="product-card">
        <a href="<%= request.getContextPath() %>/products_expanded" class="product-link">
          <img src="<%= request.getContextPath() %>/images/products/laptop1.png" alt="Laptop 3" />
          <p class="product-title">Lenovo IdeaPad 5</p>
          <p class="product-price">Rs. 99,999</p>
          <button>Add to cart</button>
        </a>
      </div>

      <div class="product-card">
        <a href="<%= request.getContextPath() %>/products_expanded" class="product-link">
          <img src="<%= request.getContextPath() %>/images/products/laptop2.png" alt="Laptop 4" />
          <p class="product-title">Asus VivoBook</p>
          <p class="product-price">Rs. 99,999</p>
          <button>Add to cart</button>
        </a>
      </div>
    </section>

    <section class="product-grid"> <!-- 2nd row-->
      <div class="product-card">
        <a href="<%= request.getContextPath() %>/products_expanded" class="product-link">
          <img src="<%= request.getContextPath() %>/images/products/laptop1.png" alt="Laptop 5" />
          <p class="product-title">HP Pavilion 15</p>
          <p class="product-price">Rs. 99,999</p>
          <button>Add to cart</button>
        </a>
      </div>

      <div class="product-card">
        <a href="<%= request.getContextPath() %>/products_expanded" class="product-link">
          <img src="<%= request.getContextPath() %>/images/products/laptop2.png" alt="Laptop 6" />
          <p class="product-title">Dell Inspiron 14</p>
          <p class="product-price">Rs. 99,999</p>
          <button>Add to cart</button>
        </a>
      </div>

      <div class="product-card">
        <a href="<%= request.getContextPath() %>/products_expanded" class="product-link">
          <img src="<%= request.getContextPath() %>/images/products/laptop1.png" alt="Laptop 7" />
          <p class="product-title">Lenovo IdeaPad 5</p>
          <p class="product-price">Rs. 99,999</p>
          <button>Add to cart</button>
        </a>
      </div>

      <div class="product-card">
        <a href="<%= request.getContextPath() %>/products_expanded" class="product-link">
          <img src="<%= request.getContextPath() %>/images/products/laptop2.png" alt="Laptop 8" />
          <p class="product-title">Asus VivoBook</p>
          <p class="product-price">Rs. 99,999</p>
          <button>Add to cart</button>
        </a>
      </div>
    </section>

    <!-- <script src="<%= request.getContextPath() %>/script.js"></script> -->
  </main>
  <jsp:include page="footer.jsp" />
</body>
</html>
