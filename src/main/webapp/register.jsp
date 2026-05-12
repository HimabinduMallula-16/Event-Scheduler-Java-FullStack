<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Register</title>

<style>

body{
    font-family: Arial;
    background:#f2f2f2;
}

.container{
    width:350px;
    margin:100px auto;
    background:white;
    padding:30px;
    border-radius:10px;
    box-shadow:0px 0px 10px gray;
}

input{
    width:100%;
    padding:10px;
    margin-top:10px;
}

button{
    width:100%;
    padding:10px;
    margin-top:15px;
    background:#007bff;
    color:white;
    border:none;
}

</style>

</head>

<body>

<div class="container">

<h2>User Registration</h2>

<form action="register" method="post">

<input type="text"
name="name"
placeholder="Enter Name"
required>

<input type="email"
name="email"
placeholder="Enter Email"
required>

<input type="password"
name="password"
placeholder="Enter Password"
required>

<button type="submit">
Register
</button>

</form>

<br>

<a href="login.jsp">
Already have account? Login
</a>

</div>

</body>
</html>