<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="HotelReservation.*" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Rating type</title>
</head>
<body bgcolor="#A3E4D7">
<div align="center"><font size="9">Hulton Hotels Corporation Page</font></div>
 <hr>
    <br>
    
    <%
    String CheckIn = request.getParameter("CheckIn");
    String CheckOut = request.getParameter("CheckOut");
    String MID = request.getParameter("MID");
    
    
    %>
    <h4 align="center">Select type from below </h4>
    <br>
    <form method = "post" action = "rating.jsp">
	<div align = "center">
	<table>
	<select name="type">
	<option value="1">Highest Rated Room Type</option>
	<option value="2">The best Customers</option>
	<option value="3">Highest Rated Breakfast Type</option>
	<option value="4">Highest Rated Service Type</option>
	</select>
	</table>
	<br>
	<tr>
	<td><input type = "hidden" Name = "CheckIn" value = '<%=CheckIn%>'></td>
	</tr>
	
	<tr>
	<td><input type = "hidden" Name = "CheckOut" value = '<%=CheckOut%>'></td>
	</tr>
	
	<td><input type="submit" value="Submit">
		
	
	
	</div>
	<tr>
	<td><input type = "hidden" Name = "MID" value = '<%=MID%>'></td>
	</tr>
	</form>
	<br>
	<form method = "post" action = "managerlogout.jsp">
<div align = "center">
	<input type="submit" value = "Logout">
	</div>
</form>
    
    
</body>
</html>