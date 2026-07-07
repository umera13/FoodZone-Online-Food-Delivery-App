<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Login | FoodZone</title>

<link rel="preconnect" href="https://fonts.googleapis.com">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

body{

    margin:0;
    padding:0;
    font-family:'Poppins',sans-serif;

    background:
    radial-gradient(circle at top left,#F4B400 0%,transparent 30%),
    radial-gradient(circle at bottom right,#22c55e 0%,transparent 35%),
    linear-gradient(135deg,#0B6E4F,#0d8a63,#14845d);

    min-height:100vh;

    display:flex;
    justify-content:center;
    align-items:center;

    padding:40px;
}

<div class="floating-icons">

<i class="fa-solid fa-pizza-slice icon1"></i>

<i class="fa-solid fa-burger icon2"></i>

<i class="fa-solid fa-ice-cream icon3"></i>

<i class="fa-solid fa-mug-hot icon4"></i>

<i class="fa-solid fa-cookie-bite icon5"></i>

<i class="fa-solid fa-bowl-food icon6"></i>

</div>


.floating-icons i{

position:fixed;

opacity:.08;

font-size:55px;

color:white;

animation:float 10s infinite ease-in-out;

}

.icon1{

top:10%;
left:7%;
}

.icon2{

top:25%;
right:8%;
animation-delay:2s;
}

.icon3{

bottom:12%;
left:10%;
animation-delay:3s;
}

.icon4{

bottom:18%;
right:10%;
animation-delay:4s;
}

.icon5{

top:50%;
left:3%;
animation-delay:5s;
}

.icon6{

top:65%;
right:4%;
animation-delay:6s;
}

@keyframes float{

0%{
transform:translateY(0px);
}

50%{
transform:translateY(-18px);
}

100%{
transform:translateY(0px);
}

}

.login-card{

width:1050px;
height:620px;
background:#fff;
border-radius:25px;
overflow:hidden;
display:flex;
box-shadow:0 20px 45px rgba(0,0,0,.15);

}

/*================ LEFT PANEL ================*/

.left-panel{

    width:45%;
    background:linear-gradient(135deg,#0B6E4F,#14936a);
    color:white;
    padding:60px 45px;
    display:flex;
    flex-direction:column;
    justify-content:center;
}

.left-panel .icon{

    width:100px;
    height:100px;
    background:rgba(255,255,255,.15);
    border-radius:50%;
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:45px;
    margin-bottom:30px;
}

.left-panel h1{

    font-size:42px;
    line-height:55px;
    margin-bottom:20px;
}

.left-panel p{

    font-size:17px;
    line-height:30px;
    opacity:.95;
    margin-bottom:40px;
}

.features{

    display:flex;
    flex-direction:column;
    gap:20px;
}

.feature{

    display:flex;
    align-items:center;
    gap:15px;
    font-size:17px;
}

.feature i{

    width:45px;
    height:45px;
    border-radius:50%;
    background:rgba(255,255,255,.18);
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:18px;
}

/*================ RIGHT PANEL ================*/

.right-panel{

    width:55%;
    padding:55px 60px;
    display:flex;
    flex-direction:column;
    justify-content:center;
}

.logo{

    font-size:34px;
    font-weight:700;
    color:#0B6E4F;
    margin-bottom:25px;
}

.logo i{

    color:#F4B400;
}

.right-panel h2{

    font-size:34px;
    color:#222;
    margin-bottom:10px;
}

.subtitle{

    color:#666;
    margin-bottom:35px;
    font-size:16px;
}

.input-group{

    position:relative;
    margin-bottom:22px;
}

.input-group i{

    position:absolute;
    left:18px;
    top:18px;
    color:#0B6E4F;
    font-size:18px;
}

.input-group input{

    width:100%;
    padding:15px 18px 15px 52px;
    border:1px solid #ddd;
    border-radius:12px;
    font-size:16px;
    outline:none;
    transition:.3s;
}

.input-group input:focus{

    border-color:#0B6E4F;
    box-shadow:0 0 10px rgba(11,110,79,.15);
}

.login-btn{

    width:100%;
    padding:16px;
    border:none;
    border-radius:12px;
    background:#0B6E4F;
    color:white;
    font-size:18px;
    font-weight:600;
    cursor:pointer;
    transition:.3s;
}

.login-btn:hover{

    background:#F4B400;
}

.register-link{

    text-align:center;
    margin-top:25px;
    color:#666;
}

.register-link a{

    text-decoration:none;
    color:#0B6E4F;
    font-weight:600;
}

.register-link a:hover{

    text-decoration:underline;
}

.stats{

display:flex;

justify-content:space-between;

margin-top:25px;

text-align:center;

}

.stats div{

flex:1;

}

.stats i{

color:#0B6E4F;

font-size:24px;

margin-bottom:8px;

}

.stats h3{

margin:0;

color:#F4B400;

font-size:22px;

}

.stats p{

font-size:13px;

color:#777;

}

</style>

</head>

<body>

<div class="login-card">

<!-- Left Panel -->

<div class="left-panel">

    <div class="icon">

        <i class="fa-solid fa-bowl-food"></i>

    </div>

    <h1>

        Welcome Back!

    </h1>

    <p>

        Login to continue ordering delicious meals from your favourite restaurants and enjoy lightning-fast delivery.

    </p>

    <div class="features">

<div class="feature">

<i class="fa-solid fa-truck-fast"></i>

<span>Fast Delivery in 30 Minutes</span>

</div>

<div class="feature">

<i class="fa-solid fa-bowl-food"></i>

<span>1000+ Delicious Meals</span>

</div>

<div class="feature">

<i class="fa-solid fa-store"></i>

<span>500+ Restaurants</span>

</div>

<div class="feature">

<i class="fa-solid fa-percent"></i>

<span>Daily Special Discounts</span>

</div>

<div class="feature">

<i class="fa-solid fa-shield-heart"></i>

<span>Safe & Secure Payments</span>

</div>

</div>

</div>

<div class="right-panel">

    <div class="logo">

        <i class="fa-solid fa-utensils"></i>

        FoodZone

    </div>

    <h2>

        Login to your Account

    </h2>

    <p class="subtitle">

        Enter your email and password to continue.

    </p>

    <%
    String error=(String)request.getAttribute("error");

    if(error!=null){
    %>

    <script>

    Swal.fire({

        icon:'error',
        title:'Login Failed',
        text:'<%=error%>',
        confirmButtonColor:'#0B6E4F'

    });

    </script>

    <%
    }
    %>

    <form action="login" method="post">

        <div class="input-group">

            <i class="fa-solid fa-envelope"></i>

            <input
            type="email"
            name="email"
            placeholder="Email Address"
            required>

        </div>

        <div class="input-group">

            <i class="fa-solid fa-lock"></i>

            <input
            type="password"
            name="password"
            placeholder="Password"
            required>

        </div>

        <button
        type="submit"
        class="login-btn">

            <i class="fa-solid fa-right-to-bracket"></i>
            
            &nbsp;

            Login

        </button>
        
        <div class="stats">

<div>

<i class="fa-solid fa-users"></i>

<h3>10K+</h3>

<p>Customers</p>

</div>

<div>

<i class="fa-solid fa-utensils"></i>

<h3>500+</h3>

<p>Restaurants</p>

</div>

<div>

<i class="fa-solid fa-star"></i>

<h3>4.9</h3>

<p>Rating</p>

</div>

</div>

    </form>

    <div class="register-link">

        Don't have an account?

        <a href="register.jsp">

            Register Here

        </a>

    </div>

</div>

</div>

</body>

