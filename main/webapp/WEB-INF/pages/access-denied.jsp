<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Access Denied | LaptopHub</title>
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
    <h1 class="error-code">ACCESS DENIED</h1>
    <h2 class="error-title">Oops.. you dont have access to view this page.</h2>
    <p class="error-message">Page is only accessible to admins....</p>
    <a href="<%= request.getContextPath() %>/home" class="error-button">Go to Homepage</a>
  </div>
    </main>
    <jsp:include page="footer.jsp" />
</body>
</html>