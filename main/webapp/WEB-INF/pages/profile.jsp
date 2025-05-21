<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile | LaptopHub</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">
    <link rel="stylesheet"  href="<%= request.getContextPath() %>/css/style.css" />
  	<link rel="icon" href="${pageContext.request.contextPath}/images/logo/logo1.png" type="image/png">
  	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <main class="profile-main">
        <div class="profile-container">
            <h2>My Profile</h2>
            <img src="${pageContext.request.contextPath}/${sessionScope.imageUrl}" 
             alt="Profile Image" class="profile-image"
             onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/userimgs/default.png'">
            <div class="profile-info">
                <p><span class="info-label">Username:</span> ${sessionScope.username}</p>
            <p><span class="info-label">Email:</span> ${sessionScope.email}</p>
            <p><span class="info-label">Address:</span> ${sessionScope.address}</p>
            <p><span class="info-label">Phone:</span> ${sessionScope.phone}</p>
            </div>
            <div class="profile-actions">
                <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>
                <a href="${pageContext.request.contextPath}/profile/update-profile" class="update-profile-btn">
             <i class="fas fa-edit"></i> Update Profile
             </a>
            </div>
            
            
        </div>
    </main>
    
    <jsp:include page="footer.jsp" />
</body>
</html>