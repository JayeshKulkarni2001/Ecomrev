<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>RevShop - Home</title>
<link rel="stylesheet" href="styles.css">
<!-- Link to your CSS file -->
</head>
<body>
	<header>
		<div class="header-title">RevShop</div>
		<div class="button-container">
			<a href="login.jsp" class="button">Login</a> <a href="register.jsp"
				class="button">Register</a>
		</div>
	</header>
	<div class="hero">
		<!-- <img src="hero-image.jpg" alt="Hero Image"> -->
		<h1>Welcome to RevShop</h1>
		<p>Your one-stop shop for all your needs.</p>
	</div>

	<section id="intro">
		<h2>Your One-Stop Online Shop</h2>
		<p>Discover a wide variety of products, from electronics to
			fashion. Shop with confidence and enjoy fast shipping and secure
			payment options.</p>
		<p>
			Not a member yet? <a href="register.jsp">Register here</a> to start
			shopping!
		</p>
	</section>

	<section id="featured-products">
		<h2>Featured Products</h2>
		<div class="product-list">
			<div class="product-item">
				<img src="img/headphone.jpg" alt="Product 1">
				<h3>Rev R1 Headphones</h3>
				<p>₹1999.99</p>
				<a href="productDetails.jsp?id=1" class="button">View Details</a>
			</div>
			<div class="product-item">
				<img src="img/wired.jpg" alt="Product 2">
				<h3>Rev rem Wired</h3>
				<p>₹299.99</p>
				<a href="productDetails.jsp?id=2" class="button">View Details</a>
			</div>
			<div class="product-item">
				<img src="img/wireless.jpg" alt="Product 3">
				<h3>Rev revo Wireless</h3>
				<p>₹1399.99</p>
				<a href="productDetails.jsp?id=3" class="button">View Details</a>
			</div>
		</div>
	</section>
	
	<footer style="background-color: #333; color: #fff; padding: 20px; text-align: center;">
    <div style="display: flex; justify-content: space-between; flex-wrap: wrap; max-width: 1200px; margin: 0 auto;">
        <!-- About Section -->
        <div style="flex: 1; min-width: 200px; margin: 10px;">
            <h3 style="color: #fff;">About RevShop</h3>
            <p style="line-height: 1.6;">RevShop is a versatile e-commerce platform offering a wide range of products for buyers and sellers. Our mission is to provide a secure and user-friendly shopping experience.</p>
        </div>
        <!-- Quick Links Section -->
        <div style="flex: 1; min-width: 200px; margin: 10px;">
            <h3 style="color: #fff;">Quick Links</h3>
            <ul style="list-style: none; padding: 0;">
                <li><a href="index.jsp" style="color: #fff; text-decoration: none;" onmouseover="this.style.color='#7a7a76'" onmouseout="this.style.color='#fff'">Home</a></li>
                <li><a href="about.jsp" style="color: #fff; text-decoration: none;" onmouseover="this.style.color='#7a7a76'" onmouseout="this.style.color='#fff'">About Us</a></li>
                <li><a href="terms.jsp" style="color: #fff; text-decoration: none;" onmouseover="this.style.color='#7a7a76'" onmouseout="this.style.color='#fff'">Terms & Conditions</a></li>
                <li><a href="privacy.jsp" style="color: #fff; text-decoration: none;" onmouseover="this.style.color='#7a7a76'" onmouseout="this.style.color='#fff'">Privacy Policy</a></li>
            </ul>
        </div>
        <!-- Contact Section -->
        <div style="flex: 1; min-width: 200px; margin: 10px;">
            <h3 style="color: #fff;">Contact Us</h3>
            <p style="line-height: 1.6;">Email: support@revshop.com</p>
            <p style="line-height: 1.6;">Phone: +123-456-7890</p>
            <p style="line-height: 1.6;">Address: 123 RevShop Street, City, Country</p>
        </div>
    </div>
    <div style="border-top: 1px solid #fff; padding-top: 20px; margin-top: 20px;">
        <p>&copy; 2024 RevShop. All Rights Reserved.</p>
    </div>
</footer>
	

</body>
</html>
