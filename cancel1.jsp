<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="main.css">
</head>
<body background="51.jpg">
<marquee><h2 style="color:green">WELCOME TO B. H. R.    TRAVELS  </marquee></h2>
<h2>Cancel Ticket : </h2> 

<form method = "get" action = "cancel.jsp">
<table>
<tr><td><b>Bus No :</b></td><td><input type="text" name="b_no" /></td></tr>
<tr><td><b>Ticket :</b></td><td><input type="text" name="t_no" /></td></tr>
<tr><td><b>Seat No :</b></td><td><input type="text" name="s_no" /></td></tr>
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