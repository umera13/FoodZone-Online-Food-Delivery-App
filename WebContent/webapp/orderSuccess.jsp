
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<title>Order Successful | FoodZone</title>

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

height:100vh;

display:flex;

justify-content:center;

align-items:center;

background:linear-gradient(135deg,#0B6E4F,#138A5A,#F4B400);

overflow:hidden;

}

/* Floating Background */

body::before{

content:"";

position:absolute;

width:550px;
height:550px;

background:rgba(255,255,255,.08);

border-radius:50%;

top:-180px;
left:-180px;

animation:float 8s infinite alternate;

}

body::after{

content:"";

position:absolute;

width:450px;
height:450px;

background:rgba(255,255,255,.07);

border-radius:50%;

bottom:-150px;
right:-120px;

animation:float2 10s infinite alternate;

}

.success-card{

position:relative;

z-index:10;

width:90%;

max-width:650px;

background:#fff;

padding:55px 45px;

border-radius:25px;

text-align:center;

box-shadow:0 25px 60px rgba(0,0,0,.25);

animation:popup .8s ease;

}

/* Success Circle */

.circle{

width:130px;
height:130px;

margin:auto;

background:#e8f9ef;

border-radius:50%;

display:flex;

justify-content:center;

align-items:center;

animation:scale 1s ease;

}

.circle i{

font-size:70px;

color:#2E7D32;

}

/* Heading */

h1{

margin-top:30px;

font-size:40px;

color:#0B6E4F;

}

.subtitle{

margin-top:18px;

font-size:18px;

color:#666;

line-height:32px;

}

/* Loading Dots */

.loader{

margin-top:35px;

display:flex;

justify-content:center;

gap:12px;

}

.loader span{

width:14px;

height:14px;

background:#F4B400;

border-radius:50%;

animation:bounce 1.2s infinite;

}

.loader span:nth-child(2){

animation-delay:.2s;

}

.loader span:nth-child(3){

animation-delay:.4s;

}

/* Buttons */

.buttons{

display:flex;

justify-content:center;

gap:20px;

margin-top:45px;

flex-wrap:wrap;

}

.btn{

padding:16px 35px;

border-radius:12px;

text-decoration:none;

font-weight:600;

font-size:17px;

transition:.35s;

}

.home{

background:#0B6E4F;

color:white;

}

.home:hover{

background:#08704B;

transform:translateY(-4px);

}

.orders{

background:#F4B400;

color:#222;

}

.orders:hover{

background:#E6A800;

transform:translateY(-4px);

}

/* Animations */

@keyframes popup{

from{

opacity:0;

transform:translateY(50px);

}

to{

opacity:1;

transform:translateY(0);

}

}

@keyframes scale{

0%{

transform:scale(0);

}

70%{

transform:scale(1.2);

}

100%{

transform:scale(1);

}

}

@keyframes bounce{

0%,80%,100%{

transform:scale(0);

}

40%{

transform:scale(1);

}

}

@keyframes float{

from{

transform:translateY(0);

}

to{

transform:translateY(40px);

}

}

@keyframes float2{

from{

transform:translateY(0);

}

to{

transform:translateY(-40px);

}

}

@media(max-width:700px){

.success-card{

padding:40px 25px;

}

h1{

font-size:30px;

}

.subtitle{

font-size:16px;

}

.buttons{

flex-direction:column;

}

.btn{

width:100%;

}

}

</style>

</head>

<body>

<div class="success-card">

    <div class="circle">

        <i class="fa-solid fa-check"></i>

    </div>

    <h1>Order Placed Successfully!</h1>

    <p class="subtitle">

        Thank you for choosing <b>FoodZone</b>.

        <br><br>

        Your delicious meal is now being prepared.

        We will deliver it as soon as possible.

    </p>

    <div class="loader">

        <span></span>
        <span></span>
        <span></span>

    </div>

    <div class="buttons">

        <a href="index.jsp" class="btn home">

            <i class="fa-solid fa-house"></i>

            Back To Home

        </a>

        <a href="myOrders" class="btn orders">

            <i class="fa-solid fa-box"></i>

            My Orders

        </a>

    </div>

</div>

</body>
</html>