<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>No Results | FoodZone</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

body{

background:#F8F9FA;

display:flex;

justify-content:center;

align-items:center;

height:100vh;

}

.card{

width:550px;

background:white;

padding:50px;

border-radius:20px;

text-align:center;

box-shadow:0 15px 35px rgba(0,0,0,.1);

}

.card h1{

font-size:34px;

color:#0B6E4F;

margin-bottom:20px;

}

.card p{

font-size:18px;

color:#666;

line-height:1.8;

margin-bottom:30px;

}

.btn{

display:inline-block;

padding:14px 32px;

background:#0B6E4F;

color:white;

text-decoration:none;

border-radius:10px;

font-weight:600;

transition:.3s;

}

.btn:hover{

background:#13865E;

}

</style>

</head>

<body>

<div class="card">

<h1>

😔 No Results Found

</h1>

<p>

Sorry, we couldn't find

<strong>

<%=request.getAttribute("keyword")%>

</strong>

Try searching for a restaurant or menu item.

</p>

<a href="index.jsp" class="btn">

Back to Home

</a>

</div>

</body>

</html>