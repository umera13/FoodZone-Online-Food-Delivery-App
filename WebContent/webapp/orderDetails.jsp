<%@page import="java.util.List"%>
<%@page import="com.food.model.OrderDetails"%>
<%@page import="com.food.model.OrderItemDetails"%>

<%
OrderDetails order =
(OrderDetails)request.getAttribute("order");

List<OrderItemDetails> items =
(List<OrderItemDetails>)request.getAttribute("items");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Order Details | FoodZone</title>

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

max-width:880px;

margin:auto;

background:#fff;

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

color:#fff;

box-shadow:0 4px 12px rgba(0,0,0,.12);

}

.header h1{

font-size:24px;

font-weight:700;

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

padding:20px;

}

.card{

background:#fff;

border:1px solid #ECECEC;

border-top:5px solid #0B6E4F;

border-radius:14px;

padding:18px;

margin-bottom:20px;

box-shadow:0 4px 12px rgba(0,0,0,.08);

}

.card h2{

color:#0B6E4F;

font-size:19px;

margin-bottom:16px;

display:flex;

align-items:center;

gap:8px;

}

.details{

display:grid;

grid-template-columns:repeat(2,1fr);

gap:12px;

}

.details div{

background:#F9FAFB;

padding:14px;

border-left:4px solid #0B6E4F;

border-radius:10px;

transition:.3s;

}

.details div:hover{

transform:translateY(-2px);

box-shadow:0 6px 12px rgba(0,0,0,.08);

}

.details strong{

display:block;

font-size:12px;

text-transform:uppercase;

letter-spacing:.8px;

color:#777;

margin-bottom:4px;

}

.details span{

font-size:15px;

font-weight:600;

color:#222;

}

table{

width:100%;

border-collapse:collapse;

margin-top:8px;

overflow:hidden;

border-radius:12px;

}

table th{

background:#0B6E4F;

color:white;

padding:11px;

font-size:14px;

font-weight:600;

}

table td{

padding:11px;

font-size:14px;

text-align:center;

border-bottom:1px solid #ECECEC;

}

table tr:nth-child(even){

background:#FAFAFA;

}

table tr:hover{

background:#EDF8F2;

}

.total{

margin-top:20px;

padding-top:15px;

border-top:2px dashed #DDD;

display:flex;

justify-content:flex-end;

font-size:22px;

font-weight:700;

color:#0B6E4F;

}

.buttons{

margin-top:22px;

display:flex;

justify-content:center;

gap:14px;

flex-wrap:wrap;

}

.btn{

width:180px;

padding:11px;

border:none;

border-radius:8px;

font-size:14px;

font-weight:600;

cursor:pointer;

text-align:center;

text-decoration:none;

color:white;

transition:.3s;

}

.print{

background:linear-gradient(90deg,#0B6E4F,#13865E);

}

.print:hover{

transform:translateY(-2px);

box-shadow:0 8px 18px rgba(11,110,79,.3);

}

.back{

background:#E53935;

}

.back:hover{

background:#C62828;

transform:translateY(-2px);

box-shadow:0 8px 18px rgba(229,57,53,.3);

}

@media(max-width:768px){

body{

padding:15px;

}

.header{

flex-direction:column;

gap:10px;

text-align:center;

}

.content{

padding:15px;

}

.details{

grid-template-columns:1fr;

}

table{

display:block;

overflow-x:auto;

white-space:nowrap;

}

.total{

justify-content:center;

font-size:20px;

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

<div class="header">

<h1>

<i class="fa-solid fa-receipt"></i>

Order Details

</h1>

<div class="logo">

<i class="fa-solid fa-utensils"></i>

FoodZone

</div>

</div>

<div class="content">

<!-- ORDER INFORMATION -->

<div class="card">

    <h2>
        <i class="fa-solid fa-circle-info"></i>
        Order Information
    </h2>

    <div class="details">

        <div>
            <strong>Order ID</strong>
            #<%=order.getOrderId()%>
        </div>

        <div>
            <strong>Order Date</strong>
            <%=order.getOrderDate()%>
        </div>

        <div>
            <strong>Status</strong>
            <%=order.getStatus()%>
        </div>

        <div>
            <strong>Payment Method</strong>
            <%=order.getPaymentMethod()%>
        </div>

        <div>
            <strong>Estimated Delivery</strong>
            <%=order.getEstimatedDelivery()%>
        </div>

        <div>
            <strong>Total Amount</strong>
           &#8377;<%=String.format("%.2f",order.getTotalAmount())%>
        </div>

    </div>

</div>



<!-- DELIVERY ADDRESS -->

<div class="card">

    <h2>
        <i class="fa-solid fa-location-dot"></i>
        Delivery Address
    </h2>

    <p style="line-height:1.8;">
        <%=order.getDeliveryAddress()%>
    </p>

</div>



<!-- ORDER ITEMS -->

<div class="card">

    <h2>
        <i class="fa-solid fa-bag-shopping"></i>
        Ordered Items
    </h2>

    <table>

        <tr>

            <th>Food Item</th>

            <th>Quantity</th>

            <th>Price</th>

            <th>Total</th>

        </tr>

<%
for(OrderItemDetails item : items){
%>

        <tr>

            <td><%=item.getItemName()%></td>

            <td><%=item.getQuantity()%></td>

            <td>
               &#8377;<%=String.format("%.2f",item.getPrice())%>
            </td>

            <td>
              &#8377;<%=String.format("%.2f",
                        item.getPrice()*item.getQuantity())%>
            </td>

        </tr>

<%
}
%>

    </table>

    <div class="total">

        Grand Total :
        &#8377; <%=String.format("%.2f",order.getTotalAmount())%>

    </div>

</div>



<!-- BUTTONS -->

<div class="buttons">

    <button
        class="btn print"
        onclick="window.print()">

        <i class="fa-solid fa-print"></i>

        Print Invoice

    </button>

    <a
        href="myOrders"
        class="btn back">

        <i class="fa-solid fa-arrow-left"></i>

        Back to My Orders

    </a>

</div>

</div>

</div>

</body>

</html>