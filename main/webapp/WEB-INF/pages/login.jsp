<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Laptop Hub</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/login.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" />
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo/logo1.png" type="image/png">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <script>
        function showLoginSuccess() {
            alert("Logged in successfully!");
        }
    </script>
</head>
<body onload="<% if (request.getAttribute("loginSuccess") != null) { %>showLoginSuccess()<% } %>">
    <jsp:include page="header.jsp" />
    
    <main class="login-main">
        <div class="login-container">
            <h2>Login</h2>
            <% if (request.getAttribute("error") != null) { %>
                <div class="error-message" style="color: red; margin-bottom: 15px;">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>
            <form action="login" method="post">
                <div class="login-input-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" >
                </div>
                <div class="login-input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" >
                    <div class="login-links">
                    <a href="#">Forgot password?</a>
                </div>
                </div>
                
                <button type="submit" class="login-button">Login</button>
                <div class="login-signup">
                    <a href="register">Not Registered? Signup</a>
                </div>
            </form>
        </div>
    </main>
    
    <jsp:include page="footer.jsp" />
</body>
</html>