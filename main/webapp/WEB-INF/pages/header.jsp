<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <link rel="stylesheet"  href="<%= request.getContextPath() %>/css/style.css" />
  	<link rel="icon" href="${pageContext.request.contextPath}/images/logo/logo1.png" type="image/png">
  	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<header>
    <nav>
        <a href="index.html" class="logo">
            <img src="images/logo/logo.png" alt="Laptop Hub">
        </a>
        <ul>
            <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/products">Products</a></li>
            <li><a href="${pageContext.request.contextPath}/about">About</a></li>
            <!--  <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
            <li><a href="${pageContext.request.contextPath}/register">Register</a></li> -->
            <li><a href="${pageContext.request.contextPath}/contact" class="contact-link">Contact Us</a></li>
            <li >
                <% if (session.getAttribute("username") != null) { %>
                    <a href="${pageContext.request.contextPath}/profile" class="nav-icons">Profile</a>
                <% } else { %>
                    <a href="${pageContext.request.contextPath}/login" class="nav-icons">Login</a>
                <% } %>
            <li><a href="${pageContext.request.contextPath}/cart" class="cart-link"><i class="fas fa-shopping-cart"></i></a></li>
        </ul>
    </nav>
</header>