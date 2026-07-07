<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.food.model.Cart"%>
<%@ page import="com.food.model.CartItem"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<title>FoodZone | Cart</title>

<link rel="stylesheet"
href="css/style.css">

<style>

/*================ CART PAGE ================*/

.cart-page{
    max-width:1300px;
    margin:50px auto;
    padding:0 20px;
}

.cart-heading{
    text-align:center;
    margin-bottom:40px;
}

.cart-heading h1{
    font-size:42px;
    color:#0B6E4F;
    margin-bottom:10px;
}

.cart-heading p{
    color:#666;
    font-size:17px;
}

/*================ LAYOUT ================*/

.cart-layout{
    display:grid;
    grid-template-columns:2fr 420px;
    gap:35px;
    align-items:start;
}
/*================ CART ITEMS ================*/

.cart-items{
    display:flex;
    flex-direction:column;
    gap:25px;
}

.cart-item-card{
    width:100%;
    background:#fff;
    border-radius:18px;
    padding:20px;
    display:flex;
    align-items:center;
    gap:20px;
    box-shadow:0 5px 15px rgba(0,0,0,.08);
    transition:.3s;
}

.cart-item-card:hover{
    transform:translateY(-4px);
}

.cart-item-image img{
    width:140px;
    height:120px;
    object-fit:cover;
    border-radius:15px;
}

.cart-item-details{
    flex:1;
}

.cart-item-details h2{
    color:#0B6E4F;
    margin-bottom:10px;
    font-size:24px;
}

.cart-item-details p{
    color:#666;
    line-height:24px;
    margin-bottom:15px;
}

.item-price{
    font-size:22px;
    color:#ff6b35;
    font-weight:700;
}

/*================ ACTIONS ================*/

.cart-item-actions{
    display:flex;
    flex-direction:column;
    align-items:flex-end;
    gap:15px;
}

.quantity-box{
    display:flex;
    align-items:center;
    gap:12px;
}

.quantity-box form{
    display:inline;
}

.quantity-box button{
    width:38px;
    height:38px;
    border:none;
    border-radius:8px;
    background:#0B6E4F;
    color:#fff;
    font-size:20px;
    cursor:pointer;
    transition:.3s;
}

.quantity-box button:hover{
    background:#F4B400;
}

.quantity-box span{
    font-size:20px;
    font-weight:600;
    width:30px;
    text-align:center;
}

.item-total{
    font-size:22px;
    font-weight:700;
    color:#333;
}

.remove-btn{
    padding:12px 18px;
    background:#dc3545;
    color:#fff;
    border:none;
    border-radius:8px;
    cursor:pointer;
    font-weight:600;
    transition:.3s;
}

.remove-btn:hover{
    background:#b02a37;
}

/*================ ORDER SUMMARY ================*/

.summary-card{

    width:100%;
    background:#fff;

    padding:35px;

    border-radius:20px;

    box-shadow:0 10px 25px rgba(0,0,0,.08);

    position:sticky;
    top:100px;
}
.summary-card h2{
    color:#0B6E4F;
    margin-bottom:25px;
    text-align:center;
}

.summary-row{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin:18px 0;
    color:#444;
    font-size:18px;
}

.summary-total{
    display:flex;
    justify-content:space-between;
    margin:25px 0;
    font-size:24px;
    font-weight:bold;
    color:#ff6b35;
}

.summary-card hr{
    margin:20px 0;
    border:none;
    border-top:1px solid #ddd;
}

/*================ BUTTONS ================*/

.add-more-btn,
.checkout-btn{
    width:100%;
    display:block;
    text-align:center;
    padding:14px;
    border:none;
    border-radius:10px;
    text-decoration:none;
    font-size:16px;
    font-weight:600;
    cursor:pointer;
    transition:.3s;
}

.add-more-btn{
    background:#0B6E4F;
    color:#fff;
    margin-bottom:15px;
}

.add-more-btn:hover{
    background:#08734f;
}

.checkout-btn{
    background:#ff6b35;
    color:#fff;
}

.checkout-btn:hover{
    background:#e55b2b;
}

/*================ EMPTY CART ================*/

.empty-cart{
    background:#fff;
    border-radius:20px;
    padding:70px 40px;
    text-align:center;
    box-shadow:0 5px 15px rgba(0,0,0,.08);
}

.empty-cart i{
    font-size:80px;
    color:#0B6E4F;
    margin-bottom:20px;
}

.empty-cart h2{
    font-size:34px;
    margin-bottom:15px;
    color:#0B6E4F;
}

.empty-cart p{
    color:#666;
    margin-bottom:30px;
}

.browse-btn{
    display:inline-block;
    background:#0B6E4F;
    color:#fff;
    padding:14px 28px;
    border-radius:10px;
    text-decoration:none;
    font-weight:600;
    transition:.3s;
}

.browse-btn:hover{
    background:#08734f;
}

/*================ RESPONSIVE ================*/

@media(max-width:992px){

.cart-layout{
    grid-template-columns:1fr;
}

.summary-card{
    position:static;
}

.cart-item-card{
    flex-direction:column;
    text-align:center;
}

.cart-item-actions{
    width:100%;
    align-items:center;
}

.cart-item-image img{
    width:100%;
    max-width:280px;
    height:180px;
}

}

</style>
<link rel="preconnect"
href="https://fonts.googleapis.com">

<link
href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

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

<li><a href="restaurants.jsp">Restaurants</a></li>

<li><a class="active" href="cart.jsp">Cart</a></li>

<li><a href="myOrders">Orders</a></li>

<li><a href="profile.jsp">Profile</a></li>

<li><a href="login.jsp">Login</a></li>

<li><a href="register.jsp">Register</a></li>

</ul>

</nav>

</header>

<section class="cart-page">

<div class="cart-heading">

<h1>

🛒 Your Cart

</h1>

<p>

Review your selected items before placing your order.

</p>

</div>

<%

Cart cart = (Cart)session.getAttribute("cart");

if(cart != null && !cart.isEmpty()){

double subtotal = cart.getTotalAmount();

double deliveryFee = 40;

double gst = subtotal * 0.05;

double grandTotal = subtotal + deliveryFee + gst;

%>

<div class="cart-layout">

<div class="cart-items">
<%

for(CartItem item : cart.getItems().values()){

%>

<div class="cart-item-card">

    <div class="cart-item-image">

        <img
        src="<%= item.getMenu().getImagePath() %>"
        alt="<%= item.getMenu().getItemName() %>">

    </div>

    <div class="cart-item-details">

        <h2>

            <%= item.getMenu().getItemName() %>

        </h2>

        <p>

            <%= item.getMenu().getDescription() %>

        </p>

        <div class="item-price">

            ₹ <%= String.format("%.2f", item.getMenu().getPrice()) %>

        </div>

    </div>

    <div class="cart-item-actions">

        <div class="quantity-box">

            <form action="addToCart" method="post">

                <input
                type="hidden"
                name="action"
                value="update">

                <input
                type="hidden"
                name="menuID"
                value="<%= item.getMenu().getMenuID() %>">

                <input
                type="hidden"
                name="restaurantID"
                value="<%= item.getMenu().getRestaurantID() %>">

                <input
                type="hidden"
                name="quantity"
                value="<%= item.getQuantity()-1 %>">

                <button type="submit">

                    -

                </button>

            </form>

            <span>

                <%= item.getQuantity() %>

            </span>

            <form action="addToCart" method="post">

                <input
                type="hidden"
                name="action"
                value="update">

                <input
                type="hidden"
                name="menuID"
                value="<%= item.getMenu().getMenuID() %>">

                <input
                type="hidden"
                name="restaurantID"
                value="<%= item.getMenu().getRestaurantID() %>">

                <input
                type="hidden"
                name="quantity"
                value="<%= item.getQuantity()+1 %>">

                <button type="submit">

                    +

                </button>

            </form>

        </div>

        <div class="item-total">

            ₹ <%= String.format("%.2f", item.getTotalPrice()) %>

        </div>

        <form action="addToCart" method="post">

            <input
            type="hidden"
            name="action"
            value="remove">

            <input
            type="hidden"
            name="menuID"
            value="<%= item.getMenu().getMenuID() %>">

            <input
            type="hidden"
            name="restaurantID"
            value="<%= item.getMenu().getRestaurantID() %>">

            <button
            type="submit"
            class="remove-btn">

                <i class="fa-solid fa-trash"></i>

                Remove

            </button>

        </form>

    </div>

</div>

<%

}

%>
</div>

<div class="order-summary">

    <div class="summary-card">

        <h2>

            Order Details

        </h2>

        <div class="summary-row">

            <span>Total Items</span>

            <span>

                <%= cart.getItems().size() %>

            </span>

        </div>

        <div class="summary-row">

            <span>Subtotal</span>

            <span>

                ₹ <%= String.format("%.2f", subtotal) %>

            </span>

        </div>

        <div class="summary-row">

            <span>Delivery Fee</span>

            <span>

                ₹ <%= String.format("%.2f", deliveryFee) %>

            </span>

        </div>

        <div class="summary-row">

            <span>GST (5%)</span>

            <span>

                ₹ <%= String.format("%.2f", gst) %>

            </span>

        </div>

        <hr>

        <div class="summary-total">

            <span>Grand Total</span>

            <span>

                ₹ <%= String.format("%.2f", grandTotal) %>

            </span>

        </div>

        <a
        href="MenuServlet?restaurantID=<%= cart.getRestaurantId() %>"
        class="add-more-btn">

            <i class="fa-solid fa-plus"></i>

            Add More Items

        </a>

        <form
        action="checkout"
        >

            <button
            type="submit"
            class="checkout-btn">

                <i class="fa-solid fa-bag-shopping"></i>

                Place Order

            </button>

        </form>

    </div>

</div>

</div>


<%

}

else{

%>

<div class="empty-cart">

    <i class="fa-solid fa-cart-shopping"></i>

    <h2>

        Your Cart is Empty

    </h2>

    <p>

        Looks like you haven't added anything yet.

    </p>

    <a
    href="restaurants"
    class="browse-btn">

        Browse Restaurants

    </a>

</div>

<%

}

%>

</section>

<footer>

<h2>

FoodZone

</h2>

<p>

Your favourite food delivery partner in Bengaluru.

</p>

<p>

© 2026 FoodZone. All Rights Reserved.

</p>

</footer>

</body>

</html>