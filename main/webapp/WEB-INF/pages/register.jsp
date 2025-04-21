<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>LaptopHub - Register</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/register.css" />
    <link rel="stylesheet"  href="<%= request.getContextPath() %>/css/style.css" />
  	<link rel="icon" href="${pageContext.request.contextPath}/images/logo/logo1.png" type="image/png">
  	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="header.jsp" />

    <main class="register-main">
        <div class="register-container">
            <h2>Registration</h2>
            <% if (session.getAttribute("error") != null) { %>
                <div class="error-message">
                    <%= session.getAttribute("error") %>
                </div>
                <% session.removeAttribute("error"); %>
            <% } %>
            <form action = "${pageContext.request.contextPath}/register" method = "post" enctype="multipart/form-data">
                <div class="register-input-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required />
                </div>
                <div class="register-input-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required />
                </div>
                
                 <div class="register-input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required />
                </div>
                
                <div class="register-input-group">
                    <label for="address">Address</label>
                    <input type="text" id="address" name="address" required />
                </div>
                <!-- <div class="register-input-group">
                    <label for="gender">Gender</label>
                    <select id="gender" name="gender" required>
                        <option value="" disabled selected>Select gender</option>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                        <option value="other">Other</option>
                    </select>
                </div> -->
                
                <div class="register-input-group">
                    <label for="phone">Phone</label>
                    <input type="text" id="phone" name="phone" required />
                </div>
                
                <div class="register-input-group">
			        <label for="userImage">Profile Image</label>
			        <input type="file" id="userImage" name="userImage" accept="image/*">
			    </div>
			               
               
                <button type="submit" class="register-button">Register</button>
                
                <div class="register-login">
                    <a href="login">Already Registered? Log In</a>
                </div>
            </form>
        </div>
    </main>
	<jsp:include page="footer.jsp" />
</body>
</html>