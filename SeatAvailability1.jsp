<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="main.css">
</head>
<body background="25.jpg">
<marquee><h2 style="color:green">WELCOME TO B. H. R.    TRAVELS  </marquee></h2>
<h2> Seat Availability : </h2> 

<form method = "get" action = "SeatAvailability.jsp">
<table>
<tr><td><b>Bus Id :</b></td><td><input type="text" name="bus_id" /></td></tr>
<tr><td><b>Route Id :</b></td><td><input type="text" name="r_id" /></td></tr>
<tr><td><b>Source Station :</b></td><td><input type="text" name="src" /></td></tr>
<tr><td><b>Destination Station :</b></td><td><input type="text" name="dest" /></td></tr>
<tr><td><b>Date (YYYY-MM-DD) :</b></td><td><input type="text" name="date" /></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="submit" /> <input type="reset" value="reset" /></td></tr></td></tr>
<%
String x = (String)application.getAttribute("id");
//out.println(x);
%>
</table>
</form>

<form method = "get" action = "Booking.jsp">
<p>
<input type="submit" value="Back" >
</p>
</form>

</body>
</html>