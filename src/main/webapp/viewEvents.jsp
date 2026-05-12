<%@ page import="java.sql.*" %>
<%@ page import="com.eventscheduler.util.DBConnection" %>

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
<title>View Events</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    background:#f2f2f2;
    font-family:Arial;
}

.container{
    margin-top:40px;
}

.table{
    background:white;
}

</style>

</head>

<body>

<nav class="navbar navbar-dark bg-dark">

<div class="container-fluid">

<span class="navbar-brand">
Event Scheduler
</span>

<div>

<span class="text-white me-3">
Welcome <%= user %>
</span>

<a href="dashboard.jsp"
class="btn btn-primary btn-sm">
Dashboard
</a>

<a href="logout"
class="btn btn-danger btn-sm">
Logout
</a>

</div>

</div>

</nav>

<div class="container">

<h2 class="mb-4">
All Events
</h2>

<table class="table table-bordered table-hover table-striped">

<tr class="table-dark">

<th>ID</th>
<th>Title</th>
<th>Description</th>
<th>Date</th>
<th>Time</th>
<th>Status</th>
<th>Priority</th>
<th>Action</th>

</tr>

<%

try{

Connection con =
DBConnection.getConnection();

String query =
"SELECT * FROM events";

PreparedStatement ps =
con.prepareStatement(query);

ResultSet rs =
ps.executeQuery();

while(rs.next()){

%>

<tr>

<td>
<%= rs.getInt("id") %>
</td>

<td>
<%= rs.getString("title") %>
</td>

<td>
<%= rs.getString("description") %>
</td>

<td>
<%= rs.getString("event_date") %>
</td>

<td>
<%= rs.getString("event_time") %>
</td>

<td>

<%

String status =
rs.getString("status");

if(status == null){
    status = "Pending";
}

if(status.equals("Pending")){
%>

<span class="badge bg-warning text-dark">
Pending
</span>

<%
}
else if(status.equals("Ongoing")){
%>

<span class="badge bg-primary">
Ongoing
</span>

<%
}
else if(status.equals("Completed")){
%>

<span class="badge bg-success">
Completed
</span>

<%
}
else{
%>

<span class="badge bg-danger">
Cancelled
</span>

<%
}
%>

</td>

<td>

<%

String priority =
rs.getString("priority");

if(priority == null){
    priority = "Low";
}

if(priority.equals("High")){
%>

<span class="badge bg-danger">
High
</span>

<%
}
else if(priority.equals("Medium")){
%>

<span class="badge bg-warning text-dark">
Medium
</span>

<%
}
else{
%>

<span class="badge bg-success">
Low
</span>

<%
}
%>

</td>

<td>

<a href="editEvent.jsp?id=<%= rs.getInt("id") %>"
class="btn btn-warning btn-sm">
Update
</a>

<a href="deleteEvent?id=<%= rs.getInt("id") %>"
class="btn btn-danger btn-sm">
Delete
</a>

</td>

</tr>

<%
}

}

catch(Exception e){
e.printStackTrace();
}
%>

</table>

</div>

</body>
</html>