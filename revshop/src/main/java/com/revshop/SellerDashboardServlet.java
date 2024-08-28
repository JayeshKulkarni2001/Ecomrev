package com.revshop;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//@WebServlet("/sellerDashboard")
public class SellerDashboardServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/yourdb";
    private static final String DB_USER = "username";
    private static final String DB_PASSWORD = "password";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Map<String, Object> loggedUser = (Map<String, Object>) session.getAttribute("loggedUser");

        if (loggedUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Map<String, Object>> sellerProducts = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "SELECT * FROM products WHERE seller_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, (Integer) loggedUser.get("id"));
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Map<String, Object> product = new HashMap<>();
                product.put("id", resultSet.getInt("id"));
                product.put("name", resultSet.getString("name"));
                product.put("price", resultSet.getDouble("price"));
                product.put("imageUrl", resultSet.getString("image_url"));
                sellerProducts.add(product);
            }
        } catch (SQLException e) {
            throw new ServletException("Database access error", e);
        }

        request.setAttribute("sellerProducts", sellerProducts);
        request.setAttribute("user", loggedUser);
        request.getRequestDispatcher("/sellerDashboard.jsp").forward(request, response);
    }
}
