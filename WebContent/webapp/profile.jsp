<%@page import="com.food.model.User"%>

<%
User user = (User)session.getAttribute("loggedInUser");

if(user == null){

    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>My Profile | FoodZone</title>


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

max-width:700px;

margin:auto;

background:#fff;

border-radius:18px;

overflow:hidden;

box-shadow:0 14px 35px rgba(0,0,0,.15);

}

.header{

background:linear-gradient(90deg,#0B6E4F,#13865E);

padding:18px 25px;

display:flex;

justify-content:space-between;

align-items:center;

color:white;

}

.header h1{

font-size:24px;

display:flex;

align-items:center;

gap:10px;

}

.logo{

font-size:22px;

font-weight:700;

color:#FFD54F;

}

.content{

padding:28px;

}

.profile-card{

text-align:center;

margin-bottom:28px;

}

.profile-image{

width:90px;

height:90px;

background:linear-gradient(135deg,#0B6E4F,#13865E);

color:white;

border-radius:50%;

display:flex;

justify-content:center;

align-items:center;

font-size:34px;

margin:auto;

margin-bottom:15px;

box-shadow:0 10px 22px rgba(11,110,79,.28);

}

.profile-card h2{

font-size:25px;

font-weight:600;

color:#222;

}

.card{

background:#fff;

padding:22px;

border-radius:16px;

border-top:5px solid #0B6E4F;

box-shadow:0 8px 20px rgba(0,0,0,.08);

}

.card h3{

font-size:20px;

color:#0B6E4F;

margin-bottom:18px;

display:flex;

align-items:center;

gap:10px;

}

.info-row{

display:flex;

justify-content:space-between;

align-items:center;

background:#F8F9FA;

padding:16px;

margin-bottom:14px;

border-radius:12px;

transition:.3s;

}

.info-row:last-child{

margin-bottom:0;

}

.info-row:hover{

transform:translateY(-2px);

box-shadow:0 8px 18px rgba(0,0,0,.08);

}

.left{

display:flex;

align-items:center;

gap:12px;

font-weight:600;

color:#444;

}

.left i{

width:20px;

font-size:17px;

color:#0B6E4F;

text-align:center;

}

.value{

font-weight:500;

color:#666;

text-align:right;

max-width:55%;

word-break:break-word;

}

.buttons{

margin-top:28px;

display:flex;

justify-content:center;

gap:15px;

flex-wrap:wrap;

}

.btn{

width:180px;

padding:12px;

border-radius:9px;

font-size:15px;

font-weight:600;

text-decoration:none;

text-align:center;

color:white;

transition:.3s;

}

.edit-btn{

background:linear-gradient(90deg,#0B6E4F,#13865E);

}

.edit-btn:hover{

transform:translateY(-2px);

box-shadow:0 10px 20px rgba(11,110,79,.30);

}

.orders-btn{

background:#1976D2;

}

.orders-btn:hover{

background:#1565C0;

transform:translateY(-2px);

box-shadow:0 10px 20px rgba(25,118,210,.30);

}

.home-btn{

background:#F4B400;

}

.home-btn:hover{

background:#E2A300;

transform:translateY(-2px);

box-shadow:0 10px 20px rgba(244,180,0,.30);

}

@media(max-width:768px){

body{

padding:18px;

}

.header{

flex-direction:column;

gap:10px;

text-align:center;

}

.content{

padding:20px;

}

.profile-image{

width:80px;

height:80px;

font-size:30px;

}

.profile-card h2{

font-size:22px;

}

.info-row{

flex-direction:column;

align-items:flex-start;

gap:10px;

}

.value{

max-width:100%;

text-align:left;

}

.buttons{

flex-direction:column;

align-items:center;

}

.btn{

width:100%;

max-width:280px;

}

}
</style>
</head>
<body>

<div class="container">

    <!-- Header -->

    <div class="header">

        <h1>
            <i class="fa-solid fa-user"></i>
            My Profile
        </h1>

        <div class="logo">
            <i class="fa-solid fa-utensils"></i>
            FoodZone
        </div>

    </div>


    <div class="content">

    <div class="profile-card">

        <div class="profile-image">
            <i class="fa-solid fa-user"></i>
        </div>

        <h2><%=user.getName()%></h2>

    </div>

    <div class="card">

        <h3>

            <i class="fa-solid fa-address-card"></i>

            Personal Information

        </h3>

        <div class="info-row">

            <div class="left">
                <i class="fa-solid fa-user"></i>
                <span>Full Name</span>
            </div>

            <span class="value">
                <%=user.getName()%>
            </span>

        </div>

        <div class="info-row">

            <div class="left">
                <i class="fa-solid fa-envelope"></i>
                <span>Email Address</span>
            </div>

            <span class="value">
                <%=user.getEmail()%>
            </span>

        </div>

        <div class="info-row">

            <div class="left">
                <i class="fa-solid fa-phone"></i>
                <span>Phone Number</span>
            </div>

            <span class="value">
                <%=user.getPhone()%>
            </span>

        </div>

        <div class="info-row">

            <div class="left">
                <i class="fa-solid fa-location-dot"></i>
                <span>Delivery Address</span>
            </div>

            <span class="value">
                <%=user.getAddress()%>
            </span>

        </div>

    </div>

    <div class="buttons">

        <a href="editProfile.jsp" class="btn edit-btn">
            <i class="fa-solid fa-pen-to-square"></i>
            Edit Profile
        </a>

        <a href="myOrders" class="btn orders-btn">
            <i class="fa-solid fa-bag-shopping"></i>
            My Orders
        </a>

        <a href="index.jsp" class="btn home-btn">
            <i class="fa-solid fa-house"></i>
            Back to Home
        </a>

    </div>

</div>

    </div>

</div>

</body>

</html>



</body>