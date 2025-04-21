<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Admin Dashboard | LaptopHub</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin.css" />
  <link rel="stylesheet"  href="<%= request.getContextPath() %>/css/style.css" />
  <link rel="icon" href="${pageContext.request.contextPath}/images/logo/logo1.png" type="image/png">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="header.jsp" />
  <div class="admin-container">
    <!-- Sidebar -->
    <aside class="admin-sidebar">
      <div class="admin-brand">LaptopHub</div>
      <nav>
        <ul class="admin-nav">
          <li><a href="#"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
          <li><a href="#"><i class="fas fa-box"></i> Manage Product</a></li>
        </ul>
      </nav>
      <nav>
        <ul class="admin-nav">
            <li><a href="#"><i class="fas fa-sign-in-alt"></i> Login</a></li>
            <li><a href="#"><i class="fas fa-user"></i> Profile</a></li>
          </ul>
      </nav>
      <nav>
        <ul class="admin-nav">
            <li><a href="#"><i class="fas fa-sign-in-alt"></i> Login</a></li>
            <li><a href="#"><i class="fas fa-user"></i> Profile</a></li>
          </ul>
      </nav>
    </aside>

    <!-- Main Content -->
    <main class="admin-main">
      <h2 class="admin-section-title">Dashboard</h2>
      
      <!-- Stats Cards -->
      <div class="admin-stats">
        <div class="admin-stat-card">
          <div class="admin-stat-label">Total User</div>
          <div class="admin-stat-value">10</div>
        </div>
        <div class="admin-stat-card">
          <div class="admin-stat-label">Total Order</div>
          <div class="admin-stat-value">13</div>
        </div>
        <div class="admin-stat-card">
          <div class="admin-stat-label">Total Product</div>
          <div class="admin-stat-value">6</div>
        </div>
      </div>

      <!-- Page Visits Table -->
      <div class="admin-table-container">
        <h3>Users</h3>
        <table class="admin-table">
          <thead>
            <tr>
              <th>Page Name</th>
              <th>Visitor</th>
              <th>Email</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Home</td>
              <td>Ayush Wosti</td>
              <td>ayushw@gmail.com</td>
            </tr>
            <tr>
              <td>Home</td>
              <td>Regan Budhathoki</td>
              <td>regan@gmail.com</td>
            </tr>
            <tr>
              <td>Home</td>
              <td>Asara Dangol</td>
              <td>asaradangol@gmail.com</td>
            </tr>
            <tr>
              <td>Home</td>
              <td>Nischal Man Shrestha</td>
              <td>Nischal@gmail.com</td>
            </tr>
            <tr>
              <td>Home</td>
              <td>Suave Shrestha</td>
              <td>suave@gmail.com</td>
            </tr>
          </tbody>
        </table>
      </div>
    </main>
  </div>

  <jsp:include page="footer.jsp" />
</body>
</html>