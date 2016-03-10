<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<html>
<body background="51.jpg">
<marquee><h2 style="color:green">WELCOME TO B. H. R.    TRAVELS  </marquee></h2>
<%
int b_no= Integer.parseInt(request.getParameter("b_no"));
int t_no= Integer.parseInt(request.getParameter("t_no"));
int s_no= Integer.parseInt(request.getParameter("s_no"));
String x = (String)application.getAttribute("id");

  Class.forName("com.mysql.jdbc.Driver");
	  
	  //get connection
	 Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/project?user=root&password=badal");
	  
	  //statement query
	  try{
	 Statement state =connect.createStatement();
	 String sql ="select user_id,credit_card_no from reserves where ticket_no = "+t_no+" and bus_id = "+b_no;
	 ResultSet result = state.executeQuery(sql);
	 int tm =0;
	 String user_id = null,credit_card_no = null;
	 while(result.next())
	 {
		user_id=result.getString("user_id");
		//out.println("u="+user_id);
		credit_card_no=result.getString("credit_card_no");
		//out.println("c="+credit_card_no);
	 }
	 if(x.equals(user_id))
	 {
	 String sql1 ="select timestampdiff(hour,now(),(select concat(depart_date,\" \",depart_time) from has where bus_id = "+b_no+")) as t";
	 ResultSet result1 = state.executeQuery(sql1);
	 while(result1.next())
	 {
		tm=result1.getInt("t");
		//out.println("t="+tm);
	 }
	 if(tm > 2)
	 {
	 PreparedStatement del= connect.prepareStatement("delete from records where ticket_no = ? and seat_no = ?");
	 del.setInt(1,t_no);
	 del.setInt(2,s_no);
	 del.executeUpdate();
	 //String sql1 ="delete from records where ticket_no = "+t_no+" and seat_no = "+s_no;
	 //ResultSet result1 = state.executeQuery(sql1);
	 //String sql2 ="delete from reserves where ticket_no = "+t_no+" and bus_id = "+b_no;
	 //ResultSet result2 = state.executeQuery(sql2);
	 PreparedStatement del2= connect.prepareStatement("delete from reserves where ticket_no = ? and bus_id = ?");
	 del2.setInt(1,t_no);
	 del2.setInt(2,b_no);
	 del2.executeUpdate();
	 out.println("You Have been successfully cancel your ticket!! And your payment is returned in card no ::"+credit_card_no);
	 }
	 else
	 {
		out.println("You Can not cancel ticket. Since Time for cancellation of this ticket is over!!!");
	 }
	 }
	 else
	 {
	 out.println("This Ticket Is Not Booked By You!!");
	 }
	 }
	 catch(Exception e)
	 {
	 out.println(""+e);
	 }
	 connect.close();
 %>
 
 <form method = "get" action = "cancel1.jsp">
<p>
<input type="submit" value="Back" >
</p>
</form>
 </body>
 </html>