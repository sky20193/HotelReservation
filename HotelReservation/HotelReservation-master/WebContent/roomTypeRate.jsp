<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="HotelReservation.*" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>highest rated room type</title>
</head>

<body bgcolor = "#A3E4D7">
<div align="center"><font size="9">Hulton Hotels Corporation Page</font></div>
 <hr>
 <br>
 <br>
 
	<% 
	
	String CheckIn = request.getParameter("CheckIn");
    String CheckOut = request.getParameter("CheckOut");  
    String type = request.getParameter("type");
    
    String HotelID = request.getParameter("HotelID");
    String MID = request.getParameter("MID");
     
    
    ConnectionDatabase db = new ConnectionDatabase();
    Connection con = db.getConnection();
    ResultSet r ;
    
    String q = "select *from RoomReserve r where r.HotelID = ? and roomRating = 5";
    PreparedStatement s = con.prepareStatement(q);
    s.setString(1,HotelID);
      
    try
	{
    	 r = s.executeQuery();
	}
	catch(SQLException e)
	{
		db.closeConnection(con);
		out.write("<div align=\"center\">");
		out.write("<b>No Rating found in that Hotel.");
		out.write("<br><br><a href=\"index.jsp\"></a>");
		//response.sendRedirect("dbError.jsp");
		e.printStackTrace();
		return;
	}
	if(!r.next())
	{
		db.closeConnection(con);
		out.write("<div align=\"center\">");
		out.write("<b>No Rating found in that Hotel.");
		out.write("<br><br><a href=\"index.jsp\"></a>");
		   //response.sendRedirect("dbError.jsp");
		   return;
	}
	out.write("<div align=\"center\">");
	//out.write("Highest Rated Room type in this hotel is:");
	out.println("<font size=\"6\" color=\"darklime\">Highest Rated Room type in this hotel is:" +"</font>");
   	do
   	{
   		String t = r.getString(3);
    	out.write("<div align=\"center\">");
		out.write("<tr>"); 
		out.write("<td>"+"<b>"+ "<font size=\"6\">"+ t + "</font>"+ "</td>");
   	}while(r.next());
    	
    
    %>  
<br>
<form method = "post" action = "rating.jsp">
<br>
<br>
<div align = "center">
	<input type="submit" value = "Select Another HotelID">
	</div>
	
	<tr>
	<td><input type = "hidden" Name = "type" value = '<%=type%>'></td>
	</tr>
	
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
<form method = "post" action = "ratingType.jsp">
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

</body>
</html>