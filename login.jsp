<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<html>
<body background="53.jpg">
<marquee><h2 style="color:green">WELCOME TO B. H. R.    TRAVELS  </marquee></h2>
<%
String a= request.getParameter("t1");
String b= request.getParameter("t2");
  Class.forName("com.mysql.jdbc.Driver");
	  
	  //get connection
	 Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/project?user=root&password=badal");
	  
	  //statement query
	 Statement state =connect.createStatement();
	  ResultSet result = state.executeQuery("select user_id,pwd from user_details");
	        int flag = 0;
		  String pwd ;
		  String user_id ;
	  while(result.next()){
			user_id =result.getString("user_id");
		   pwd = result.getString("pwd");
		    if(a.equals(user_id))
			{
				if(b.equals(pwd))
				{
					 flag = 1;
					 out.println("hi  " +user_id+ " logged in successfully");
					 application.setAttribute("id",user_id);
					 String site = new String("Booking.jsp");
					 response.setStatus(response.SC_MOVED_TEMPORARILY);
					 response.setHeader("Location", site); 
				}
			}
			
			
	  }
	  if(flag==0)
	  {
	  out.println("your id/pwd is wrong");
	  }
	   connect.close();
 %>
 </body>
 </html>