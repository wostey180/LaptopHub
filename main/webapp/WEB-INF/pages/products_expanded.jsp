<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>${product.product_name} | LaptopHub</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/products_expanded.css" />
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" />
  <link rel="icon" href="${pageContext.request.contextPath}/images/logo/logo1.png" type="image/png">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
  <jsp:include page="header.jsp" />
  <main>
    <div class="product-expanded-detail-container">
      <div class="product-expanded-image">
        <img src="${pageContext.request.contextPath}/${product.image_path}" alt="${product.product_name}" 
             onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/default-product.png'">
      </div>
      
      <div class="product-expanded-info">
        <h1 class="product-expanded-title">${product.product_name}</h1>
        <p class="product-expanded-description">${product.description}</p>
        
        <div class="product-expanded-price">Rs.${product.price}</div>
        
        <div class="product-expanded-meta">
          <div class="meta-item">
            <span class="meta-label">Brand:</span> ${product.brand}
          </div>
          <div class="meta-item">
            <span class="meta-label">Model:</span> ${product.model}
          </div>
          <div class="meta-item">
            <span class="meta-label">Specs:</span> ${product.specs}
          </div>
          <div class="meta-item">
            <span class="meta-label">In Stock:</span> ${product.stock_quantity}
          </div>
          
        </div>

        <div class="action-buttons">
          <c:choose>
		    <c:when test="${product.stock_quantity > 0}">
		      <form action="${pageContext.request.contextPath}/add-to-cart" method="post">
		        <input type="hidden" name="productId" value="${product.product_id}" />
		        <button type="submit" class="btn btn-primary">Add to Cart</button>
		      </form>
		    </c:when>
		    <c:otherwise>
		      <span class="btn btn-disabled" style="background-color: #ccc; color: #666; cursor: not-allowed; padding: 10px 20px; border-radius: 5px; display: inline-block;">
		        Out of Stock
		      </span>
		    </c:otherwise>
		  </c:choose>
        </div>
      </div>
    </div>
  </main>
  <jsp:include page="footer.jsp" />
</body>
</html>
