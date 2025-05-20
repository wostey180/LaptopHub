<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <link rel="stylesheet"  href="<%= request.getContextPath() %>/css/style.css" />
  	<link rel="icon" href="${pageContext.request.contextPath}/images/logo/logo1.png" type="image/png">
  	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>


<header>
        <div class="container header-container">
            <!-- <div class="logo">Laptop<span>Hub</span></div> -->
            <a href="index.html" class="logo">
            <img src="${pageContext.request.contextPath}/images/logo/logo.png" alt="Laptop Hub">
        	</a>
            <nav id="nav-menu">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/home" class="active">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/products">Products</a></li>
                    <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
	                
	                <% if (session.getAttribute("userRole") != null && session.getAttribute("userRole").equals("admin")) { %>
				    <li><a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a></li>
					<% } %>

                    
                </ul>	
            </nav>
            <div class="header-icons">
                <form action="${pageContext.request.contextPath}/SearchBarController" method="get" class="search-bar">
                    <input type="text" name="search" placeholder="Search..." class="search-input">
                    <button type="submit">
                        <img src="${pageContext.request.contextPath}/images/icons/search.png" style="width: 20px; height: 20px;" alt="Search">
                    </button>
                </form>
             	<% if (session.getAttribute("username") != null) { %>
                <a href="${pageContext.request.contextPath}/profile" class="header-icon"><i class="fas fa-user"></i></a>
                	<% if (session.getAttribute("userRole") != null && !session.getAttribute("userRole").equals("admin")) { %>
                	<a href="${pageContext.request.contextPath}/cart" class="header-icon"><i class="fas fa-shopping-cart"></i></a>
                	<% } %>               
                <% } else { %>
                <nav id="nav-menu">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
                </ul>
                </nav>
                <% } %>
                
                
                <div class="hamburger" id="hamburger">
                    <i class="fas fa-bars"></i>
                </div>
            </div>
        </div>
    </header>