<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Product</title>
</head>
<body>
    <h2>Edit Product</h2>
    <%
        String id = request.getParameter("id");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3030/revshop", "root", "root");

            String sql = "SELECT * FROM products WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
    %>
    <form action="EditProductServlet" method="post">
        <input type="hidden" name="id" value="<%= rs.getString("id") %>">
        Name: <input type="text" name="name" value="<%= rs.getString("name") %>" required><br>
        Description: <textarea name="description" required><%= rs.getString("description") %></textarea><br>
        Price: <input type="text" name="price" value="<%= rs.getString("price") %>" required><br>
        Quantity: <input type="text" name="quantity" value="<%= rs.getString("quantity") %>" required><br>
        Category: <input type="text" name="category" value="<%= rs.getString("category") %>" required><br>
        Image URL: <input type="text" name="imageUrl" value="<%= rs.getString("image_url") %>"><br>
        <input type="submit" value="Update Product">
    </form>
    <%
            } else {
                out.println("Product not found.");
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("An error occurred while fetching the product details.");
        }
    %>
</body>
</html>
