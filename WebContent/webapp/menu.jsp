<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.model.Menu"%>

<%
List<Menu> menuList =
(List<Menu>)request.getAttribute("getMenuByRestaurantId");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Menu | FoodZone</title>

<link rel="stylesheet" href="css/style.css">

<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<link rel="stylesheet" href="css/style.css">

<style>

/* ================= MENU CARD LOAD ANIMATION ================= */

@keyframes slideDown{

from{

opacity:0;

transform:translateY(-60px) scale(.95);

}

to{

opacity:1;

transform:translateY(0) scale(1);

}

}

/* Animate all menu cards */

.food-card{

animation:slideDown .8s ease forwards;

opacity:0;

}

/* Show cards one by one */

.food-card:nth-child(1){animation-delay:.1s;}
.food-card:nth-child(2){animation-delay:.2s;}
.food-card:nth-child(3){animation-delay:.3s;}
.food-card:nth-child(4){animation-delay:.4s;}
.food-card:nth-child(5){animation-delay:.5s;}
.food-card:nth-child(6){animation-delay:.6s;}
.food-card:nth-child(7){animation-delay:.7s;}
.food-card:nth-child(8){animation-delay:.8s;}
.food-card:nth-child(9){animation-delay:.9s;}
.food-card:nth-child(10){animation-delay:1s;}
.food-card:nth-child(11){animation-delay:1.1s;}
.food-card:nth-child(12){animation-delay:1.2s;}

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

            <li><a href="index.jsp">Home</a></li>

            <li><a class="active" href="restaurants">Restaurants</a></li>

            <li><a href="cart.jsp">Cart</a></li>

            <li><a href="myOrders">Orders</a></li>

            <li><a href="profile.jsp">Profile</a></li>

            <li><a href="login.jsp">Login</a></li>

            <li><a href="register.jsp">Register</a></li>

        </ul>

    </nav>

</header>

<section class="menu-page">

<h1>Restaurant Menu</h1>

<p>
Choose your favourite dishes and add them to cart
</p>

<%
if(menuList != null && !menuList.isEmpty()){
%>

<div class="menu-grid">

<%
for(Menu menu : menuList){
%>

<div class="food-card">

<img
src="<%=menu.getImagePath()%>"
alt="<%=menu.getItemName()%>">

<div class="food-info">

<h3>
<%=menu.getItemName()%>
</h3>

<p>
<%=menu.getDescription()%>
</p>

<div class="price-row">

<span class="price">
₹ <%=menu.getPrice()%>
</span>

<%
if(menu.isAvailable()){
%>

<form action="addToCart" method="post">

    <input
    type="hidden"
    name="action"
    value="add">

    <input
    type="hidden"
    name="menuID"
    value="<%=menu.getMenuID()%>">

    <button type="submit">

        Add To Cart

    </button>

</form>

<%
}else{
%>

<button disabled>
Out Of Stock
</button>

<%
}
%>

</div>

</div>

</div>

<%
}
%>

</div>

<%
}
else{
%>

<h2 style="text-align:center;color:red;">
No Menu Items Available
</h2>

<%
}
%>

</section>

<footer>

<h2>FoodZone</h2>

<p>Your favourite food delivery partner in Bengaluru.</p>

<p>© 2026 FoodZone. All Rights Reserved.</p>

</footer>

</body>
</html>