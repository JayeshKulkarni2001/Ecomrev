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

	<footer class="footer">
				<h3>Quick Links</h3>
				<!--  <ul>
					<li><a href="index.jsp">Home</a></li>
					<li><a href="about.jsp">About</a></li>
					<li><a href="contact.jsp">Contact</a></li>
					<li><a href="terms.jsp">Terms & Conditions</a></li>
				</ul>-->
			<div class="footer-column">
				<h3>Contact Us</h3>
				<p>Email: support@revshop.com</p>
				<p>Phone: +123-456-7890</p>
			</div>
		
		<div class="footer-bottom">
			<p>&copy; 2024 RevShop. All Rights Reserved.</p>
		</div>
	</footer>

</body>
</html>
