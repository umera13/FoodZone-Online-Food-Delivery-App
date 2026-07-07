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

<title>Edit Profile | FoodZone</title>

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

display:flex;

justify-content:center;

align-items:center;

padding:25px;

}

.container{

width:100%;

max-width:720px;

background:#fff;

border-radius:18px;

overflow:hidden;

box-shadow:0 18px 40px rgba(0,0,0,.16);

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

font-weight:600;

}

.logo{

font-size:22px;

font-weight:700;

color:#FFD54F;

}

.content{

padding:30px;

}

.profile-card{

text-align:center;

margin-bottom:28px;

}

.profile-image{

width:90px;

height:90px;

margin:auto;

border-radius:50%;

background:linear-gradient(135deg,#0B6E4F,#13865E);

display:flex;

justify-content:center;

align-items:center;

color:white;

font-size:35px;

margin-bottom:15px;

box-shadow:0 10px 22px rgba(11,110,79,.25);

}

.profile-card h2{

font-size:26px;

font-weight:600;

color:#222;

margin-bottom:6px;

}

.profile-card p{

color:#666;

font-size:15px;

}

.card{

background:#fff;

border-radius:16px;

padding:25px;

border-top:5px solid #0B6E4F;

box-shadow:0 8px 20px rgba(0,0,0,.08);

}

.card h3{

font-size:21px;

color:#0B6E4F;

margin-bottom:22px;

display:flex;

align-items:center;

gap:10px;

}

.form-group{

margin-bottom:18px;

}

.form-group label{

display:block;

font-size:14px;

font-weight:600;

margin-bottom:8px;

color:#444;

}

.form-control{

width:100%;

padding:13px 15px;

border:1px solid #D8D8D8;

border-radius:10px;

font-size:15px;

outline:none;

transition:.3s;

background:#FAFAFA;

}

.form-control:hover{

border-color:#13865E;

}

.form-control:focus{

background:white;

border-color:#0B6E4F;

box-shadow:0 0 10px rgba(11,110,79,.18);

}

textarea.form-control{

resize:vertical;

min-height:90px;

}

.buttons{

margin-top:28px;

display:flex;

justify-content:center;

gap:16px;

flex-wrap:wrap;

}

.btn{

padding:13px 28px;

border:none;

border-radius:10px;

font-size:15px;

font-weight:600;

cursor:pointer;

text-decoration:none;

color:white;

transition:.3s;

display:flex;

align-items:center;

justify-content:center;

gap:8px;

min-width:170px;

}

.save-btn{

background:linear-gradient(90deg,#0B6E4F,#13865E);

}

.save-btn:hover{

transform:translateY(-2px);

box-shadow:0 10px 20px rgba(11,110,79,.30);

}

.cancel-btn{

background:#E53935;

}

.cancel-btn:hover{

background:#D32F2F;

transform:translateY(-2px);

box-shadow:0 10px 20px rgba(229,57,53,.28);

}

.error{

background:#FFEBEE;

color:#C62828;

padding:12px;

border-radius:10px;

margin-bottom:20px;

text-align:center;

font-weight:600;

border-left:5px solid #E53935;

}

.success{

background:#E8F5E9;

color:#2E7D32;

padding:12px;

border-radius:10px;

margin-bottom:20px;

text-align:center;

font-weight:600;

border-left:5px solid #2E7D32;

}

@media(max-width:768px){

body{

padding:18px;

}

.container{

max-width:100%;

}

.header{

flex-direction:column;

gap:10px;

text-align:center;

}

.content{

padding:22px;

}

.profile-image{

width:80px;

height:80px;

font-size:30px;

}

.profile-card h2{

font-size:22px;

}

.card{

padding:20px;

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

<div class="container">

    <div class="header">

        <h1>

            <i class="fa-solid fa-user-pen"></i>

            Edit Profile

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

            <p>Update your personal information</p>

        </div>

        <div class="card">

            <h3>

                <i class="fa-solid fa-user-pen"></i>

                Edit Your Details

            </h3>
            
            <%
String error = (String)request.getAttribute("error");

if(error != null){
%>

<div style="background:#FFEBEE;
            color:#C62828;
            padding:12px;
            border-radius:8px;
            margin-bottom:20px;
            text-align:center;
            font-weight:600;">

    <%=error%>

</div>

<%
}
%>

            <form action="updateProfile" method="post">

                <div class="form-group">

                    <label>
    <i class="fa-solid fa-user"></i>
    Full Name
</label>

                    <input
                    type="text"
                    name="name"
                    class="form-control"
                    value="<%=user.getName()%>"
                    required>

                </div>

                <div class="form-group">

                    <label>
    <i class="fa-solid fa-envelope"></i>
    Email Address
</label>

                    <input
                    type="email"
                    name="email"
                    class="form-control"
                    value="<%=user.getEmail()%>"
                    required>

                </div>

                <div class="form-group">

                   <label>
    <i class="fa-solid fa-phone"></i>
    Phone Number
</label>

                    <input
                    type="text"
                    name="phone"
                    class="form-control"
                    value="<%=user.getPhone()%>"
                    required>

                </div>

                <div class="form-group">

    <label>
    <i class="fa-solid fa-at"></i>
    Username
</label>

    <input
    type="text"
    name="username"
    class="form-control"
    value="<%=user.getUsername()%>"
    required>

</div>

                <div class="form-group">

                   <label>
    <i class="fa-solid fa-location-dot"></i>
    Delivery Address
</label>

                    <textarea
                    name="address"
                    rows="4"
                    class="form-control"
                    required><%=user.getAddress()%></textarea>

                </div>

                <div class="buttons">

                    <button
                    type="submit"
                    class="btn save-btn">

                        <i class="fa-solid fa-floppy-disk"></i>

                        Save Changes

                    </button>

                    <a
                    href="profile.jsp"
                    class="btn cancel-btn">

                        <i class="fa-solid fa-arrow-left"></i>

                        Cancel

                    </a>

                </div>

            </form>

        </div>

    </div>

</div>

</body>

</html>