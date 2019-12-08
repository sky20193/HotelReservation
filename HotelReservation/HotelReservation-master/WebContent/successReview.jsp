<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="HotelReservation.*" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Success</title>
</head>
<body bgcolor="#F5B7B1">
<div align="center"><font size="9" color="darklime">Hulton Hotels Review Page</font></div>
<hr>
    <br>
    <br>
    <div align="center"><font size="5" color="darklime">Thank you for taking time to write Review!</font></div>
    
    <br>
<%
	String confirm = request.getParameter("confirm");
    String type = request.getParameter("type");
    String comment = request.getParameter("comment");
    String star = request.getParameter("star");
    
    int t = Integer.parseInt(type);
    
    ConnectionDatabase db = new ConnectionDatabase();
    Connection con = db.getConnection();
    int r;
    
    if(t == 1)
    {
    	String q = "Update RoomReserve set breakfastReview = ? , breakRating=? where confirmation=?;";
    	PreparedStatement s = con.prepareStatement(q);
    	s.setString(1,comment);
    	s.setString(2,star);
    	s.setString(3,confirm);
    	
    	try
    	{
    		r = s.executeUpdate();
    	}
    	catch (SQLException e)
    	{
    		db.closeConnection(con);
    		response.sendRedirect("dbError.jsp");
    		e.printStackTrace();
    		return;
    	}
    	
    	if(r == 0)
    	{
    		db.closeConnection(con);
    		response.sendRedirect("dbError.jsp");
    		return;
    	}
    	db.closeConnection(con);
    }
    
    if(t == 2)
    {
    	String q = "Update RoomReserve set roomReview = ?,roomRating=? where confirmation=?;";
    	PreparedStatement s = con.prepareStatement(q);
    	s.setString(1,comment);
    	s.setString(2,star);
    	s.setString(3,confirm);
    	
    	try
    	{
    		r = s.executeUpdate();
    	}
    	catch (SQLException e)
    	{
    		db.closeConnection(con);
    		response.sendRedirect("dbError.jsp");
    		e.printStackTrace();
    		return;
    	}
    	
    	if(r == 0)
    	{
    		db.closeConnection(con);
    		response.sendRedirect("dbError.jsp");
    		return;
    	}
    	db.closeConnection(con);
    }
    
    if(t == 3)
    {
    	String q = "Update RoomReserve set hotelReview = ? , hotelRating=? where confirmation=?;";
    	PreparedStatement s = con.prepareStatement(q);
    	s.setString(1,comment);
    	s.setString(2,star);
    	s.setString(3,confirm);
    	
    	try
    	{
    		r = s.executeUpdate();
    	}
    	catch (SQLException e)
    	{
    		db.closeConnection(con);
    		response.sendRedirect("dbError.jsp");
    		e.printStackTrace();
    		return;
    	}
    	
    	if(r == 0)
    	{
    		db.closeConnection(con);
    		response.sendRedirect("dbError.jsp");
    		return;
    	}
    	db.closeConnection(con);
    }
   
    
    
%>

<form method = "post" action = "reviewType.jsp">
<div align = "center">
<input type="submit" value = "Write Another Review">
</div>

<tr>
	<td><input type = "hidden" Name = "confirm" value = '<%=confirm%>'></td>
	</tr>
</form>

<form method = "post" action = "login.jsp">
<br>
<div align = "center">
<input type="submit" value = "return to Login Page">

</div>
<br>
</form>
<div align="center">

<img src="images.jpg"  width="500" height="200">
</div>
</body>
</html>