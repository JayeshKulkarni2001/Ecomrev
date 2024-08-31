<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Cart</title>
    <link rel="stylesheet" href="theme.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <header>
        <h1>Shopping Cart</h1>
        <a href="buyerDashboard.jsp">Back to Products</a>
    </header>
    <div class="container">
        <h2>Your Cart</h2>
        <table class="table">
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Action</th> <!-- New column for action -->
                </tr>
            </thead>
            <tbody>
                <%
                    int username = (int) session.getAttribute("id");
                    if (username != 0) {
                        // Database connection details
                        String DB_URL = "jdbc:mysql://localhost:3030/revshop";
                        String DB_USER = "root";
                        String DB_PASSWORD = "root";
                        
                        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                            String sql = "SELECT p.id, p.name, p.price, c.quantity " +
                                         "FROM Cart c JOIN Products p ON c.product_id = p.id " +
                                         "WHERE c.user_id = ?";
                            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                                stmt.setInt(1, username);
                                ResultSet rs = stmt.executeQuery();
                                while (rs.next()) {
                                    int productId = rs.getInt("id");
                                    String productName = rs.getString("name");
                                    double price = rs.getDouble("price");
                                    int quantity = rs.getInt("quantity");
                                    double total = price * quantity;
                %>
                <tr>
                    <td><%= productId %></td>
                    <td><%= productName %></td>
                    <td>₹<%= price %></td>
                    <td><%= quantity %></td>
                    <td>₹<%= total %></td>
                    <td>
                        <form action="DeleteFromCartServlet" method="post">
                            <input type="hidden" name="productId" value="<%= productId %>">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
                <%
                                }
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                            out.println("Error fetching cart items.");
                        }
                    } else {
                %>
                <tr>
                    <td colspan="6">You must be logged in to view your cart.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
