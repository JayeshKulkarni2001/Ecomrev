package com.revshop;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//@WebServlet("/EditProductServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1,  // 1 MB
    maxFileSize = 1024 * 1024 * 10,       // 10 MB
    maxRequestSize = 1024 * 1024 * 100    // 100 MB
)
public class EditProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String category = request.getParameter("category");

        Part filePart = request.getPart("image"); // Retrieves <input type="file" name="image">
        InputStream imageInputStream = filePart.getInputStream(); // Get the input stream of the file
        HttpSession session = request.getSession(false);
        String loggedUser = (String) session.getAttribute("user");

       
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3030/revshop", "root", "root");

            String sql = "UPDATE products SET name = ?, description = ?, price = ?, quantity = ?, category = ?, image_url = ?, addby = ? WHERE id = ?";
           

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, description);
            stmt.setDouble(3, price);
            stmt.setInt(4, quantity);
            stmt.setString(5, category);
            stmt.setBlob(6, imageInputStream);
            stmt.setString(7,loggedUser);
            stmt.setString(8, id);


            stmt.executeUpdate();
            stmt.close();
            conn.close();

            response.sendRedirect("./SellerDashboardServlet");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("editProduct.jsp?id=" + id + "&error=An+error+occurred");
        }
    }
}
