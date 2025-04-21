<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Cart | LaptopHub</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/cart.css" />
  <link rel="stylesheet"  href="<%= request.getContextPath() %>/css/style.css" />
  <link rel="icon" href="${pageContext.request.contextPath}/images/logo/logo1.png" type="image/png">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="header.jsp" />
    <main class="cart-main">
      <div class="cart-container">
        <h1 class="cart-title">My Cart</h1>
        
        <div class="cart-items">
          <!-- Cart Item 1 -->
          <div class="cart-item">
            <div class="item-image">
              <img src="images/products/laptop1.png" alt="MacBook Pro">
            </div>
            <div class="item-content">
              <div class="item-details">
                <h3 class="item-name">MacBook Pro</h3>
                <p class="item-specs">16 GB</p>
                <p class="item-desc">BLACK</p>
                <p class="item-code">M2</p>
              </div>
              
              <div class="item-controls">
                <div class="quantity-selector">
                  <span class="quantity-label">Quantity</span>
                  <div class="quantity-buttons">
                    <button class="quantity-btn">-</button>
                    <span class="quantity-value">1</span>
                    <button class="quantity-btn">+</button>
                  </div>
                </div>
                <div class="item-price">Rs. 99,999</div>
              </div>
            </div>
          </div>
          
          <!-- Cart Item 2 -->
          <div class="cart-item">
            <div class="item-image">
              <img src="images/products/laptop2.png" alt="MacBook Pro">
            </div>
            <div class="item-content">
              <div class="item-details">
                <h3 class="item-name">MacBook Pro</h3>
                <p class="item-specs">32 GB</p>
                <p class="item-desc">WHITE</p>
                <p class="item-code">M4</p>
              </div>
              
              <div class="item-controls">
                <div class="quantity-selector">
                  <span class="quantity-label">Quantity</span>
                  <div class="quantity-buttons">
                    <button class="quantity-btn">-</button>
                    <span class="quantity-value">1</span>
                    <button class="quantity-btn">+</button>
                  </div>
                </div>
                <div class="item-price">Rs. 99,999</div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <script src="script.js"></script>
    </main>
    <jsp:include page="footer.jsp" />
  </body>
</html>