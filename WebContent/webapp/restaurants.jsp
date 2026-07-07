<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.food.model.Restaurant" %>

<%
List<Restaurant> restaurantList =
(List<Restaurant>)request.getAttribute("restaurantList");
%>

<!DOCTYPE html>
<html>


<head>

<meta charset="UTF-8">

<title>Restaurants | FoodZone</title>

<link rel="stylesheet" href="css/style.css">

<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>



/* ================= RESTAURANTS PAGE ================= */

.restaurants-page{
    max-width:1350px;
    margin:70px auto 60px;
    padding:0 30px;
}

/* ================= RESTAURANT LOAD ANIMATION ================= */

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

.restaurants-page h1{
    text-align:center;
    font-size:58px;
    font-weight:700;
    color:#0B6E4F;
    margin-bottom:8px;
}

.restaurants-page .subtitle{
    text-align:center;
    font-size:20px;
    color:#666;
    margin:20px auto 40px;
    margin-bottom:35px;
}

/* ================= RESTAURANT GRID ================= */

.restaurant-grid{
    display:grid;
    grid-template-columns:repeat(4, 270px);
    justify-content:center;
    gap:35px;
}

/* ================= RESTAURANT CARD ================= */


.restaurant-card{

width:270px;

background:#fff;

border-radius:20px;

overflow:hidden;

box-shadow:0 10px 25px rgba(0,0,0,.08);

transition:.3s;

opacity:0;

animation:slideDown .8s ease forwards;

}

.restaurant-card:hover{

transform:translateY(-8px);

box-shadow:0 18px 35px rgba(0,0,0,.15);

}

.restaurant-card:hover{
    transform:translateY(-8px);
    box-shadow:0 18px 35px rgba(0,0,0,.15);
}

/* ================= STAGGER ANIMATION ================= */

.restaurant-card:nth-child(1){animation-delay:.1s;}

.restaurant-card:nth-child(2){animation-delay:.2s;}

.restaurant-card:nth-child(3){animation-delay:.3s;}

.restaurant-card:nth-child(4){animation-delay:.4s;}

.restaurant-card:nth-child(5){animation-delay:.5s;}

.restaurant-card:nth-child(6){animation-delay:.6s;}

.restaurant-card:nth-child(7){animation-delay:.7s;}

.restaurant-card:nth-child(8){animation-delay:.8s;}

.restaurant-card:nth-child(9){animation-delay:.9s;}

.restaurant-card:nth-child(10){animation-delay:1s;}

.restaurant-card:nth-child(11){animation-delay:1.1s;}

.restaurant-card:nth-child(12){animation-delay:1.2s;}

/* ================= IMAGE ================= */

.restaurant-card img{
    width:100%;
    height:170px;
    object-fit:cover;
}

/* ================= DETAILS ================= */

.restaurant-details{
    padding:18px;
}

.restaurant-details h3{
    color:#0B6E4F;
    font-size:20px;
    font-weight:700;
    margin-bottom:12px;
}

.restaurant-details p{
    color:#666;
    font-size:15px;
    line-height:24px;
    margin-bottom:10px;
}

.restaurant-details p:first-of-type{
    color:#F4B400;
    font-weight:600;
}

/* ================= BUTTON ================= */

.restaurant-details a{
    text-decoration:none;
}

.restaurant-details button{
    width:100%;
    padding:12px;
    margin-top:12px;
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
}

/* ================= RESPONSIVE ================= */

@media(max-width:1200px){

    .restaurant-grid{
        grid-template-columns:repeat(3,270px);
    }

}

@media(max-width:900px){

    .restaurants-page{
        padding:0 20px 50px;
    }

    .restaurants-page h1{
        font-size:42px;
    }

    .restaurant-grid{
        grid-template-columns:repeat(2,270px);
        gap:30px;
    }

}

@media(max-width:650px){

    .restaurant-grid{
        grid-template-columns:270px;
    }

    .restaurants-page h1{
        font-size:34px;
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

            <li><a href="index.jsp">Home</a></li>

            <li><a class="active" href="restaurants.jsp">Restaurants</a></li>

            <li><a href="cart.jsp">Cart</a></li>

            <li><a href="myOrders">Orders</a></li>

            <li><a href="profile.jsp">Profile</a></li>

            <li><a href="login.jsp">Login</a></li>

            <li><a href="register.jsp">Register</a></li>

        </ul>

    </nav>

</header>

<section class="restaurants-page">

    <h2>Explore Restaurants</h2>

    <p class="subtitle">
        Discover Bengaluru's best restaurants and order your favourite meals.
    </p>

    <div class="restaurant-grid">

    <%
    if(restaurantList != null){

        for(Restaurant restaurant : restaurantList){
    %>

        <div class="restaurant-card">

            <img
            src="<%= restaurant.getImagePath() %>"
            alt="<%= restaurant.getName() %>">

            <div class="restaurant-details">

                <h3><%= restaurant.getName() %></h3>

                <p>
                    ⭐ <%= restaurant.getRatings() %>
                    •
                    <%= restaurant.getDeliveryTime() %> mins
                </p>

                <p>
                    📍 <%= restaurant.getAddress() %>
                </p>

                <p>
                    🍽 <%= restaurant.getCuisineType() %>
                </p>

                <a href="MenuServlet?restaurantID=<%= restaurant.getRestaurantID() %>">

                    <button>
                        View Menu
                    </button>

                </a>

            </div>

        </div>

    <%
        }
    }
    %>

    </div>

</section>
</body>
</html>