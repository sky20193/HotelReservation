<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.Random.*" %>
<%@ page import = "java.math.*" %>
<%@ page import = "HotelReservation.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>confirmation</title>

</head>

<body bgcolor="#AED6F1">

<%
	String CID = request.getParameter("CID");

	String HotelID = request.getParameter("HotelID");
	String Room_no = request.getParameter("Room_no");
	String CheckIn = request.getParameter("CheckIn");
	String CheckOut = request.getParameter("CheckOut");
	String amount = request.getParameter("amount");

	
	ConnectionDatabase db = new ConnectionDatabase();
	Connection con = db.getConnection();
	int status;

	int lower = 100000000;;
	int upper =  999999999;

	int ID = (int)Math.floor(lower + Math.random() * upper);
	String Confirm = String.valueOf(ID);
	
	int s1 = 0 ;
	String set = String.valueOf(s1);
	
	String subject = "Confirmation Number";
	

	//String q = "insert into Reservation (Confirm,HotelID,Room_no,CheckIn,CheckOut) values (?,?,?,?,?);";
	String q = "Update RoomReserve set confirmation =?,CheckIn =?,CheckOut=?, status= ?,totalPayment=? where HotelID =? and Room_no =?;";
	PreparedStatement s = con.prepareStatement(q);
	s.setString(1, Confirm);
	s.setString(2, CheckIn);
	s.setString(3, CheckOut);
	s.setString(4, set);
	s.setString(5,amount);
	s.setString(6, HotelID);
	s.setString(7, Room_no);
	
	
	/*
	s.setString(1, Confirm);
	s.setString(2, HotelID);
	s.setString(3, Room_no);
	s.setString(4, CheckIn);
	s.setString(5, CheckOut);*/

	try
	{
		status = s.executeUpdate();
	}
	catch (SQLException e)
	{
		db.closeConnection(con);
		response.sendRedirect("DbError.jsp");
		e.printStackTrace();
		return;
	}
	
	if(status == 0)
	{
		db.closeConnection(con);
		response.sendRedirect("DbError.jsp");
		return;
	}
	if(status != 0)
	{
		out.println("<div align=\"center\">");
		out.println("<font size=\"6\" color=\"darklime\">Thank you for Reserving Room at our Hotel!</font>");
		out.println("<hr>");
		out.println("<br>");
		out.println("<br>");
		out.println("<font size=\"4\">Your Confirmation Number is:</font>");
		out.println("<br>");
		out.println("<br>");
		out.println("<b> <font size=\"5\">" + ID + "</font></b>");
		out.println("<br>");
		out.println("<br>");
		out.println(" <font size=\"3\">Please keep this number in a safe place.</font>");
		%>
		<form action="EmailSendingServlet" method="post">
		<table border="0" width="35%" align="center">
			<caption><h4>Please Enter Your Email Address below and we will send you confirmation number</h4></caption>
			<tr>
				<td width="50%">Email address </td>
				<td><input type="text" name="recipient" size="50"/ required></td>
			</tr>
			
			<tr>
				<td><input type="hidden" name="subject" value = '<%=subject%>' /></td>
			</tr>
			
			<tr>
				<td><input type = "hidden" name = "content" value = "Your Confirmation number is: '<%=ID %>'. Click on this link to write review - http://hotelreservation-env.us-west-2.elasticbeanstalk.com/reviews.jsp "> </td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="Send"/></td>
			</tr>
		</table>
		
	</form>
		
		
		
		<%
		out.println("<br>");
		out.println("<br>");
		out.println("<form action=\"logout.jsp\">");
		out.println("  <div align=\"center\">");
		out.println("  <input type=\"submit\" value=\"Logout\" />");
		out.println("  </div>");
		out.println("</form>");
	}
	

	
	String cardType = request.getParameter("type");
	String cardName = request.getParameter("cardName");
	String cardAddress=request.getParameter("BillingAddress");
	String cardNumber=request.getParameter("cardNumber");
	String cardCvc=request.getParameter("Cvc");
	String ExpDate = request.getParameter("ExpDate");

	
	
	
	String q1 = "insert into Payment (cardNumber,cardName,cardAddress,cardType,cardCvc,ExpDate) values (?,?,?,?,?,?);";
	//String q1 = "selece *from Customer";
	PreparedStatement q2 = con.prepareStatement(q1);
	
	q2.setString(1,cardNumber);
	q2.setString(2,cardName);
	q2.setString(3,cardAddress);
	q2.setString(4,cardType);
	q2.setString(5,cardCvc);
	q2.setString(6,ExpDate);
	
	int status1 = q2.executeUpdate();
	
/*
	try
	{
	int status1 = q2.executeUpdate();
	}
	catch (SQLException e)
	{
		db.closeConnection(con);
		response.sendRedirect("DbError.jsp");
		e.printStackTrace();
		return;
	}

*/

	String d = "update Customer set confirmation = ? where CID = ? ;";
	PreparedStatement u = con.prepareStatement(d);
	u.setString(1,Confirm);
	u.setString(2,CID);
	
	int c = u.executeUpdate();

	
	db.closeConnection(con);

	
%>
<br>
<div align="center">

<img src="images.jpg"  width="500" height="200">
</div>
</body>
</html>







