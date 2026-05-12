<%@ page import="java.sql.*" %>
<%@ page import="com.eventscheduler.util.DBConnection" %>

<%

int id =
Integer.parseInt(request.getParameter("id"));

Connection con =
DBConnection.getConnection();

String query =
"SELECT * FROM events WHERE id=?";

PreparedStatement ps =
con.prepareStatement(query);

ps.setInt(1, id);

ResultSet rs =
ps.executeQuery();

rs.next();

%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Edit Event</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<div class="container mt-5">

<div class="card shadow p-4">

<h2>Update Event</h2>

<form action="updateEvent" method="post">

<input type="hidden"
name="id"
value="<%= rs.getInt("id") %>">

<input type="text"
name="title"
class="form-control mt-3"
value="<%= rs.getString("title") %>">

<textarea
name="description"
class="form-control mt-3"><%= rs.getString("description") %></textarea>

<input type="date"
name="event_date"
class="form-control mt-3"
value="<%= rs.getString("event_date") %>">

<input type="time"
name="event_time"
class="form-control mt-3"
value="<%= rs.getString("event_time") %>">

<select name="status"
class="form-control mt-3">

<option><%= rs.getString("status") %></option>

<option>Pending</option>
<option>Ongoing</option>
<option>Completed</option>
<option>Cancelled</option>

</select>

<select name="priority"
class="form-control mt-3">

<option><%= rs.getString("priority") %></option>

<option>High</option>
<option>Medium</option>
<option>Low</option>

</select>

<button type="submit"
class="btn btn-warning mt-3">
Update Event
</button>

</form>

</div>

</div>

</body>
</html>