<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RevShop - Seller Dashboard</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <div class="header-title">RevShop</div>
        <div class="user-info">
            Welcome, <strong><%= username %></strong>!
            <a href="logout.jsp" class="button">Logout</a>
        </div>
    </header>

    <div class="dashboard">
        <h1>Seller Dashboard</h1>
        <h2>Hello, <%= username %>!</h2>
        <p>Manage your products and view your sales here.</p>
        
        <section id="seller-products">
            <h2>Your Products</h2>
            <a href="addProduct.jsp" class="button">Add New Product</a>
            <div class="product-list">
                <c:forEach var="product" items="${sellerProducts}">
                    <div class="product-item">
                        <img src="${product.imageUrl}" alt="${product.name}">
                        <h3>${product.name}</h3>
                        <p>₹${product.price}</p>
                        <a href="editProduct.jsp?id=${product.id}" class="button">Edit</a>
                        <a href="deleteProduct.jsp?id=${product.id}" class="button">Delete</a>
                    </div>
                </c:forEach>
            </div>
        </section>
    </div>

    <footer style="background-color: #fff; color: #000; padding: 20px; text-align: center;">
        <div style="display: flex; justify-content: space-between; flex-wrap: wrap; max-width: 1200px; margin: 0 auto;">
            <!-- About Section -->
            <div style="flex: 1; min-width: 200px; margin: 10px;">
                <h3 style="color: #000;">About RevShop</h3>
                <p style="line-height: 1.6;">RevShop is a versatile e-commerce platform offering a wide range of products for buyers and sellers. Our mission is to provide a secure and user-friendly shopping experience.</p>
            </div>
            <!-- Quick Links Section -->
            <div style="flex: 1; min-width: 200px; margin: 10px;">
                <h3 style="color: #000;">Quick Links</h3>
                <ul style="list-style: none; padding: 0;">
                    <li><a href="index.jsp" style="color: #000; text-decoration: none;" onmouseover="this.style.color='#7a7a76'" onmouseout="this.style.color='#000'">Home</a></li>
                    <li><a href="about.jsp" style="color: #000; text-decoration: none;" onmouseover="this.style.color='#7a7a76'" onmouseout="this.style.color='#000'">About Us</a></li>
                    <li><a href="terms.jsp" style="color: #000; text-decoration: none;" onmouseover="this.style.color='#7a7a76'" onmouseout="this.style.color='#000'">Terms & Conditions</a></li>
                    <li><a href="privacy.jsp" style="color: #000; text-decoration: none;" onmouseover="this.style.color='#7a7a76'" onmouseout="this.style.color='#000'">Privacy Policy</a></li>
                </ul>
            </div>
            <!-- Contact Section -->
            <div style="flex: 1; min-width: 200px; margin: 10px;">
                <h3 style="color: #000;">Contact Us</h3>
                <p style="line-height: 1.6;">Email: support@revshop.com</p>
                <p style="line-height: 1.6;">Phone: +123-456-7890</p>
                <p style="line-height: 1.6;">Address: 123 RevShop Street, City, Country</p>
            </div>
        </div>
        <div style="border-top: 1px solid #333; padding-top: 20px; margin-top: 20px;">
            <p>&copy; 2024 RevShop. All Rights Reserved.</p>
        </div>
    </footer>
</body>
</html>
