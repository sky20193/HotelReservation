<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="HotelReservation.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select Review Type</title>
</head>
<body bgcolor="#EDBB99">

<%

	String CID = request.getParameter("CID");
	String confirm = request.getParameter("confirm");
	
	ConnectionDatabase db = new ConnectionDatabase();
	Connection con = db.getConnection();
	ResultSet r;
	
	String q = "select *from RoomReserve where confirmation = ?";
	PreparedStatement s = con.prepareStatement(q);
	s.setString(1,confirm);
	
	try
	{
		r = s.executeQuery();
	}
	catch(SQLException e)
	{
		db.closeConnection(con);
		out.println("<div align=\"center\">");
    	out.println("<font size=\"5\" color=\"black\"><b>Invalid Confirmation Number!"+"</font>");
    	out.println("<a class=\"active\" href=\"reviews.jsp\"><font size=\"5\" color=\"blue\">Go back !"+"</font>"+"</a>");
		//response.sendRedirect("dbError.jsp");
		e.printStackTrace();
		return;
	}
	if(!r.next())
	{
	   db.closeConnection(con);
	   out.println("<div align=\"center\">");
   	   out.println("<font size=\"5\" color=\"black\"><b>Invalid Confirmation Number!"+"</font>");
   	   out.println("<a class=\"active\" href=\"reviews.jsp\"><font size=\"5\" color=\"blue\">Go back!"+"</font>"+"</a>");
	   //response.sendRedirect("dbError.jsp");
	   return;
	}
	

%>


<div align="center"><font size="9" color="darklime">Hulton Hotels Review Page</font></div>
<hr>
    <br>
    <div align="center"><font size="4">Please Select Review Type</font></div>
    <br>
<form method="post" action="writeReview.jsp">
	<div align="center">
	<table>
	<select name="type" size=1>
			<option value="1">Breakfast Review</option>
			<option value="2">Room Review</option>
			<option value="3">Hotel Review</option>
		</select>
	</table>
	
	</div>
	<br>
	<div align = "center">
	<input type="submit" value = "Submit">
	</div>
	<tr>
	<td><input type = "hidden" Name = "CID" value = '<%=CID%>'></td>
	</tr>
	<tr>
	<td><input type = "hidden" Name = "confirm" value = '<%=confirm%>'></td>
	</tr>
</form>


</body>
</html>