<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<html>
<body background="57.jpg">
<marquee><h2 style="color:green">WELCOME TO B. H. R.    TRAVELS  </marquee></h2>
<%
int b_id= Integer.parseInt(request.getParameter("bus_id"));
int r_id= Integer.parseInt(request.getParameter("r_id"));
String src= request.getParameter("src");
String dest= request.getParameter("dest");
String dat= request.getParameter("date");
String name= request.getParameter("name");
int age= Integer.parseInt(request.getParameter("age"));
String phone= request.getParameter("phone");
String sex= request.getParameter("sex");
String p_id= request.getParameter("p_id");
String c_no= request.getParameter("c_no");
String u_id= (String)application.getAttribute("id");

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
	 int ticket_no=12121,seat_no=0,i=1;
	 int dateCmp = 0;
	 String tm = "";
	 int tim =0;
	 
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
		//out.println("Total available seats = "+seatsAvailable);
	
	String sql3 ="select ticket_no from reserves";
	ResultSet result3 = state.executeQuery(sql3);
	while(result3.next())
	 {
		ticket_no=result3.getInt("ticket_no");
		//out.println(""+ticket_no);
	 }
	ticket_no++;
	
	String sql4 ="select depart_time from has where bus_id = "+b_id+" and route_id = "+r_id+ " and depart_date = '"+dat+"'";
	ResultSet result4 = state.executeQuery(sql4);
	while(result4.next())
	 {
		tm=result4.getString("depart_time");
		//out.println(""+tm);
	 }
	
	String sql5 ="select seat_no from reserves natural join records where bus_id = "+b_id+" and route_id = "+r_id+ " and depart_date = '"+dat+"' order by seat_no asc";
	ResultSet result5 = state.executeQuery(sql5);
	while(result5.next())
	 {
		seat_no=result5.getInt("seat_no");
	 }
	 seat_no++;
	 
	 String sq = "select datediff('"+dat+"',curdate()) as t";
	 ResultSet result6 = state.executeQuery(sq);
	 while(result6.next())
	 {
		dateCmp=result6.getInt("t");
		//out.println(""+dateCmp);
	 }
	 
	 //out.println(""+seatsAvailable);
	if((seatsAvailable <= 100 ) && (seatsAvailable > 0))
	{
		//out.println("Check in");
		if((dateCmp >=0 ) && (dateCmp<2))
		{
		String sql7 ="select timestampdiff(hour,now(),(select concat(depart_date,\" \",depart_time) from has where bus_id = "+b_id+")) as t";
		ResultSet result7 = state.executeQuery(sql7);
		while(result7.next())
		{
		tim=result7.getInt("t");
		}
		if(tim > 2)
		{
			//out.println("Check in date cmp");
			PreparedStatement insert= connect.prepareStatement("insert into reserves (user_id,bus_id,route_id,ticket_no,depart_date,depart_time,credit_card_no) values(?,?,?,?,?,?,?)");
			insert.setString(1,u_id);
			insert.setInt(2,b_id);
			insert.setInt(3,r_id);
			insert.setInt(4,ticket_no);
			insert.setString(5,dat);
			insert.setString(6,tm);
			insert.setString(7,c_no);
			insert.executeUpdate();
			
			PreparedStatement insert2= connect.prepareStatement("insert into records values(?,?,?,?,?,?,?,?,?)");
			insert2.setInt(1,ticket_no);
			insert2.setInt(2,seat_no);
			insert2.setString(3,name);
			insert2.setInt(4,age);
			insert2.setString(5,sex);
			insert2.setString(6,p_id);
			insert2.setString(7,src);
			insert2.setString(8,dest);
			insert2.setString(9,phone);
			insert2.executeUpdate();
			
			out.println("Congratulations Mr "+name+" Your ticket has been booked!!!");
			%><br></br><%
			out.println("Your Ticket No is "+ticket_no+"  and Your Seat No is "+seat_no);
			%><br></br><%
			out.println("Your Bus Id is "+b_id+"  and Your Route id is "+r_id);
			%><br></br><%
			out.println("Your departute date is "+dat+"  and time is "+tm);
		}
		else
		out.println("Maximum Time to book ticket is over!!!");
		}
		else
		out.println("Range Of date is wrong!!!");
	}
	else
	{
		out.println("All Seats are full!!! No tickets Available!!!");
	}

	 }
	 catch(Exception e)
	 {
	 out.println(""+e);
	 }
	 connect.close();
 %>
 
 <form method = "get" action = "reserve1.jsp">
<p>
<input type="submit" value="Back" >
</p>
</form>

 </body>
 </html>