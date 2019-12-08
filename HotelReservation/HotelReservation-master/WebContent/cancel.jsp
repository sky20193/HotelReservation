<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="HotelReservation.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#76D7C4">
    <div align="center"><font size="9">Hulton Hotels Booking System</font></div>
    <br>

<%
	String Confirm = request.getParameter("confirm");
	String HotelId = request.getParameter("HotelId");
	String Room_no = request.getParameter("Room_no");
	

	ConnectionDatabase db = new ConnectionDatabase();
	Connection con = db.getConnection();
	
	int result;
	
	int status = 1;
	double price = 0;
	String in = "0000-00-00";
	String o = "0000-00-00";
	String co = "0";
	
	String sta = String.valueOf(status);
	String pri = String.valueOf(price);
	
	String q = "Update RoomReserve set status = ?,totalPayment =?, CheckIn=?,CheckOut=? ,confirmation=? where HotelID = ? and Room_no = ? ;";
	PreparedStatement s = con.prepareStatement(q);
	s.setString(1,sta);
	s.setString(2,pri);
	s.setString(3,in);
	s.setString(4,o);
	s.setString(5,co);
	s.setString(6,HotelId);
	s.setString(7,Room_no);
	
		status = s.executeUpdate();
	
	
		out.println("<div align=\"center\">");
		out.println("<font size=\"6\">Your Reservation has been Cancelled and Your card will not be charged!</font>");
		out.println("<br>");
		out.println("<br>");
		out.println("<form action=\"logout.jsp\">");
		out.println("  <div align=\"center\">");
		out.println("    <input type=\"submit\" value=\"You may Logout now\" />");
		out.println("  </div>");
		out.println("</form>");
	
	db.closeConnection(con);
	
%>


</body>
</html>