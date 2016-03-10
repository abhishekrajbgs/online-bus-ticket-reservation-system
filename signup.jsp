<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<html>
<body background="59.jpg">
<marquee><h2 style="color:green">WELCOME TO B. H. R.    TRAVELS  </marquee></h2>

<% Class.forName("com.mysql.jdbc.Driver");
	  
	  //get connection
	 Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/project?user=root&password=badal");
	  
	  //statement query
	 Statement state =connect.createStatement();
	 try
	 {
	String a= request.getParameter("t1");
	String b= request.getParameter("t2");
	String c= request.getParameter("t3");
	String d= request.getParameter("t4");
	String e= request.getParameter("t5");
	PreparedStatement insert= connect.prepareStatement("insert into user_details values(?,?,?,?,?)");
	insert.setString(1,a);
	insert.setString(2,b);
	insert.setString(3,c);
	insert.setString(4,d);
	insert.setString(5,e);
	insert.executeUpdate();
	out.println("congratulation !!!!!!!!!! your account has been created successfully");
	}
	catch(Exception e)
	{
	out.println("try again later");
	}  connect.close();
	   %>

<b><form method = "get" action = "login.html">
<p>
<input type="submit" value="Back">
</p>
</form></b>
</body>
</html>