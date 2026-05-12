<%@ page language="java" %>

<%
String user =
(String)session.getAttribute("user");

if(user == null){
    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

</head>

<body class="bg-light">

<nav class="navbar navbar-dark bg-dark">

<div class="container-fluid">

<span class="navbar-brand">
<i class="fa-solid fa-calendar-days"></i>
Event Scheduler
</span>

<div>

<span class="text-white me-3">
Welcome <%= user %>
</span>

<a href="logout"
class="btn btn-danger btn-sm">
Logout
</a>

</div>

</div>

</nav>

<div class="container mt-5">

<div class="row g-4">

<div class="col-md-4">

<div class="card shadow border-0">

<div class="card-body text-center">

<i class="fa-solid fa-plus fa-3x text-primary"></i>

<h3 class="mt-3">
Add Event
</h3>

<p>Create and manage schedules</p>

<a href="addEvent.jsp"
class="btn btn-primary">
Open
</a>

</div>
</div>
</div>

<div class="col-md-4">

<div class="card shadow border-0">

<div class="card-body text-center">

<i class="fa-solid fa-list fa-3x text-success"></i>

<h3 class="mt-3">
View Events
</h3>

<p>Track all events</p>

<a href="viewEvents.jsp"
class="btn btn-success">
Open
</a>

</div>
</div>
</div>

<div class="col-md-4">

<div class="card shadow border-0">

<div class="card-body text-center">

<i class="fa-solid fa-right-from-bracket fa-3x text-danger"></i>

<h3 class="mt-3">
Logout
</h3>

<p>End current session</p>

<a href="logout"
class="btn btn-danger">
Logout
</a>

</div>
</div>
</div>

</div>

</div>

</body>
</html>