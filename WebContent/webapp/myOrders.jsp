<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.List"%>
<%@page import="com.food.model.OrderHistory"%>

<%
List<OrderHistory> orders =
(List<OrderHistory>)request.getAttribute("orders");

DateTimeFormatter formatter =
DateTimeFormatter.ofPattern("dd MMM yyyy");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<title>My Orders | FoodZone</title>

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

padding:20px;

}

.container{

max-width:920px;

margin:auto;

background:white;

border-radius:16px;

overflow:hidden;

box-shadow:0 10px 28px rgba(0,0,0,.15);

}

.header{

background:linear-gradient(90deg,#0B6E4F,#13865E);

padding:18px 24px;

display:flex;

justify-content:space-between;

align-items:center;

color:white;

}

.header h1{

font-size:24px;

font-weight:700;

}

.logo{

font-size:22px;

font-weight:700;

color:#FFD54F;

}

.orders{

padding:20px;

}

.order-card{

display:flex;

align-items:center;

justify-content:space-between;

background:white;

border:1px solid #ECECEC;

border-radius:14px;

padding:14px 18px;

margin-bottom:15px;

transition:.3s;

box-shadow:0 4px 12px rgba(0,0,0,.08);

}

.order-card:hover{

transform:translateY(-3px);

box-shadow:0 10px 20px rgba(0,0,0,.12);

}

.order-left{

display:flex;

align-items:center;

gap:14px;

}

.food-image{

width:85px;

height:70px;

object-fit:cover;

border-radius:10px;

}

.food-details h2{

font-size:18px;

color:#222;

margin-bottom:4px;

}

.food-details p{

font-size:13px;

color:#666;

margin:2px 0;

}

.order-right{

text-align:right;

display:flex;

flex-direction:column;

gap:8px;

align-items:flex-end;

}

.amount{

font-size:20px;

font-weight:700;

color:#0B6E4F;

}

.status{

padding:6px 14px;

border-radius:20px;

font-size:12px;

font-weight:600;

color:white;

display:inline-block;

}

.status.pending{

background:#F4B400;

}

.status.confirmed{

background:#2E7D32;

}

.status.preparing{

background:#FF9800;

}

.status.delivered{

background:#43A047;

}

.status.cancelled{

background:#E53935;

}

.details-btn{

background:#0B6E4F;

color:white;

padding:8px 16px;

text-decoration:none;

border-radius:8px;

font-size:13px;

font-weight:600;

transition:.3s;

}

.details-btn:hover{

background:#13865E;

transform:translateY(-2px);

}

.empty{

text-align:center;

padding:45px;

}

.empty i{

font-size:65px;

color:#CCC;

margin-bottom:15px;

}

.empty h2{

color:#666;

margin-bottom:8px;

font-size:22px;

}

.empty p{

color:#888;

font-size:14px;

}

.buttons{

margin-top:20px;

display:flex;

justify-content:center;

}

.home-btn{

display:inline-flex;

align-items:center;

gap:8px;

text-decoration:none;

background:linear-gradient(90deg,#0B6E4F,#13865E);

color:white;

padding:11px 22px;

border-radius:8px;

font-weight:600;

font-size:14px;

transition:.3s;

}

.home-btn:hover{

transform:translateY(-2px);

box-shadow:0 8px 15px rgba(0,0,0,.15);

}

@media(max-width:850px){

body{

padding:15px;

}

.header{

flex-direction:column;

gap:10px;

text-align:center;

}

.orders{

padding:15px;

}

.order-card{

flex-direction:column;

align-items:flex-start;

}

.order-left{

width:100%;

}

.food-image{

width:75px;

height:65px;

}

.order-right{

margin-top:15px;

width:100%;

align-items:flex-start;

}

.amount{

font-size:18px;

}

.details-btn{

width:100%;

text-align:center;

}

}
</style>

</head>

<body>

<div class="container">

    <!-- HEADER -->

    <div class="header">

        <h1>

            <i class="fa-solid fa-bag-shopping"></i>

            My Orders

        </h1>

        <div class="logo">

            <i class="fa-solid fa-utensils"></i>

            FoodZone

        </div>

    </div>

    <!-- ORDERS -->

    <div class="orders">

<%

if(orders==null || orders.isEmpty()){

%>

        <div class="empty">

            <i class="fa-solid fa-cart-shopping"></i>

            <h2>No Orders Yet</h2>

            <p>

                Looks like you haven't ordered anything yet.

            </p>

        </div>

<%

}else{

    for(OrderHistory order : orders){

    	String statusClass = order.getStatus().trim().toLowerCase();
%>

        <!-- ORDER CARD -->

        <div class="order-card">

            <!-- LEFT SIDE -->

            <div class="order-left">

                <img

                src="<%=order.getFoodImage()%>"

                class="food-image"

                alt="<%=order.getFoodName()%>">

                <div class="food-details">

                    <h2>

                        <%=order.getFoodName()%>

                    </h2>

                    <p>

                        <i class="fa-solid fa-calendar-days"></i>

                        Ordered On :

                        <%=order.getOrderDate().format(formatter)%>

                    </p>

                    <p>

                        <i class="fa-solid fa-receipt"></i>

                        Order ID :

                        #<%=order.getOrderId()%>

                    </p>

                </div>

            </div>

            <!-- RIGHT SIDE -->

            <div class="order-right">

                <div class="amount">

                    &#8377; <%=String.format("%.2f",order.getTotalAmount())%>

                </div>

                <span class="status <%=statusClass%>">

                    <%=order.getStatus()%>

                </span>

                <a

                href="orderDetails?orderId=<%=order.getOrderId()%>"

                class="details-btn">

                    View Details

                </a>

            </div>

        </div>
        


<%

    }

    
}

%>

    </div>

</div>

<div class="buttons">

    <a href="index.jsp" class="btn home-btn">
        <i class="fa-solid fa-house"></i>
        Back to Home
    </a>

</div>

</body>

</html>