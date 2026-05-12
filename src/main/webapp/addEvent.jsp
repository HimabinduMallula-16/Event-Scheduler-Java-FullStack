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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Add Event</title>

<style>

body{
    font-family:Arial;
    background:#f2f2f2;
}

.container{
    width:400px;
    margin:50px auto;
    background:white;
    padding:30px;
    border-radius:10px;
    box-shadow:0px 0px 10px gray;
}

input, textarea{
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

<h2>Add Event</h2>

<form action="addEvent" method="post">

<input type="text"
name="title"
placeholder="Event Title"
required>

<textarea
name="description"
placeholder="Description">
</textarea>

<input type="date"
name="event_date"
required>

<input type="time"
name="event_time"
required>

<select name="priority" class="form-control mt-3">

<option>High</option>
<option>Medium</option>
<option>Low</option>

</select>
<select name="status" class="form-control mt-3">

<option>Pending</option>
<option>Ongoing</option>
<option>Completed</option>
<option>Cancelled</option>

</select>

<button type="submit">
Add Event
</button>

</form>

<br>

<a href="dashboard.jsp">
Back to Dashboard
</a>

</div>

</body>
</html>