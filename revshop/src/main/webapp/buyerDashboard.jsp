<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.revshop.Product" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("user");
    String selectedCategory = request.getParameter("category");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RevShop - Buyer Dashboard</title>
    <link rel="stylesheet" href="theme.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
        header {
            display: flex;
            justify-content: space-between; /* Distribute space between items */
            align-items: center; /* Center items vertically */
            padding: 10px;
            background-color: #000000; /* Example background color */
        }
        .header-title {
            color: white; /* Example text color */
        }
        .logout-link {
            color: white; /* Example link color */
        }
    </style>
    <!-- Add Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <header>
        <div class="header-title">&copy;RevShop</div>
        <a href="login.jsp" class="btn btn-outline-light ml-2 logout-link" style="align-items: right;">Logout</a>
    </header>
</head>
<body style="background-color: black;">
    <div class="dashboard">
        
        <h4 style="color: white;">Welcome, <%= username %>!</h4>
        <h1></h1>
<h2></h2>
    <section id="carousel">
        <div id="productCarousel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#productCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#productCarousel" data-slide-to="1"></li>
                <li data-target="#productCarousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img/rtx.jpg" class="d-block w-100" alt="Rev R1 Headphones">
                    <div class="carousel-caption d-none d-md-block">
                        <!-- Caption for the first slide -->
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="img/msi.jpg" class="d-block w-100" alt="Rev rem Wired">
                    <div class="carousel-caption d-none d-md-block">
                        <!-- Caption for the second slide -->
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="img/msi2.jpg" class="d-block w-100" alt="Rev revo Wireless">
                    <div class="carousel-caption d-none d-md-block">
                        <!-- Caption for the third slide -->
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#productCarousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#productCarousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </section>

        <section id="category-filter">
            <form method="get" action="buyerDashboard.jsp">
                <label for="category" style="color: white;">Filter by Category:</label>
                <select name="category" id="category" onchange="this.form.submit()" class="drp">
                    <option value="">All</option>
                    <%
                        List<?> productsObj = (List<?>) session.getAttribute("allProducts");
                        if (productsObj != null && productsObj instanceof List<?>) {
                            @SuppressWarnings("unchecked")
                            List<Product> allProducts = (List<Product>) productsObj;
                            List<String> categories = allProducts.stream()
                                    .map(Product::getCategory)
                                    .distinct()
                                    .collect(Collectors.toList());
                            for (String category : categories) {
                    %>
                    <option value="<%= category %>" <%= category.equals(selectedCategory) ? "selected" : "" %>><%= category %></option>
                    <%
                            }
                        }
                    %>
                </select>
            </form>
        </section>

        <section id="buyer-products">
            
            <div class="product-list">
                <%
                    if (productsObj != null && productsObj instanceof List<?>) {
                        @SuppressWarnings("unchecked")
                        List<Product> allProducts = (List<Product>) productsObj;
                        List<Product> filteredProducts = allProducts;

                        if (selectedCategory != null && !selectedCategory.isEmpty()) {
                            filteredProducts = allProducts.stream()
                                    .filter(product -> product.getCategory().equals(selectedCategory))
                                    .collect(Collectors.toList());
                        }

                        if (!filteredProducts.isEmpty()) {
                            for (Product product : filteredProducts) {
                %>
                    <div class="product-item">
                        <img src="data:image/jpeg;base64,<%= product.getImageBase64() %>" alt="<%= product.getName() %>" style="max-width: 150px; max-height: 150px;">
                        <h3 style="color: black;"><%= product.getName() %></h3>
                        <p style="color: black;">₹<%= product.getPrice() %></p>
                        <form action="AddToCartServlet" method="post">
                            <input type="hidden" name="productId" value="<%= product.getId() %>">
                            <input type="submit" value="Add to Cart" class="button">
                        </form>
                    </div>
                <%
                            }
                        } else {
                %>
                    <p>No products found.</p>
                <%
                        }
                    } else {
                %>
                    <p>No products found.</p>
                <%
                    }
                %>
            </div>
        </section>
    </div>

    <jsp:include page="footer.html" />
</body>
</html>
