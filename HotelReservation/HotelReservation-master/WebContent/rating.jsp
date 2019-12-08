<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="HotelReservation.*" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>rating page</title>
</head>

<body bgcolor="#A3E4D7">
<div align="center"><font size="9">Hulton Hotels Corporation Page</font></div>
 <hr>
 <br>
 <br>
   
    <%
    String CheckIn = request.getParameter("CheckIn");
    String CheckOut = request.getParameter("CheckOut");
    String MID = request.getParameter("MID");
    
    String type = request.getParameter("type");
    int tr = Integer.parseInt(type);

    ConnectionDatabase db = new ConnectionDatabase();
    Connection con = db.getConnection();
    ResultSet r,y ;
    
    
    if(tr == 1)
    {
    	String q = "select distinct r.HotelID from RoomReserve r where (r.CheckIn >= ? AND r.CheckOut <= ?);";
    	PreparedStatement s = con.prepareStatement(q);
    	s.setString(1,CheckIn);
    	s.setString(2,CheckOut);
    	
    	try
    	{
    		r = s.executeQuery();
    	}
    	catch(SQLException e)
    	{
    		db.closeConnection(con);
    		response.sendRedirect("dbError.jsp");
    		e.printStackTrace();
    		return;
    	}
    	if(!r.next())
    	{
    		db.closeConnection(con);
    		out.write("<div align=\"center\">");
    		out.write("<b>No Rating between this dates.");
    		out.write("<br><br><a href=\"index.jsp\">Return to index</a>");
    		//response.sendRedirect("dbError.jsp");
    		return;
    	}
    	%>
		<div align = "center">
		<h5 align ="center"><font size = "4"><font color = "darklime"><b>These are the hotels which had reservation and rating between begin and end date</font></font></h5>
		<h5 align ="center"><font size = "4"><font color = "darklime"><b>Enter HotelId to see Highest Rated Room type in that Hotel</font></font></h5>
		</div>
		
		 <form method = "post" action = "roomTypeRate.jsp">
		<% 
		out.write("<div align=\"center\">");
		out.write("<table border=\"1\" bgcolor=\"skyblue\">");
		out.write("<tr>");
		out.write("<th>Selection</th>");
		out.write("<th>HotelID</th>");
		out.write("<th>Address</th>");
		
    	do{
    		int hotelID;
    		String h;
    		hotelID = r.getInt(1);
    		h = String.valueOf(hotelID);
    		
    		String w = "Select *from Hotell where HotelID = ?";
    		PreparedStatement t = con.prepareStatement(w);
    		t.setString(1,h);
    	
    		y = t.executeQuery();
    		
    		String Street="";
    		String City="" ;
    		String State ="";
    		String Country="";
    		
    		if(y.next())
    		{
    		 Street = y.getString(2);
    		 City = y.getString(3);
    		 State = y.getString(6);
    		 Country = y.getString(4);
    		}
    		
    		out.write("<div align=\"center\">");
    		out.write("<tr>"); 
    		%>	
    		<td><input type="radio" name="HotelID" value='<%= hotelID %>' required>
    		<%
    		out.write("<td>"+hotelID+"</td>");
    		out.write("<td>"+Street+","+City+","+State+","+Country+"</td>");
    				
    	}while(r.next());
    	db.closeConnection(con);
    	
    	%>
   
    <br>
    <div align="center">
	<table>
	<tr>
	</div>
	<br>
	<div align = "center">
	<input type="submit" value = "Submit">
	</div>
    <tr>
	<td><input type = "hidden" Name = "CheckIn" value = '<%=CheckIn%>'></td>
	</tr>
	
	<tr>
	<td><input type = "hidden" Name = "CheckOut" value = '<%=CheckOut%>'></td>
	</tr>
	
	<tr>
	<td><input type = "hidden" Name = "type" value = '<%=type%>'></td>
	</tr>
	
	<tr>
	<td><input type = "hidden" Name = "MID" value = '<%=MID%>'></td>
	</tr>
    
    </form>	
    
    <%	
    }
    if(tr == 2)
    {
    	String q = "SELECT *FROM RoomReserve where CheckIn >= ? AND CheckOut <= ? ORDER BY totalPayment DESC LIMIT 5 ;";
    	PreparedStatement s = con.prepareStatement(q);
    	s.setString(1,CheckIn);
    	s.setString(2,CheckOut);
    	
    	try
    	{
    		r = s.executeQuery();
    	}
    	catch(SQLException e)
    	{
    		db.closeConnection(con);
    		response.sendRedirect("dbError.jsp");
    		e.printStackTrace();
    		return;
    	}
    	if(!r.next())
    	{
    		db.closeConnection(con);
    		out.write("<div align=\"center\">");
    		out.write("<b>Nothing found between those dates.");
    		out.write("<br><br><a href=\"index.jsp\">Return to index</a>");
    		   return;
    	}
    	
    	String name = "";
    	ResultSet l ;
    	
    	%>
		<div align = "center">
		<h5 align ="center"><font size = "4"><font color = "darklime"><b>Top 5 Customers and the amount of money they spent.</font></font></h5>
		</div>
		<% 
		
    	out.write("<div align=\"center\">");
		out.write("<table border=\"1\" bgcolor=\"skyblue\">");
		out.write("<tr>");	
		out.write("<th>Customer Name</th>");
		out.write("<th>Money Spend</th>");
		
    	do
    	{
    		int confirm = r.getInt(11);
    		double money = r.getDouble(13);
    		
    		
    		String conf = String.valueOf(confirm);
    		
    		String q1 = "Select *from Customer where confirmation = ?;";
    		PreparedStatement s1 = con.prepareStatement(q1);
    		s1.setString(1,conf);
    		
    		try
    		{
    			l= s1.executeQuery();
    		}
    		catch(SQLException e)
        	{
        		db.closeConnection(con);
        		response.sendRedirect("dbError.jsp");
        		e.printStackTrace();
        		return;
        	}
    		if(l.next())
    		{
    			name = l.getString(2);
    		}
    		
    		out.write("<div align=\"center\">");
    		out.write("<tr>"); 

    		out.write("<td>"+name+"</td>");
    		out.write("<td>"+"$"+money+"</td>");
    		
    		
    	}while(r.next());
    	db.closeConnection(con); 
    	
    	
    	%>
  <form method = "post" action = "ratingType.jsp">
    <br>
    <div align="center">
	<table>
	<tr>
	<br>
	</table>
	</div>
	<br>
	<div align = "center">
	<input type="submit" value = "Check Another RatingType">
	</div>
    <tr>
	<td><input type = "hidden" Name = "CheckIn" value = '<%=CheckIn%>'></td>
	</tr>
	
	<tr>
	<td><input type = "hidden" Name = "CheckOut" value = '<%=CheckOut%>'></td>
	</tr>
	
	<tr>
	<td><input type = "hidden" Name = "MID" value = '<%=MID%>'></td>
	</tr>
    
    </form>	
    
    <br>
	<form method = "post" action = "managerLogin.jsp">
	<tr>
	<td><input type = "hidden" Name = "MID" value = '<%=MID%>'></td>
	</tr>
	<div align = "center">
	<input type="submit" value = "Select different Dates">
	</div>
	</form>
<br>
	<form method = "post" action = "managerlogout.jsp">
<div align = "center">
	<input type="submit" value = "Logout">
	</div>
</form>
    
    <%	
    }
    
    
    if(tr == 3)
    {
    	String q = "select  *from RoomReserve r where (r.CheckIn >= ? AND r.CheckOut <= ?) having (r.breakRating = 5);";
    	PreparedStatement s = con.prepareStatement(q);
    	s.setString(1,CheckIn);
    	s.setString(2,CheckOut);
    	
    	try
    	{
    		r = s.executeQuery();
    	}
    	catch(SQLException e)
    	{
    		db.closeConnection(con);
    		response.sendRedirect("dbError.jsp");
    		e.printStackTrace();
    		return;
    	}
    	if(!r.next())
    	{
    		db.closeConnection(con);
    		out.write("<div align=\"center\">");
    		out.write("<b>No Rating between this dates.");
    		out.write("<br><br><a href=\"index.jsp\">Return to index</a>");
    		   return;
    	}
    	out.write("<div align=\"center\">");
    	//out.write("Highest Rated Room type in this hotel is:");
    	out.println("<font size=\"6\" color=\"darklime\">Highest Rated Breakfast Type across all Hotel" +"</font>");
       	do
       	{
       		String t = r.getString(14);
        	out.write("<div align=\"center\">");
    		out.write("<tr>"); 
    		out.write("<td>"+"<b>"+ "<font size=\"6\">"+ t + "</font>"+ "</td>");
       	}while(r.next());
       	db.closeConnection(con);
       %>
       <br>
       <br>
       <form method = "post" action = "ratingType.jsp">
       <br>
       <br>
		<div align = "center">
		<input type="submit" value = "Check Another Rating Type">
		</div>
	
	<tr>
	<td><input type = "hidden" Name = "CheckIn" value = '<%=CheckIn%>'></td>
	</tr>
	
	<tr>
	<td><input type = "hidden" Name = "CheckOut" value = '<%=CheckOut%>'></td>
	</tr>
	
	<tr>
	<td><input type = "hidden" Name = "MID" value = '<%=MID%>'></td>
	</tr>
	
</form>

<br>
	<form method = "post" action = "managerLogin.jsp">
	<tr>
	<td><input type = "hidden" Name = "MID" value = '<%=MID%>'></td>
	</tr>
	<div align = "center">
	<input type="submit" value = "Select different Dates">
	</div>
	</form>
<br>
	<form method = "post" action = "managerlogout.jsp">
<div align = "center">
	<input type="submit" value = "Logout">
	</div>
</form>
       	
    	<% 
    }
    if(tr == 4)
    {
    	String q = "select * from Service r where (r.CheckIn >= ? AND r.CheckOut <= ?) having (r.rating = 5);";
    	PreparedStatement s = con.prepareStatement(q);
    	s.setString(1,CheckIn);
    	s.setString(2,CheckOut);
    	
    	try
    	{
    		r = s.executeQuery();
    	}
    	catch(SQLException e)
    	{
    		db.closeConnection(con);
    		response.sendRedirect("dbError.jsp");
    		e.printStackTrace();
    		return;
    	}
    	if(!r.next())
    	{
    		db.closeConnection(con);
    		out.write("<div align=\"center\">");
    		out.write("<b>No Rating between this dates.");
    		out.write("<br><br><a href=\"index.jsp\">Return to index</a>");
    		   return;
    	}
    	out.write("<div align=\"center\">");
    	//out.write("Highest Rated Room type in this hotel is:");
    	out.println("<font size=\"6\" color=\"darklime\">Highest Rated Service Type across all Hotel" +"</font>");
       	do
       	{
       		String t = r.getString(2);
        	out.write("<div align=\"center\">");
    		out.write("<tr>"); 
    		out.write("<td>"+"<b>"+ "<font size=\"6\">"+ t + " "+ "Service"+ "</font>"+ "</td>");
    		
       	}while(r.next());
       	db.closeConnection(con);
       	
       %>
       <br>
       <br>
       <form method = "post" action = "ratingType.jsp">
       <br>
       <br>
<div align = "center">
	<input type="submit" value = "Check Another Rating Type">
	</div>
	<tr>
	<td><input type = "hidden" Name = "MID" value = '<%=MID%>'></td>
	</tr>
	
	<tr>
	<td><input type = "hidden" Name = "CheckIn" value = '<%=CheckIn%>'></td>
	</tr>
	
	<tr>
	<td><input type = "hidden" Name = "CheckOut" value = '<%=CheckOut%>'></td>
	</tr>
	
</form>

<br>
	<form method = "post" action = "managerLogin.jsp">
	<tr>
	<td><input type = "hidden" Name = "MID" value = '<%=MID%>'></td>
	</tr>
	<div align = "center">
	<input type="submit" value = "Select different Dates">
	</div>
	</form>
<br>
	<form method = "post" action = "managerlogout.jsp">
<div align = "center">
	<input type="submit" value = "Logout">
	</div>
</form>
       	
    	<% 
    }
       
    %>
</body>
</html>