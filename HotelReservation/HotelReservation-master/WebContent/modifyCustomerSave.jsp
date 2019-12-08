<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="HotelReservation.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <title>Hulton Hotels Booking System</title>
  </head>

  <body bgcolor="#F5B041">
    <div align="center"><font size="9">Hulton Hotels Booking System</font></div>
    <br>
    
    <%
    
    String Name = request.getParameter("Name");
	String Address = request.getParameter("Address");
    String Email = request.getParameter("Email");
    String Phone_number = request.getParameter("Phone_number");
    String CID = request.getParameter("CID");
    
	
    ConnectionDatabase db = new ConnectionDatabase();
   	Connection con = db.getConnection();
   	int status;
   	
	String q = "Update Customer set Name=?,Address=?,Phone_number=?,Email=? where CID = ?;";
	PreparedStatement s = con.prepareStatement(q);
	s.setString(1,Name);
	s.setString(2,Address);
	s.setString(3,Phone_number);
	s.setString(4,Email);
	s.setString(5,CID);
	
	try
	{
		status = s.executeUpdate();
	}
	catch (SQLException e)
	{
		db.closeConnection(con);
		response.sendRedirect("dbError.jsp");
		e.printStackTrace();
		return;
	}
	
	if(status == 0)
	{
		db.closeConnection(con);
		response.sendRedirect("dbError.jsp");
		return;
	}
	db.closeConnection(con);
	
    %>
    
    <div align="center"><font size="4">Changes were made successfully!</font></div>
    <br>
    
    <form method = "post" action= "loginhandler.jsp">
<div align = "center">
	<tr>
	<td><input type = "hidden" Name = "CID" value = '<%=CID%>'></td>
	</tr>
 	<input type="submit" value = "MainPage">
	</div>
</form>

	  <br>
	  <form method = "post" action= "logout.jsp">
<div align = "center">
	<input type="submit" value = "Logout">
	</div>
</form>
</body>
</html>