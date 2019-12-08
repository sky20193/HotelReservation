<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="HotelReservation.*" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>getting Id</title>
</head>
<body bgcolor="#A3E4D7">

<div align="center"><font size = "9">Hulton Hotel Booking System</font></div>
<hr>
<br>

<% 
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	
	ConnectionDatabase db = new ConnectionDatabase();
	Connection con = db.getConnection();
	ResultSet r;
	
	String q = "select * from Customer where Name = ? and Phone_number=?";
	PreparedStatement s = con.prepareStatement(q);
	s.setString(1,name);
	s.setString(2,phone);
	
	try
	{
		r = s.executeQuery();
	}
	catch(SQLException e)
	{
		db.closeConnection(con);
		out.println("<div align=\"center\">");
    	out.println("<font size=\"5\" color=\"black\"><b>No Customer Id exists!"+"</font>");
    	out.println("<a class=\"active\" href=\"login.jsp\"><font size=\"5\" color=\"blue\">Login Page!"+"</font>"+"</a>");
		//response.sendRedirect("dbError.jsp");
		e.printStackTrace();
		return;
	}
	if(!r.next())
	{
	   db.closeConnection(con);
	   out.println("<div align=\"center\">");
   	   out.println("<font size=\"5\" color=\"black\"><b>No Customer Id exists!"+"</font>");
   	   out.println("<a class=\"active\" href=\"login.jsp\"><font size=\"5\" color=\"blue\">Login Page!"+"</font>"+"</a>");
	   //response.sendRedirect("dbError.jsp");
	   return;
	 }
	
	
	do
	{
		
		%>
		<h5 align ="center"><font size = "5">Here is your Customer ID</font></h5>
		<% 
	int cid= r.getInt(1);
	out.write("<div align=\"center\">");
	out.write("<tr>"); 
	out.println("<b> <font size=\"5\">" + cid + "</font></b>");
	}while(r.next());
	
	
	db.closeConnection(con);
%>
<br>
<br>
 <form method = "post" action = "login.jsp">
 <div align = "center">
	<input type="submit" value = "You May Login Now">
	</div>
 </form>   
</body>
</html>