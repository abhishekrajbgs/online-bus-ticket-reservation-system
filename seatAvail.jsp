<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<html>
<body background="25.jpg">
<marquee><h2 style="color:green">WELCOME TO B. H. R.    TRAVELS  </marquee></h2>
<%
String x = (String)application.getAttribute("id");
int b_id = (Integer)application.getAttribute("bs_id");
int r_id = (Integer)application.getAttribute("rt_id");
Date dat = (Date)application.getAttribute("ddet");
String dest = (String)application.getAttribute("dstn");
String src = (String)application.getAttribute("src");

 Class.forName("com.mysql.jdbc.Driver");
	  
	  //get connection
	 Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/project?user=root&password=badal");
	  
	  //statement query
	  try{
	 Statement state =connect.createStatement();
	 
	 String sql1 ="select tot_seats from bus natural join (has natural join route) where bus_id = "+b_id+" and route_id = "+r_id+ " and source like '"+src+"' and dest like '"+dest+"' and depart_date = '"+dat+"'";
	 String sql2 ="select count(*) as seats from reserves natural join records where bus_id = "+b_id+" and route_id = "+r_id;
	 ResultSet result1 = state.executeQuery(sql1);
	 int tot_seats=0,seats=0,seatsAvailable=0;
	 while(result1.next())
	 {
		tot_seats=result1.getInt("tot_seats");
		//out.println(""+tot_seats);
	 }
	 ResultSet result2 = state.executeQuery(sql2);
	 while(result2.next())
	 {
		seats=result2.getInt("seats");
		//seats = 5;
		//out.println(""+seats);
	 }
		//out.println("check5");
		seatsAvailable = tot_seats - seats;
		out.println("Total available seats = "+seatsAvailable);

	 }
	 catch(Exception e)
	 {
	 out.println(""+e);
	 }
	 connect.close();

 %>
 
 <form method = "get" action = "res1.jsp">
<p>
<input type="submit" value="Reservation">
</p>
</form>
<form method = "get" action = "Search1.jsp">
<p>
<input type="submit" value="Back" >
</p>
</form>
 </body>
 </html>