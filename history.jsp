<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<html>
<body background="52.jpg">
<marquee><h2 style="color:green">WELCOME TO B. H. R.    TRAVELS  </marquee></h2>
<%
String x = (String)application.getAttribute("id");

  Class.forName("com.mysql.jdbc.Driver");
	  
	  //get connection
	 Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/project?user=root&password=badal");
	  
	  //statement query
	  try{
	 Statement state =connect.createStatement();
	 String sql ="select * from reserves natural join records where user_id like '"+x+"'";
	 ResultSet result = state.executeQuery(sql);
	 String u_id,destn,srce,tm,c_no,name,sex,p_id,phn;
	 Date det;
	 int t_no,b_id,r_id,s_no,age;
	 while(result.next())
	 {
		t_no=result.getInt("ticket_no");
		u_id= result.getString("user_id");
		b_id=result.getInt("bus_id");
		r_id=result.getInt("route_id");
		det= result.getDate("depart_date");
		tm= result.getString("depart_time");
		c_no= result.getString("credit_card_no");
		s_no=result.getInt("seat_no");
		name= result.getString("name");
		age=result.getInt("age");
		sex= result.getString("sex");
		p_id= result.getString("personal_id");
		srce= result.getString("source");
		destn= result.getString("dest");
		phn= result.getString("phone_no");
		
		%><br></br><%
		out.println(t_no +"__________|"+b_id+"__________|"+r_id+"__________|"+det+"__________|"+tm+"__________|"+c_no+"__________|"+s_no+"__________|"+name+"__________|"+age+"__________|"+sex+"__________|"+p_id+"__________|"+destn+"__________|"+srce+"__________|"+phn);
		out.print("\n");
		
	 }
	 
		
		

	 }
	 catch(Exception e)
	 {
	 out.println(""+e);
	 }
	 connect.close();
 %>
 
 <form method = "get" action = "Booking.jsp">
<p>
<input type="submit" value="Back" >
</p>
</form>

 </body>
 </html>