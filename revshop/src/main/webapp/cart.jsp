<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.revshop.Product" %>
<%@ page import="com.revshop.Cart" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RevShop - Cart</title>
    <link rel="stylesheet" href="theme.css">
    <header>
        <div class="header-title">&copy;RevShop</div>
        <a href="index.jsp" class="button">Logout</a>
    </header>
</head>
<body>
    <div class="dashboard">
        <h1 style="color: white;">Your Cart</h1>
        
        <%
            // Retrieve the cart from session
            Cart cart = (Cart) session.getAttribute("cart");

            if (cart != null) {
                Map<Product, Integer> cartItems = cart.getItems();
                if (!cartItems.isEmpty()) {
        %>
        <ul>
            <%
                // Loop through cart items and display them
                for (Map.Entry<Product, Integer> entry : cartItems.entrySet()) {
                    Product product = entry.getKey();
                    int quantity = entry.getValue();
            %>
            <li>
                <img src="data:image/jpeg;base64,<%= product.getImageBase64() %>" alt="<%= product.getName() %>" style="max-width: 150px; max-height: 150px;">
                <span><%= product.getName() %> - ₹<%= product.getPrice() %> x <%= quantity %></span>
            </li>
            <%
                }
            %>
        </ul>
        <%
                } else {
        %>
        <p>Your cart is empty.</p>
        <%
                }
            } else {
        %>
        <p>There was a problem retrieving your cart.</p>
        <%
            }
        %>
    </div>

    <jsp:include page="footer.html" />
</body>
</html>
