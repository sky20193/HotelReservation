<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import="HotelReservation.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <title>Hulton Hotels Booking System</title>
  </head>

  <body bgcolor="#F5B041">
    <div align="center"><font size="9" color="darklime">Hulton Hotels Booking System</font></div>
    <hr>
    <br>

  

<%

String CID = request.getParameter("CID");

ConnectionDatabase db = new ConnectionDatabase();
Connection con = db.getConnection();
ResultSet r;

String q = "select *from Customer where CID = (select CID from Customer where CID = ?)";
PreparedStatement s = con.prepareStatement(q);
s.setString(1, CID);
try
{
	r = s.executeQuery();
}
catch (SQLException e)
{
	db.closeConnection(con);
	response.sendRedirect("dbError.jsp");
	e.printStackTrace();
	return;
}

if(!r.next())
{
	db.closeConnection(con);
	out.println("<div align=\"center\">");
	out.println("<font size=\"5\" color=\"black\"><b>Customer does not exist. Go back and try again.!"+"</font>");
	out.println("<a class=\"active\" href=\"updateProfile.jsp\"><font size=\"5\" color=\"blue\">Go Back!"+"</font>"+"</a>");
	return;
}

CID = r.getString(1);
String Name = r.getString(2);
String Address = r.getString(3);
String Phone_number = r.getString(4);
String Email = r.getString(5);		
			
%>

<form method="post" action="modifyCustomerSave.jsp">
	<div align="center">
	  <h4 align="center">You may change any of the fields below to update your information.</h4>
    <br>
	<table>
	<tr>
	<td>Name: </td>
	<td><input type = "text" Name = "Name" value = '<%=Name%>'></td>
	</tr>
	
	<tr>
	<td>Address: </td>
	<td><input type = "text" Name = "Address" value = '<%=Address%>'></td>
	</tr>
	
	<tr>
	<td>Email: </td>
	<td><input type = "text" Name = "Email" value = '<%=Email%>'></td>
	</tr>
	
	<tr>
	<td>Phone: </td>
	<td><input type = "text" Name = "Phone_number" value = '<%=Phone_number%>'></td>
	</tr>
	
	<tr>
	<td><input type = "hidden" Name = "CID" value = '<%=CID%>'></td>
	</tr>
	
	</table>
	</div>
	<br>
	<div align = "center">
	<input type="submit" value = "SaveChanges">
	</div>
	<br>
	  <br>
	  <div align="center">
	    <a class="active" href="logout.jsp"> Click here to logout!</a>
	  </div>
</form>
  </body>
</html>
