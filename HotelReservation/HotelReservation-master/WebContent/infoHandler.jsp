<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.*" %>
<%@ page import = "java.math.*" %>
<%@ page import = "HotelReservation.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>getting Reservation Info</title>
</head>
<body bgcolor="#76D7C4">
<div align="center"><font size="9">Hulton Hotels Booking System</font></div>
    <br>
   
<%
	String confirm = request.getParameter("confirm");

	String CID = request.getParameter("CID");

	ConnectionDatabase db = new ConnectionDatabase();
	Connection con = db.getConnection();
	ResultSet r ;
	
	String q = "select *from RoomReserve where confirmation = ? ";
    PreparedStatement s = con.prepareStatement(q);
    s.setString(1,confirm);

    
    try
	{
		r = s.executeQuery();
	}
	catch (SQLException e)
	{
		db.closeConnection(con);
		out.println("<div align=\"center\">");
    	out.println("<font size=\"5\" color=\"black\"><b>Invalid Confirmation Number"+"</font>");
    	out.println("<a class=\"active\" href=\"reserveInfo.jsp\"><font size=\"5\" color=\"blue\">Go back!"+"</font>"+"</a>");
		//response.sendRedirect("dbError.jsp");
		e.printStackTrace();
		return;
	}
	
	
	if(!r.next()) //if no flights found
	{
		db.closeConnection(con);
		out.println("<div align=\"center\">");
    	out.println("<font size=\"5\" color=\"black\"><b>No reservation Found"+"</font>");
    	out.println("<a class=\"active\" href=\"reserveInfo.jsp\"><font size=\"5\" color=\"blue\">Go back!"+"</font>"+"</a>");
		return;
	}
	%>
	 <div align="center"><font size="4">Here is Your Reservation Info</font></div>
    <br>
    <% 
		int unique = r.getInt(1);
	   	String id = "select *from Hotell where HotelID = ?";
		PreparedStatement id1 = con.prepareStatement(id); 
		id1.setInt(1,unique);
		
		ResultSet w;
		try{
			w = id1.executeQuery();
		}
		catch (SQLException e)
		{
			db.closeConnection(con);
			response.sendRedirect("dbError.jsp");
			e.printStackTrace();
			return;
		}
		
		
		if(!w.next()) //if no flights found
		{
			db.closeConnection(con);
			out.write("<div align=\"center\">");
			out.println("<font size=\"5\" color=\"black\"><b>No Reservation was Found!"+"</font>");
	    	out.println("<a class=\"active\" href=\"reserveInfo.jsp\"><font size=\"5\" color=\"blue\">Go back!"+"</font>"+"</a>");
			return;
		}
		
		String street = w.getString(2);
		String city = w.getString(3);
		String state = w.getString(6);
		String country = w.getString(4);
		int zip = w.getInt(5);
		
		out.write("<div align=\"center\">");
		out.write("<br>");
		//out.write("<table>");
		out.write("<th><b>Hotel Address:</b></th>");
		//out.write("<tr>"); 
		//out.write("</table>");
		out.write("<td>"+street+"</td>");
		out.write("<th>, </th>");
		out.write("<td>"+city+"</td>");
		out.write("<th>, </th>");
		out.write("<td>"+state+"</td>");
		out.write("<th>, </th>");
		out.write("<td>"+country+"</td>");
		out.write("<th>, </th>");
		out.write("<td>"+zip+"</td>");
		out.write("<br>");
		out.write("<br>");
	
	    
	out.write("<div align=\"center\">");
	out.write("<table border=\"1\">");
	out.write("<tr>");
	//out.write("<th>HotelID</th>");
	out.write("<th>RoomNumber</th>");
	out.write("<th>Type</th>");
	out.write("<th>Capacity</th>");
	out.write("<th>Description</th>");
	out.write("<th>CheckInDate</th>");
	out.write("<th>CheckOutDate</th>");
	out.write("<th>PaymentYouMade</th>");
	out.write("</tr>");
	
	int HotelId;
	int Room_no;
	int room = r.getInt(2);
	do
    {
		HotelId = r.getInt(1);
    	Room_no = r.getInt(2);
    	String Type = r.getString(3);
    	String Capacity = r.getString(4);
    	String Description = r.getString(5);
    	String CheckIn = r.getString(8);
    	String CheckOut = r.getString(9);
    	double price = r.getDouble(13);
    	
    	    	
    	out.write("<div align=\"center\">");
    	out.write("<tr>"); 
    	//out.write("<td>"+HotelId+"</td>");
    	out.write("<td>"+Room_no+"</td>");
    	out.write("<td>"+Type+"</td>");
    	out.write("<td>"+Capacity+"</td>");
		out.write("<td>"+Description+"</td>");
		out.write("<td>"+CheckIn+"</td>");
		out.write("<td>"+CheckOut+"</td>");
		out.write("<td>"+"$"+price+"</td>");
		
		
    }while(r.next());
	
	
    out.write("</table>");
    //out.write("<td>"+HotelId+"</td>");
    //out.write("<td>"+Room_no+"</td>");
    	
/*	String h = String.valueOf(HotelId);
	
	String id = "select *from HotelInfo where HotelID = ?";
	PreparedStatement id1 = con.prepareStatement(id);
	id1.setString(1,h);
	
	r = id1.executeQuery();

	do{
	String street = r.getString(2);
	String city = r.getString(3);
	String state = r.getString(4);
	String country = r.getString(5);
	int zip = r.getInt(6);
	
	
	
	out.write("<div align=\"center\">");
	out.write("<th>HotelAddress</th>");
	out.write("<tr>"); 
	out.write("<td>"+street+"</td>");
	out.write("<td>"+city+"</td>");
	out.write("<td>"+state+"</td>");
	out.write("<td>"+country+"</td>");
	}while(r.next());
	*/
    //out.write("<br><br><a href=\"login.jsp\">Return to login page</a>");
	
	String g = "select CID from Customer where confirmation = ?";
	PreparedStatement j = con.prepareStatement(g);
	j.setString(1,confirm);
	
	ResultSet k = j.executeQuery();
	
	int c =0;
	if(k.next())
	{
	c = k.getInt(1);	
	}
	String c1 = String.valueOf(c);
	db.closeConnection(con);



%>
 <br>
	  <form method="post" action="cancel.jsp">
	<div align="center">
	
	<tr>
	<td><input type = "hidden" Name = "confirm" value = '<%=confirm%>'></td>
	</tr>
	
	
	<tr>
	<td><input type = "hidden" Name = "HotelId" value = '<%=HotelId%>'></td>
	</tr>
	
	
	<tr>
	<td><input type = "hidden" Name = "Room_no" value = '<%=Room_no%>'></td>
	</tr>
	
	</div>
	<br>
	<div align = "center">
	<input type="submit" value = "Cancel Reservation">
	</div>

</form>
<br>
<form method = "post" action= "selectCountryAndState.jsp">
<tr>
	<td><input type = "hidden" Name = "CID" value = '<%=c1%>'></td>
	</tr>
<div align = "center">
	<input type="submit" value = "Make A new Reseravation">
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