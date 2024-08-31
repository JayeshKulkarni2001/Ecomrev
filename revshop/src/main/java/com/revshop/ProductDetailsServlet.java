package com.revshop;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//@WebServlet("/productDetailsServlet")
public class ProductDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        List<Product> productList = new ArrayList<>();
        Connection connection = null; // You need to implement your DB connection logic

        try {
        	// Load JDBC driver (optional for newer versions)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3030/revshop", "root", "root");

                String sql = "SELECT * FROM products";
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    Product product = new Product();
                    product.setId(resultSet.getInt("id"));
                    product.setName(resultSet.getString("name"));
                    product.setDescription(resultSet.getString("description"));
                    product.setPrice(resultSet.getBigDecimal("price"));
                    product.setQuantity(resultSet.getInt("quantity"));
                    product.setCategory(resultSet.getString("category"));
                    product.setImageUrl(resultSet.getBytes("image_url")); // Assuming image_url is a BLOB or BYTE[]

                    productList.add(product);
                }

                resultSet.close();
                statement.close();
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                // Handle exceptions (e.g., logging, setting error messages)
            } finally {
                // Close the connection
                if (connection != null) {
                    try {
                        connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }

            // Set the productList as a request attribute
            request.setAttribute("productList", productList);

            // Forward the request to the JSP page
            request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}
