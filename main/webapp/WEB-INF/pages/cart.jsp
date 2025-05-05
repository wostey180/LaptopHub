<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Cart | LaptopHub</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/cart.css" />
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" />
  <link rel="icon" href="${pageContext.request.contextPath}/images/logo/logo1.png" type="image/png">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
  <jsp:include page="header.jsp" />
  <main class="cart-main">
    <div class="cart-container">
      <h1 class="cart-title">My Cart</h1>
      
      <c:if test="${empty cartItems}">
        <p>Your cart is empty. Start shopping now!</p>
        <a href="${pageContext.request.contextPath}/home"><button class="btn btn-primary">Go to Shop</button></a>
      </c:if>
      
      <c:if test="${not empty cartItems}">
        <div class="cart-items">
          <!-- Loop through the cartItems list -->
          <c:forEach var="item" items="${cartItems}">
            <div class="cart-item">
              <div class="item-image">
                <img src="${pageContext.request.contextPath}/${item.imagePath}" alt="${item.name}" 
                     onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/default-product.png'">
              </div>
              <div class="item-content">
                <div class="item-details">
                  <h3 class="item-name">${item.name}</h3>
                  <p class="item-specs">${item.specs}</p>
                  <p class="item-desc">${item.description}</p>
                  <p class="item-code">${item.model}</p>
                </div>

                <div class="item-controls">
                  <div class="quantity-selector">
                    <span class="quantity-label">Quantity</span>
                    <div class="quantity-buttons">
                      
                      <span class="quantity-value">${item.quantity}</span>
                      
                    </div>
                  </div>
                  <div class="item-price">Rs. ${item.price * item.quantity}</div>
                </div>
              </div>
            </div>
          </c:forEach>
        </div>
        
        <!-- Cart Summary -->
        <div class="cart-summary">
          <div class="summary-total">
            <span>Total:</span>
            <span class="total-amount">
              <!-- Sum up all item prices -->
              <c:set var="totalAmount" value="0" />
              <c:forEach var="item" items="${cartItems}">
                <c:set var="totalAmount" value="${totalAmount + item.price * item.quantity}" />
              </c:forEach>
              Rs. ${totalAmount}
            </span>
            </div>
          <div class="summary-actions">
            <form action="${pageContext.request.contextPath}/checkout" method="POST">
			   <button class="btn btn-primary" type="submit">Proceed to Checkout</button>
			</form>
            <a href="${pageContext.request.contextPath}/home"><button class="btn btn-secondary">Continue Shopping</button></a>
          </div>
        </div>
      </c:if>
      
      
      
    </div>
  </main>
  <jsp:include page="footer.jsp" />
</body>
</html>
