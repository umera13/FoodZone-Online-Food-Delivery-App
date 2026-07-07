<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<title>Register | FoodZone</title>

<link rel="preconnect"
href="https://fonts.googleapis.com">

<link rel="preconnect"
href="https://fonts.gstatic.com"
crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

body{

background:linear-gradient(135deg,#0B6E4F,#14845d,#F4B400);

min-height:100vh;

display:flex;

justify-content:center;

align-items:center;

padding:40px;

}

/* Card */

.register-card{

width:100%;

max-width:1050px;

background:white;

border-radius:25px;

overflow:hidden;

display:flex;

box-shadow:0 20px 45px rgba(0,0,0,.18);

}

/* Left */

.left-panel{

width:42%;

background:linear-gradient(180deg,#0B6E4F,#14845d);

color:white;

padding:60px 40px;

display:flex;

flex-direction:column;

justify-content:center;

align-items:center;

text-align:center;

}

.left-panel i{

font-size:95px;

margin-bottom:25px;

color:#F4B400;

}

.left-panel h1{

font-size:40px;

margin-bottom:18px;

}

.left-panel p{

line-height:30px;

font-size:17px;

opacity:.95;

}

.features{

margin-top:45px;

width:100%;

}

.feature{

display:flex;

align-items:center;

gap:15px;

margin-bottom:22px;

font-size:17px;

}

.feature i{

font-size:22px;

color:#F4B400;

margin:0;

}

/* Right */

.right-panel{

width:58%;

padding:55px;

}

.logo{

text-align:center;

font-size:34px;

font-weight:700;

color:#0B6E4F;

margin-bottom:10px;

}

.logo i{

color:#F4B400;

margin-right:8px;

}

.right-panel h2{

text-align:center;

font-size:34px;

color:#333;

margin-bottom:10px;

}

.subtitle{

text-align:center;

color:#777;

margin-bottom:35px;

}

/* Inputs */

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

.input-group input,

.input-group textarea{

width:100%;

padding:15px 18px 15px 50px;

border:1px solid #ddd;

border-radius:12px;

font-size:15px;

outline:none;

transition:.3s;

}

.input-group textarea{

resize:none;

height:90px;

}

.input-group input:focus,

.input-group textarea:focus{

border-color:#0B6E4F;

box-shadow:0 0 12px rgba(11,110,79,.18);

}

/* Button */

.register-btn{

width:100%;

padding:16px;

border:none;

border-radius:12px;

background:#0B6E4F;

color:white;

font-size:18px;

font-weight:600;

cursor:pointer;

transition:.35s;

}

.popup-error{
    position: fixed;
    top: 30px;
    right: 30px;

    background: #ff4d4f;
    color: white;

    padding: 15px 25px;
    border-radius: 10px;

    font-size: 16px;
    font-weight: 600;

    box-shadow: 0 8px 20px rgba(0,0,0,.25);

    animation: popup 4s forwards;

    z-index:9999;
}

@keyframes popup{

    0%{
        opacity:0;
        transform:translateX(120%);
    }

    10%{
        opacity:1;
        transform:translateX(0);
    }

    85%{
        opacity:1;
        transform:translateX(0);
    }

    100%{
        opacity:0;
        transform:translateX(120%);
    }
}

.register-btn:hover{

background:#F4B400;

transform:translateY(-2px);

box-shadow:0 10px 20px rgba(0,0,0,.15);

}

/* Login */

.login-link{

margin-top:22px;

text-align:center;

font-size:15px;

}

.login-link a{

text-decoration:none;

color:#0B6E4F;

font-weight:600;

}

.login-link a:hover{

color:#F4B400;

}

/* Mobile */

@media(max-width:900px){

.register-card{

flex-direction:column;

}

.left-panel,

.right-panel{

width:100%;

}

.left-panel{

padding:45px 30px;

}

}

</style>

</head>

<body>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<div class="register-card">

    <!-- LEFT PANEL -->

    <div class="left-panel">

        <i class="fa-solid fa-utensils"></i>

        <h1>

            Welcome to FoodZone

        </h1>

        <p>

            Create your account and enjoy delicious food delivered from the best restaurants in Bengaluru.

        </p>

        <div class="features">

            <div class="feature">

                <i class="fa-solid fa-burger"></i>

                <span>1000+ Delicious Dishes</span>

            </div>

            <div class="feature">

                <i class="fa-solid fa-truck-fast"></i>

                <span>Fast & Safe Delivery</span>

            </div>

            <div class="feature">

                <i class="fa-solid fa-star"></i>

                <span>Top Rated Restaurants</span>

            </div>

            <div class="feature">

                <i class="fa-solid fa-gift"></i>

                <span>Exclusive Daily Offers</span>

            </div>

        </div>

    </div>

    <!-- RIGHT PANEL -->

    <div class="right-panel">

        <div class="logo">

            <i class="fa-solid fa-utensils"></i>

            FoodZone

        </div>

        <h2>

            Create Account

        </h2>

        <p class="subtitle">

            Fill in your details to start ordering your favourite meals.

        </p>
        
        <%
String error = (String)request.getAttribute("error");

if(error != null){
%>

<script>
Swal.fire({
    icon:'error',
    title:'Registration Failed',
    text:'<%=error%>',
    confirmButtonColor:'#0f7a54'
});
</script>

<%
}
%>
        <form
        action="register"
        method="post">

            <div class="input-group">

                <i class="fa-solid fa-user"></i>

                <input
                type="text"
                name="name"
                placeholder="Full Name"
                required>

            </div>

            <div class="input-group">

                <i class="fa-solid fa-circle-user"></i>

                <input
                type="text"
                name="username"
                placeholder="Username"
                required>

            </div>

            <div class="input-group">

                <i class="fa-solid fa-envelope"></i>

                <input
                type="email"
                name="email"
                placeholder="Email-Id"
                autocomplete="off"
                required>

            </div>

            <div class="input-group">

                <i class="fa-solid fa-phone"></i>

                <input
                type="text"
                name="phone"
                placeholder="Phone Number"
                required>

            </div>

            <div class="input-group">

                <i class="fa-solid fa-location-dot"></i>

                <textarea
                name="address"
                placeholder="Delivery Address"
                required></textarea>

            </div>

            <div class="input-group">

                <i class="fa-solid fa-lock"></i>

                <input
                type="password"
                name="password"
                placeholder="Password"
               autocomplete="new-password"
                required>

            </div>

            <button
            type="submit"
            class="register-btn">

                <i class="fa-solid fa-user-plus"></i>

                Create Account

            </button>

        </form>

        <div class="login-link">

            Already have an account?

            <a href="login.jsp">

                Login Here

            </a>

        </div>

    </div>

</div>


</body>

</html>