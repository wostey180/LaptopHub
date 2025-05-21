<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact | LaptopHub</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/contact.css" />
    <link rel="stylesheet"  href="<%= request.getContextPath() %>/css/style.css" />
  	<link rel="icon" href="${pageContext.request.contextPath}/images/logo/logo1.png" type="image/png">
  	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="header.jsp" />
    <main class="contact-main">
        <div class="contact-container">
            <h2>Contact</h2>
            <form>
                <div class="contact-input-group">
                    <label for="name">Name</label>
                    <input type="text" id="c_name" name="c_name" required />
                </div>
                 <div class="contact-input-group">
                    <label for="email">Email</label>
                    <input type="email" id="c_email" name="c_email" required />
                </div>
                
                <div class="contact-input-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" id="c_phone" name="c_phone" required />
                </div>
                <div class="contact-input-group">
                    <label for="address">Address</label>
                    <input type="text" id="c_address" name="c_address" required />
                </div>
               
               
                <button type="submit" class="contact-button">Reach Out</button>
                
            </form>
        </div>
    </main>
    <jsp:include page="footer.jsp" />
</body>
</html>
