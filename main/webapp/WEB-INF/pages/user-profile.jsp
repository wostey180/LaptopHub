<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile | LaptopHub</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user-profile.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo/logo1.png" type="image/png">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp" />

<main class="user-profile-main">
	<aside class="admin-sidebar">
            <div class="admin-brand">LaptopHub</div>
            <nav>
                <ul class="admin-nav">
                    <li><a href="${pageContext.request.contextPath}/admin/orders"><i class="fas fa-tachometer-alt"></i> View Orders</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/manage-product"><i class="fas fa-box"></i> Manage Product</a></li>
                </ul>
            </nav>
            
            <nav>
                <ul class="admin-nav">
                    <li><a href="${pageContext.request.contextPath}/admin/add-product"><i class="fas fa-plus"></i>Add Product</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                </ul>
            </nav>
            
            <nav>
                <ul class="admin-nav">
                    <li><a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-in-alt"></i> Logout</a></li>
                    <li><a href="${pageContext.request.contextPath}/profile"><i class="fas fa-user"></i> Profile</a></li>
                </ul>
            </nav>
    </aside>
    <div class="user-profile-main-right">
	    <div class="user-profile-container">
	        <h2>User Profile</h2>
	        <c:if test="${not empty user.imageUrl}">
	        <img src="${pageContext.request.contextPath}/${user.imageUrl}" alt="Profile Image" class="profile-image"
	            onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/userimgs/default.png'">
	             </c:if>
	         <c:if test="${empty user.imageUrl}">
	   		 <img src="${pageContext.request.contextPath}/images/userimgs/default.png" 
	         alt="Default Profile Image" class="profile-image">
			</c:if>    
	        <div class="profile-info">
	            <p><strong>Username:</strong> ${user.username}</p>
	   			<p><strong>Email:</strong> ${user.user_email}</p>
	    		<p><strong>Phone:</strong> ${user.user_phone}</p>
			    <p><strong>Address:</strong> ${user.user_address}</p>
	        </div>
	    </div>
    </div>
</main>

<jsp:include page="footer.jsp" />
</body>
</html>
