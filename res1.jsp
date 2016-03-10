<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="main.css">
<marquee><h2 style="color:green">WELCOME TO B. H. R.    TRAVELS  </marquee></h2>
</head>
<body background="54.jpg">
<h2> Fill form for reservation : </h2> 

<form method = "get" action = "res.jsp">
<table>
<tr><td><b>Name :</b></td><td><input type="text" name="name" /></td></tr>
<tr><td><b>Age :</b></td><td><input type="text" name="age" /></td></tr>
<tr><td><b>Phone No :</b></td><td><input type="text" name="phone" /></td></tr>
<tr><td><b>Sex :</b></td><td><input type="text" name="sex" /></td></tr>
<tr><td><b>Personal ID :</b></td><td><input type="text" name="p_id" /></td></tr>
<tr><td><b>Credit Card No :</b></td><td><input type="text" name="c_no" /></td></tr>
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