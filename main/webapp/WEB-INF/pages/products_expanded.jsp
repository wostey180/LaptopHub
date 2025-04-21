<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>LaptopHub - Product Details</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/products_expanded.css" />
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" />
  <link rel="icon" href="${pageContext.request.contextPath}/images/logo/logo1.png" type="image/png">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
  <jsp:include page="header.jsp" />
  <main>
    <!-- Product Detail Section -->
    <div class="product-expanded-detail-container">
      <div class="product-expanded-image">
        <img src="./images/products/laptop1.png" alt="MacBook Pro">
      </div>
      
      <div class="product-expanded-info">
        <h1 class="product-expanded-title">Lenovo Ideapad 15</h1>
        <p class="product-expanded-description">
            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quas repellendus quia explicabo praesentium nihil tempore et culpa perferendis rerum unde expedita itaque, nemo facere iusto doloremque. Dolorem, eveniet odio. Ex.
        </p>
        
        <div class="product-expanded-price">Rs.1,00,000</div>
        
        <div class="product-expanded-meta">
          <div class="meta-item">
            <span class="meta-label">Rating:</span>
            <span class="rating">
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star-half-alt"></i>
            </span>
          </div>
          
          <div class="meta-item">
            <span class="meta-label">Color:</span>
            <div class="color-options">
              <div class="color-option selected" style="background-color: #333;"></div>
              <div class="color-option" style="background-color: #f4c430;"></div>
              <div class="color-option" style="background-color: #f5eee3;"></div>
            </div>
          </div>
          
          <div class="meta-item">
            <span class="meta-label">Quantity:</span>
            <div class="quantity-selector">
              <button class="quantity-btn">-</button>
              <span class="quantity-value">1</span>
              <button class="quantity-btn">+</button>
            </div>
          </div>
        </div>
        
        <div class="action-buttons">
          <a href="cart.html"><button class="btn btn-primary">Add to Cart</button></a>
          <button class="btn btn-secondary">Buy Now</button>
        </div>
      </div>
    </div>
    
    
  </main>
  <jsp:include page="footer.jsp" />
</body>
</html>