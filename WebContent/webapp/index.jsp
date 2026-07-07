<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>FoodZone | Home</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

html{
scroll-behavior:smooth;
}

body{

background:#F5F7F7;
overflow-x:hidden;

}

/*======================
NAVBAR
=======================*/

header{

position:fixed;
top:0;
left:0;

width:100%;
height:80px;

background:#0B6E4F;

display:flex;
justify-content:space-between;
align-items:center;

padding:0 70px;

box-shadow:0 6px 20px rgba(0,0,0,.12);

z-index:999;

}

.logo{

display:flex;
align-items:center;

font-size:28px;
font-weight:700;
color:white;

gap:12px;

}

.logo i{

color:#F4B400;
font-size:34px;

}

nav ul{

display:flex;
align-items:center;

list-style:none;

gap:42px;

}

nav ul li{

list-style:none;

}

nav ul li a{

text-decoration:none;

color:white;

font-size:16px;
font-weight:600;

transition:.3s;

}

nav ul li a:hover{

color:#F4B400;

}

nav ul li a.active{

color:#F4B400;

}

/*======================
HERO SECTION
=======================*/

.hero{

margin-top:70px;

padding:50px 8%;

display:flex;
justify-content:space-between;
align-items:center;

background:#F5F7F7;

min-height:650px;

overflow:hidden;

}

.hero-text{

width:48%;

animation:slideLeft 1.2s ease;

}

.hero-text h1{

font-size:72px;

line-height:1.25;

font-weight:800;

color:#0B6E4F;

margin-bottom:28px;

}

.hero-text span{

color:#F4B400;

}

.hero-text p{

font-size:20px;

line-height:1.8;

color:#555;

margin-bottom:45px;

max-width:700px;

}

/*======================
SEARCH BAR
=======================*/

.search-box{

display:flex;

align-items:center;

width:100%;

max-width:560px;

height:58px;

background:#fff;

border-radius:50px;

overflow:hidden;

box-shadow:0 10px 25px rgba(0,0,0,.12);

margin-bottom:35px;

}

.search-box input{

flex:1;

height:100%;

border:none;

outline:none;

padding:0 22px;

font-size:16px;

color:#333;

background:transparent;

}

.search-box input::placeholder{

color:#888;

}

.search-box button{

width:70px;

height:100%;

border:none;

background:#F4B400;

color:#fff;

font-size:20px;

cursor:pointer;

transition:.3s;

}

.search-box button:hover{

background:#E0A800;

}

.btn-primary{

display:inline-block;

background:#0B6E4F;

color:white;

padding:20px 45px;

border-radius:22px;

text-decoration:none;

font-size:20px;

font-weight:600;

transition:.35s;

}

.btn-primary:hover{

background:#09563F;

transform:translateY(-4px);

}

.hero-image{

width:46%;

display:flex;
justify-content:center;

animation:slideDown 1.3s ease;

}

.hero-image img{

width:100%;

max-width:700px;

border-radius:30px;

box-shadow:0 15px 40px rgba(0,0,0,.15);

transition:.4s;

}

.hero-image img:hover{

transform:scale(1.03);

}

/*======================
ANIMATIONS
=======================*/

@keyframes slideLeft{

0%{

opacity:0;

transform:translateX(-120px);

}

100%{

opacity:1;

transform:translateX(0);

}

}

@keyframes slideDown{

0%{

opacity:0;

transform:translateY(-120px);

}

100%{

opacity:1;

transform:translateY(0);

}

}

@keyframes fadeUp{

0%{

opacity:0;

transform:translateY(50px);

}

100%{

opacity:1;

transform:translateY(0);

}

}

section{

padding:90px 8%;

}

section h2{

text-align:center;

font-size:60px;

font-weight:700;

color:#0B6E4F;

margin-bottom:65px;

}
/*========================================
        POPULAR CATEGORIES
========================================*/

.categories{

background:#F5F7F7;

padding:20px 8% 90px;

animation:fadeUp 1s ease;

}

.category-grid{

display:flex;

justify-content:center;

align-items:center;

gap:22px;

flex-wrap:nowrap;

overflow-x:auto;

padding-bottom:8px;

}

.category-card{

width:180px;

height:170px;

background:#fff;

border-radius:20px;

display:flex;

flex-direction:column;

justify-content:center;

align-items:center;

flex-shrink:0;

box-shadow:0 8px 22px rgba(0,0,0,.08);

transition:.35s;

cursor:pointer;

}
.category-card:hover{

transform:translateY(-10px);

box-shadow:0 18px 35px rgba(0,0,0,.15);

}

.category-card .emoji{

font-size:48px;

margin-bottom:15px;

}

.category-card:hover .emoji{

transform:scale(1.2);

}

.category-card h3{

font-size:20px;

font-weight:700;

color:#222;

}

/*========================================
        FEATURED RESTAURANTS
========================================*/

.restaurants{

background:#F5F7F7;

padding:40px 8% 90px;

animation:fadeUp 1s ease;

}

.restaurant-grid{

display:grid;

grid-template-columns:repeat(3,270px);

justify-content:center;

gap:35px;

}

.restaurant-card{

width:270px;

background:#fff;

border-radius:20px;

overflow:hidden;

box-shadow:0 10px 25px rgba(0,0,0,.08);

transition:.3s;

}

.restaurant-card:hover{

transform:translateY(-8px);

box-shadow:0 18px 35px rgba(0,0,0,.15);

}

.restaurant-card img{

width:100%;

height:170px;

object-fit:cover;

transition:.4s;

}

.restaurant-card:hover img{

transform:scale(1.05);

}

.restaurant-details{

padding:18px;

}

.restaurant-details h3{

color:#0B6E4F;

font-size:20px;

font-weight:700;

margin-bottom:12px;

}

.rating{

color:#F4B400;

font-size:15px;

font-weight:600;

margin-bottom:12px;

}

.address{

background:#F4F4F4;

padding:12px;

border-radius:10px;

font-size:15px;

color:#666;

margin-bottom:18px;

}

.restaurant-details button{

width:100%;

padding:12px;

border:none;

border-radius:10px;

background:#0B6E4F;

color:#fff;

font-size:16px;

font-weight:600;

cursor:pointer;

transition:.3s;

}

.restaurant-details button:hover{

background:#F4B400;

color:#fff;

}

/*========================================
            TODAY'S OFFERS
========================================*/

.offers{

background:#FFFFFF;

padding:40px 8% 90px;

animation:fadeUp 1s ease;

}

.offer-container{

display:flex;

justify-content:center;

gap:30px;

flex-wrap:wrap;

}

.offer-card{

width:320px;

background:linear-gradient(135deg,#0B6E4F,#13865E);

padding:35px 25px;

border-radius:22px;

color:#fff;

text-align:center;

box-shadow:0 10px 25px rgba(0,0,0,.12);

transition:.35s;

}

.offer-card:hover{

transform:translateY(-10px);

box-shadow:0 18px 35px rgba(0,0,0,.18);

}

.offer-card h3{

font-size:34px;

margin-bottom:15px;

color:#FFD54F;

}

.offer-card p{

font-size:18px;

line-height:1.7;

}

/*========================================
                FOOTER
========================================*/

footer{

background:#0B6E4F;

color:white;

text-align:center;

padding:45px 20px;

}

footer h2{

font-size:34px;

margin-bottom:15px;

color:#FFD54F;

}

footer p{

font-size:16px;

margin:8px 0;

opacity:.95;

}

/*========================================
            RESPONSIVE
========================================*/

@media(max-width:1200px){

.restaurant-grid{

grid-template-columns:repeat(2,270px);

}

}

@media(max-width:900px){

header{

padding:18px 5%;

}

.hero{

flex-direction:column;

text-align:center;

padding:70px 5%;

}

.hero-text{

width:100%;

margin-bottom:40px;

}

.search-box{

margin:0 auto 35px;

max-width:500px;

}

.hero-image{

width:100%;

}

.hero-text h1{

font-size:46px;

}

.hero-buttons{

justify-content:center;

}

.restaurant-grid{

grid-template-columns:repeat(2,270px);

}

}

@media(max-width:650px){

nav ul{

flex-wrap:wrap;

justify-content:center;

gap:16px;

}

.hero-text h1{

font-size:36px;

}

.restaurant-grid{

grid-template-columns:270px;

}

.category-card{

width:260px;

}

.offer-card{

width:260px;

}

section h2{

font-size:32px;

}

}

</style>

</head>

<body>

<header>

<div class="logo">

<i class="fa-solid fa-utensils"></i>

FoodZone

</div>

<nav>

<ul>

<li><a class="active" href="index.jsp">Home</a></li>

<li><a href="restaurants">Restaurants</a></li>

<li><a href="cart.jsp">Cart</a></li>

<li><a href="myOrders">Orders</a></li>

<li><a href="profile.jsp">Profile</a></li>

<li><a href="login.jsp">Login</a></li>

<li><a href="register.jsp">Register</a></li>

<li>
<a href="logout">
<i class="fa-solid fa-right-from-bracket"></i>
Logout
</a>
</li>

</ul>

</nav>

</header>

<section class="hero">

<div class="hero-text">

<h1>

Discover the Best

<br>

<span>Indian Food</span>

in Bengaluru

</h1>

<p>

Order delicious meals from Bengaluru's top restaurants with fast delivery right to your doorstep.

</p>

<!-- Search Bar -->

<form action="search" method="get" class="search-box">

    <input
        type="text"
        name="keyword"
        placeholder="Search restaurants, dishes or cuisines..."
        required>

    <button type="submit">

        <i class="fa-solid fa-magnifying-glass"></i>

    </button>

</form>

<a href="restaurants" class="btn-primary">

    Order Now

</a>

</div>

<div class="hero-image">

<img src="images/hero-banner.png" alt="Indian Food">

</div>

</section>

<!-- ===========================
        POPULAR CATEGORIES
=========================== -->

<section class="categories">

<h2>Popular Categories</h2>

<div class="category-grid">

<div class="category-card">

<div class="emoji">🍛</div>

<h3>Meals</h3>

</div>

<div class="category-card">

<div class="emoji">🍕</div>

<h3>Pizza</h3>

</div>

<div class="category-card">

<div class="emoji">🍔</div>

<h3>Burgers</h3>

</div>

<div class="category-card">

<div class="emoji">🍜</div>

<h3>Noodles</h3>

</div>

<div class="category-card">

<div class="emoji">🍰</div>

<h3>Desserts</h3>

</div>

</div>

</section>

<!-- ===========================
        FEATURED RESTAURANTS
=========================== -->

<section class="restaurants">

<h2>Featured Restaurants</h2>

<div class="restaurant-grid">

<div class="restaurant-card">

<img src="images/restaurants/meghana.jpg" alt="Meghana Foods">

<div class="restaurant-details">

<h3>Meghana Foods</h3>

<p class="rating">⭐ 4.7 • 30 mins</p>

<p class="address">📍 Koramangala, Bengaluru</p>

<a href="restaurants">

<button>View Menu</button>

</a>

</div>

</div>

<div class="restaurant-card">

<img src="images/restaurants/empire.jpg" alt="Empire Restaurant">

<div class="restaurant-details">

<h3>Empire Restaurant</h3>

<p class="rating">⭐ 4.5 • 25 mins</p>

<p class="address">📍 Indiranagar, Bengaluru</p>

<a href="restaurants">

<button>View Menu</button>

</a>

</div>

</div>

<div class="restaurant-card">

<img src="images/restaurants/truffle.jpg" alt="Truffles">

<div class="restaurant-details">

<h3>Truffles</h3>

<p class="rating">⭐ 4.6 • 20 mins</p>

<p class="address">📍 Koramangala, Bengaluru</p>

<a href="restaurants">

<button>View Menu</button>

</a>

</div>

</div>

</div>

</section>

<!-- ===========================
        TODAY'S OFFERS
=========================== -->

<section class="offers">

<h2>Today's Offers</h2>

<div class="offer-container">

<div class="offer-card">

<h3>20% OFF</h3>

<p>On Orders Above ₹499</p>

</div>

<div class="offer-card">

<h3>FREE DELIVERY</h3>

<p>For First Time Users</p>

</div>

<div class="offer-card">

<h3>BUY 1 GET 1</h3>

<p>On Selected Dishes</p>

</div>

</div>

</section>

<!-- ===========================
            FOOTER
=========================== -->

<footer>

<h2>FoodZone</h2>

<p>Your favourite food delivery partner in Bengaluru.</p>

<p>© 2026 FoodZone. All Rights Reserved.</p>

</footer>

</body>

</html>