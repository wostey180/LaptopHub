<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Order Successful | LaptopHub</title>
  <!-- <link rel="stylesheet" href="style.css" /> -->
  <link rel="stylesheet"  href="<%= request.getContextPath() %>/css/error.css" />
  <link rel="stylesheet"  href="<%= request.getContextPath() %>/css/style.css" />
  <link rel="icon" href="${pageContext.request.contextPath}/images/logo/logo1.png" type="image/png">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
  
</head>
<body>
	<jsp:include page="header.jsp" />
    <main>
  <div class="error-container">
    <h1 class="error-code">ORDER PLACED</h1>
    <h2 class="error-title">Thank you for your order!</h2>
    <p class="error-message">Your order has been placed successfully. You will receive a confirmation email shortly.</p>
    <a href="<%= request.getContextPath() %>/products" class="error-button">Continue Shopping</a>
  </div>
    </main>
    <jsp:include page="footer.jsp" />
</body>
</html>