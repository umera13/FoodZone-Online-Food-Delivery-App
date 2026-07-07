<%@page import="com.food.model.User"%>
<%@page import="com.food.model.Cart"%>
<%@page import="com.food.model.CartItem"%>
<%@page import="java.util.Map"%>

<%
User user=(User)request.getAttribute("user");
Cart cart=(Cart)request.getAttribute("cart");
double totalAmount=(Double)request.getAttribute("totalAmount");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<title>Checkout | FoodZone</title>

<link rel="preconnect"
href="https://fonts.googleapis.com">

<link rel="preconnect"
href="https://fonts.gstatic.com"
crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:linear-gradient(135deg,#0B6E4F,#13865E,#F4B400);
    min-height:100vh;
    padding:25px;
}

.container{
    width:100%;
    max-width:1250px;
    margin:auto;
    background:#fff;
    border-radius:22px;
    overflow:hidden;
    box-shadow:0 18px 40px rgba(0,0,0,.18);
}

.header{
    background:linear-gradient(90deg,#0B6E4F,#13865E);
    color:#fff;
    padding:18px 30px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.header h1{
    font-size:28px;
    font-weight:700;
}

.logo{
    font-size:26px;
    color:#FFD54F;
    font-weight:700;
}

.checkout{
    display:grid;
    grid-template-columns:2fr 1fr;
    gap:22px;
    padding:22px;
}

.left{
    display:flex;
    flex-direction:column;
    gap:18px;
}

.right{
    position:sticky;
    top:20px;
    height:fit-content;
}

.card{
    background:#fff;
    border-radius:18px;
    padding:18px 20px;
    box-shadow:0 5px 18px rgba(0,0,0,.08);
    border-top:5px solid #F4B400;
}

.card h2{
    display:flex;
    align-items:center;
    gap:10px;
    color:#0B6E4F;
    font-size:20px;
    margin-bottom:18px;
}

.info{
    display:flex;
    align-items:center;
    margin-bottom:14px;
}

.icon{
    width:40px;
    height:40px;
    border-radius:50%;
    display:flex;
    justify-content:center;
    align-items:center;
    color:#fff;
    font-size:16px;
    margin-right:14px;
}

.user{
    background:#43A047;
}

.email{
    background:#1E88E5;
}

.phone{
    background:#FB8C00;
}

.address{
    background:#D81B60;
}

.info strong{
    display:block;
    font-size:15px;
    color:#222;
}

.info span{
    color:#666;
    font-size:14px;
}

.address-option{
    display:flex;
    gap:14px;
    align-items:flex-start;
    padding:14px;
    border:1px solid #e5e5e5;
    border-radius:14px;
    margin-bottom:14px;
    cursor:pointer;
    transition:.3s;
}

.address-option:hover{
    border-color:#0B6E4F;
    background:#F8FFF9;
}

.address-option input{
    margin-top:6px;
}

.address-content{
    display:flex;
    gap:12px;
    width:100%;
}

.address-content i{
    color:#0B6E4F;
    font-size:20px;
    margin-top:3px;
}

textarea{
    width:100%;
    border:1px solid #ddd;
    border-radius:10px;
    padding:12px;
    resize:none;
    font-size:14px;
    outline:none;
}

textarea:focus{
    border-color:#0B6E4F;
}

/* ================= PAYMENT ================= */

.payment-dropdown{
    border:1px solid #ddd;
    border-radius:12px;
    overflow:hidden;
    background:#fff;
}

.payment-dropdown summary{
    list-style:none;
    display:flex;
    justify-content:space-between;
    align-items:center;
    cursor:pointer;
    padding:12px 16px;
    background:#f8f9fa;
    font-size:15px;
    font-weight:600;
    color:#0B6E4F;
}

.payment-dropdown summary::-webkit-details-marker{
    display:none;
}

.payment-option{
    display:flex;
    align-items:flex-start;
    gap:10px;
    padding:12px 15px;
    border-top:1px solid #eee;
    transition:.3s;
}

.payment-option:hover{
    background:#F8FFF8;
}

.payment-option input[type=radio]{
    margin-top:4px;
}

.payment-content{
    flex:1;
}

.payment-content strong{
    font-size:14px;
    color:#222;
}

.payment-content span{
    font-size:12px;
    color:#666;
}

.payment-input{
    width:100%;
    margin-top:8px;
    padding:8px 10px;
    border:1px solid #ccc;
    border-radius:8px;
    font-size:13px;
    outline:none;
}

.payment-input:focus{
    border-color:#0B6E4F;
}

.card-row{
    display:flex;
    gap:10px;
    margin-top:8px;
}

.half-input{
    flex:1;
    padding:8px 10px;
    border:1px solid #ccc;
    border-radius:8px;
    font-size:13px;
}

/* ================= ORDER SUMMARY ================= */

.summary-row{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:10px 0;
    border-bottom:1px solid #eee;
    font-size:14px;
}

.summary-row strong{
    font-size:14px;
}

.summary-row span{
    font-size:13px;
}

.total-box{
    margin-top:14px;
    padding:14px;
    background:#E8F5E9;
    border-radius:12px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    font-size:18px;
    font-weight:700;
    color:#0B6E4F;
}

.place-btn{
    width:100%;
    margin-top:16px;
    padding:13px;
    border:none;
    border-radius:10px;
    background:linear-gradient(90deg,#FF9800,#F4B400);
    color:#fff;
    font-size:16px;
    font-weight:600;
    cursor:pointer;
    transition:.3s;
}

.place-btn:hover{
    transform:translateY(-2px);
    background:linear-gradient(90deg,#0B6E4F,#13865E);
    box-shadow:0 8px 18px rgba(0,0,0,.18);
}

/* ================= ADDRESS ================= */

.address-option{
    display:flex;
    align-items:flex-start;
    gap:12px;
    padding:12px;
    margin-bottom:12px;
    border:1px solid #ddd;
    border-radius:10px;
    transition:.3s;
}

.address-option:hover{
    border-color:#0B6E4F;
    background:#FAFFFB;
}

.address-content{
    display:flex;
    gap:10px;
    width:100%;
}

.address-content i{
    color:#0B6E4F;
    font-size:18px;
    margin-top:2px;
}

.address-content b{
    font-size:14px;
}

.address-content textarea{
    margin-top:8px;
    width:100%;
    padding:10px;
    border-radius:8px;
    border:1px solid #ccc;
    resize:none;
    font-size:13px;
}

@media(max-width:950px){

.checkout{
    grid-template-columns:1fr;
}

.right{
    position:static;
}

.card-row{
    flex-direction:column;
}

}

</style>

</head>

<body>

<div class="container">

    <!-- HEADER -->

    <div class="header">

        <h1>

            <i class="fa-solid fa-cart-shopping"></i>

            Checkout

        </h1>

        <div class="logo">

            <i class="fa-solid fa-utensils"></i>

            FoodZone

        </div>

    </div>

<form action="placeOrder" method="post">

<div class="checkout">

<!-- ================= LEFT SIDE ================= -->

<div class="left">

<!-- DELIVERY DETAILS -->

<div class="card">

<h2>

<i class="fa-solid fa-user"></i>

Delivery Details

</h2>

<div class="info">

<div class="icon user">

<i class="fa-solid fa-user"></i>

</div>

<div>

<strong>Name</strong>

<span><%=user.getName()%></span>

</div>

</div>

<div class="info">

<div class="icon email">

<i class="fa-solid fa-envelope"></i>

</div>

<div>

<strong>Email</strong>

<span><%=user.getEmail()%></span>

</div>

</div>

<div class="info">

<div class="icon phone">

<i class="fa-solid fa-phone"></i>

</div>

<div>

<strong>Phone Number</strong>

<span><%=user.getPhone()%></span>

</div>

</div>

</div>

<!-- ADDRESS -->

<div class="card">

<h2>

<i class="fa-solid fa-location-dot"></i>

Delivery Address

</h2>

<label class="address-option">

<input
type="radio"
name="addressType"
value="saved"
checked>

<div class="address-content">

<i class="fa-solid fa-house"></i>

<div>

<strong>Saved Address</strong>

<div style="margin-top:4px;color:#666;">

<%=user.getAddress()%>

</div>

</div>

</div>

</label>

<label class="address-option">

<input
type="radio"
name="addressType"
value="other">

<div class="address-content">

<i class="fa-solid fa-location-dot"></i>

<div style="width:100%;">

<strong>Deliver To Another Address</strong>

<textarea

name="deliveryAddress"

rows="3"

placeholder="Enter another delivery address"

style="margin-top:10px;">

</textarea>

</div>

</div>

</label>

<div class="info">

<div class="icon address">

<i class="fa-solid fa-truck-fast"></i>

</div>

<div>

<strong>Estimated Delivery</strong>

<span>25 - 35 Minutes</span>

</div>

</div>

</div>

<!-- PAYMENT -->

<div class="card">

<h2>

<i class="fa-solid fa-wallet"></i>

Payment Method

</h2>

<details class="payment-dropdown">

<summary>

<span>Select Payment Method</span>

<i class="fa-solid fa-chevron-down"></i>

</summary>

<label class="payment-option">

<input

type="radio"

name="paymentMethod"

value="Cash On Delivery"

checked>

<div class="payment-content">

<strong>Cash On Delivery</strong>

<div style="color:#777;font-size:13px;margin-top:3px;">

Pay when your food arrives

</div>

</div>

</label>

<label class="payment-option">

<input

type="radio"

name="paymentMethod"

value="UPI">

<div class="payment-content">

<strong>UPI Payment</strong>

<div style="color:#777;font-size:13px;">

Google Pay &#8226; PhonePe &#8226; Paytm

</div>

<input

type="text"

name="upiId"

class="payment-input"

placeholder="Enter UPI ID">

</div>

</label>

<label class="payment-option">

<input

type="radio"

name="paymentMethod"

value="Card">

<div class="payment-content">

<strong>Credit / Debit Card</strong>

<input

type="text"

name="cardNumber"

class="payment-input"

placeholder="Card Number">

<input

type="text"

name="cardHolder"

class="payment-input"

placeholder="Card Holder Name">

<div class="card-row">

<input

type="text"

name="expiry"

class="half-input"

placeholder="MM/YY">

<input

type="password"

maxlength="3"

name="cvv"

class="half-input"

placeholder="CVV">

</div>

</div>

</label>

</details>

</div>

<!-- INSTRUCTIONS -->

<div class="card">

<h2>

<i class="fa-solid fa-note-sticky"></i>

Delivery Instructions

</h2>

<textarea

name="instructions"

rows="2"

placeholder="Example : Ring the bell once, Leave at the door...">

</textarea>

</div>

</div>

<!-- ================= RIGHT SIDE STARTS HERE ================= -->

<div class="right">

<div class="card">

<h2>

<i class="fa-solid fa-receipt"></i>

Order Summary

</h2>

        <!-- RIGHT SIDE -->

        <div class="right">

            <div class="card">

                <h2>

                    <i class="fa-solid fa-cart-shopping"></i>

                    Order Summary

                </h2>

<%

double deliveryCharge = 40.00;

double gst = totalAmount * 0.05;

double grandTotal = totalAmount + deliveryCharge + gst;

for(CartItem item : cart.getItems().values()){

%>

                <div class="summary-row">

                    <div>

                        <strong>

                            <%=item.getMenu().getItemName()%>

                        </strong>

                        <br>

                        <span>

                            Qty : <%=item.getQuantity()%>

                        </span>

                    </div>

                    <div>

                       &#8377;<%=String.format("%.2f",item.getTotalPrice())%>

                    </div>

                </div>

<%
}
%>

                <div class="summary-row">

                    <span>

                        Food Total

                    </span>

                    <strong>

                        &#8377; <%=String.format("%.2f",totalAmount)%>

                    </strong>

                </div>

                <div class="summary-row">

                    <span>

                        Delivery Charge

                    </span>

                    <strong>

                        &#8377; 40.00

                    </strong>

                </div>

                <div class="summary-row">

                    <span>

                        GST (5%)

                    </span>

                    <strong>

                       &#8377;<%=String.format("%.2f",gst)%>

                    </strong>

                </div>

                <div class="total-box">

                    <span>

                        Grand Total

                    </span>

                    <span>

                      &#8377;<%=String.format("%.2f",grandTotal)%>

                    </span>

                </div>

                <input
                type="hidden"
                name="restaurantId"
                value="<%=cart.getRestaurantId()%>">

                <input
                type="hidden"
                name="totalAmount"
                value="<%=grandTotal%>">

                <button
                type="submit"
                class="place-btn">

                    <i class="fa-solid fa-check"></i>

                    Place Order

                </button>

            </div>

        </div>


    </form>
    
    </div>

</div>

</body>

</html>