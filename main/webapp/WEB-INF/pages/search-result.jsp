<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--
    /**
     * This JSP page displays search results based on the user's input.
     * It checks if there are matching products and lists them.
     * Uses JSTL tags for dynamic rendering of data from the server.
     */
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Search Results | ${query}</title>
<link rel="icon" href="${pageContext.request.contextPath}/images/logo/logo1.png" type="image/png">
<!--
    /**
     * Internal CSS styles for the search result layout.
     * Includes container styling, product cards, and responsive visuals.
     */
-->
<style>
  .container {
    padding: 2rem 4rem;
    max-width: 1200px;
     margin-bottom: 60px;
}

.search-title {
    text-align: center;
    margin-bottom: 2rem;
    font-size: 28px;
    color: #333;
}

.product-result-list {
    display: flex;
    flex-direction: column;
    gap: 2rem;
}

.product-horizontal-card {
    display: flex;
    align-items: center;
    background: #fff;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
    transition: transform 0.2s ease-in-out;
    margin-bottom: 20px;
}

.product-horizontal-card:hover {
    transform: scale(1.01);
}

.product-image img {
    width: 200px;
    height: 190px;
    border-radius: 8px;
    object-fit: cover;
    margin-right: 24px;
}

.product-details {
    flex: 1;
}

.product-details h3 {
    font-size: 22px;
    margin-bottom: 10px;
    color: #222;
}

.product-details p {
    font-size: 16px;
    color: #555;
    margin: 6px 0;
}

.product-button {
    margin-top: 12px;
    display: inline-block;
    padding: 10px 18px;
    background-color: #007bff;
    color: #fff;
    text-decoration: none;
    border-radius: 6px;
    font-weight: bold;
    transition: background-color 0.3s;
}

.product-button:hover {
    background-color: #0056b3;
}

.no-results {
    text-align: center;
    font-size: 18px;
    color: #777;
    margin-top: 2rem;
}

</style>
</head>
<body>
<!--
    /**
     * Includes  header.
     * This header contains the navigation bar, profile,cart and logo.
     */
-->
<jsp:include page="header.jsp" />

<div class="container">
    <!-- Search results title -->
    <h2 class="search-title">Search Results for "${query}"</h2>
	    <!-- Check if there are no products found -->
    <c:if test="${empty products}">
        <p class="no-results">No products found.</p>
    </c:if>
    
   	<!-- Product result list -->
    <div class="product-result-list">
     	<!-- Loop through each product -->
        <c:forEach var="product" items="${products}">
            <div class="product-horizontal-card">
            	<!-- Product image section -->
                <div class="product-image">
                    <img src="${pageContext.request.contextPath}/${product.image_path}" alt="${product.product_name}" />
                </div>
                <!-- Product info section -->               
                <div class="product-details">
                    <h3>${product.product_name}</h3>
                    <p>${product.description}</p>
                    <p><strong>Rs. ${product.price}</strong></p>
                    
                      <!-- View details button -->
                    <a href="${pageContext.request.contextPath}/product-details?id=${product.product_id}" 
				       class="product-button">View Details</a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<!--
    /**
     * Includes footer.
     */
-->
<jsp:include page="footer.jsp" />
</body>
</html>
