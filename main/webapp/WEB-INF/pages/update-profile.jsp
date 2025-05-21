<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Update Profile | LaptopHub</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/update-profile.css" />
    <link rel="stylesheet"  href="<%= request.getContextPath() %>/css/style.css" />
  	<link rel="icon" href="${pageContext.request.contextPath}/images/logo/logo1.png" type="image/png">
  	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="header.jsp" />

    <main class="profile-update-main">
        <div class="profile-update-container">
            <h2>Update Profile</h2>
            <% if (session.getAttribute("error") != null) { %>
                <div class="error-message" style="color: red; margin-bottom: 15px;">
                    <%= session.getAttribute("error") %>
                </div>
                <% session.removeAttribute("error"); %>
            <% } %>
            <form action = "${pageContext.request.contextPath}/profile/update-profile" method = "post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="user_email">Email:</label>
                    <input type="email" id="user_email" name="user_email" 
                           value="<%= session.getAttribute("email") != null ? session.getAttribute("email") : "" %>" class="form-control" required/>
                </div>

                <div class="form-group">
                    <label for="user_current_password">Current Password:</label>
                    <input type="password" id="user_current_password" name="user_current_password" class="form-control" required/>
                </div>

                <div class="form-group">
                    <label for="user_new_password">New Password:</label>
                    <input type="password" id="user_new_password" name="user_new_password" class="form-control">
                </div>

                <div class="form-group">
                    <label for="user_address">Address:</label>
                    <input type="text" id="user_address" name="user_address" 
                           value="<%= session.getAttribute("address") != null ? session.getAttribute("address") : "" %>" class="form-control" required/>
                </div>

                <div class="form-group">
                    <label for="user_phone">Phone:</label>
                    <input type="text" id="user_phone" name="user_phone" 
                           value="<%= session.getAttribute("phone") != null ? session.getAttribute("phone") : "" %>" class="form-control" required/>
                </div>

                <div class="form-group">
                    <label for="userImage">Profile Image:</label>
                    <input type="file" id="userImage" name="userImage" accept="image/*" class="form-control">
                    <small>Leave empty to keep current image</small>
                </div>
			               
               
                <div class="form-actions">
                    <button type="submit" class="profile-update-button">Update Profile</button>
                    <a href="<%= request.getContextPath() %>/profile" class="profile-update-cancel">Cancel</a>
                </div>
            </form>
        </div>
    </main>
	<jsp:include page="footer.jsp" />
</body>
</html>