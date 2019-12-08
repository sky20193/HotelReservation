<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
<title>Enter payment</title>
<link rel = "stylesheet" type="text/css" href = "css/paymet.css">
</head>



<script> type = "text/javascript"
	
	function validate_form(){
	var len = document.forms["PayForm"]["cardNumber"].value; 
	if(len.length != 16){
		alert("Make sure your Credit Card Number is 16 digit.");
		return false;
	}
	
	var clen = document.forms["PayForm"]["Cvc"].value; 
	if(clen.length !=3 && clen.length != 4){
		alert("Make sure your CVV number.");
		return false;
	}
	
	var Date = document.forms["PayForm"]["ExpDate"].value;
    if (Date.length != 7) {
      alert("Please Enter Correct Date format - mm-yyyy ");
      return false;
    }
    
    var price = document.forms["payForm"]["amount"].value;
    if(price.length == 0 || price.length == 1)
    	{
    	alert("Enter Correct amount");
    	return false;
    	}
    
	
	return true;
}
</script>


<body bgcolor="#85C1E9">

    <%
    
    //String CID = session.getAttribute("CID").toString();
    String CID = request.getParameter("CID");
    
    String radio = request.getParameter("rad");
    
    
    String hotelid = request.getParameter("HotelID");
    String chkin = request.getParameter("CheckIn");
    String chkout = request.getParameter("CheckOut");
    String roomNumber = request.getParameter("Room_no");
    //String p = request.getParameter("price");
    String breakfast = request.getParameter("breakfast");
    String order = request.getParameter("order");
    //out.write("<td>" + breakfast+ "</td>");
    
   // int pr = Integer.parseInt(p);
    //String dayString = "Select DATEDIFF(chkin, chkout);";
    int o = Integer.parseInt(order);
    
    int days = 1;
    ConnectionDatabase db = new ConnectionDatabase();
    Connection con = db.getConnection();
    ResultSet r,w;
    
   
    String price = "select * from RoomReserve R where R.HotelID = ? and R.Room_no = ? ";
    
    //String disc = "select R.disc from RoomReserve R where R.HotelID = ? ";
    //double cPrice = Double.parseDouble(price);
    //double cDisc = Double.parseDouble(disc);
    PreparedStatement s = con.prepareStatement(price);
	s.setString(1, hotelid);
	s.setString(2,radio);

	
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
		out.write("<div align=\"center\">");
    	out.write("<tr>");
		out.write("All Rooms are booked for this Hotel.");
		out.write("</tr>");		
		return;
	}
	
	float cPrice=0;
	float cDisc=0;
	float totalCost=0;
	

	// Date din = new Date(chkIn);
	cPrice= r.getFloat(7);
	cDisc = r.getFloat(12);
	
	 String brea = "select * from RoomReserve where breakfast = ? and HotelID = ?";
	    PreparedStatement g = con.prepareStatement(brea);
	   // g.setString(1,hotelid);
	   g.setString(1,breakfast);
	   g.setString(2,hotelid);
	    
	    try
	    {
	    w = g.executeQuery();
	    }
	    catch (SQLException e)
		{
			db.closeConnection(con);
			response.sendRedirect("dbError.jsp");
			e.printStackTrace();
			return;
		}
	    int bPrice = 0;
	    if(w.next())
	    {
	     bPrice = w.getInt(15);
	    }
	    
	SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-mm-dd");
	
	float d =0;
	float br=0; 
	 try 
	 {
	       Date dateBefore = myFormat.parse(chkin);
	       Date dateAfter = myFormat.parse(chkout);
	       long difference = dateAfter.getTime() - dateBefore.getTime();
	       float daysBetween = (difference / (1000*60*60*24));
              /* You can also convert the milliseconds to days using this method
               * float daysBetween = 
               *         TimeUnit.DAYS.convert(difference, TimeUnit.MILLISECONDS)
               */
               d= (cPrice * daysBetween) * cDisc ;
               totalCost = (cPrice * daysBetween) - (d);
               br = bPrice * daysBetween * o;
              // out.println("<b>  CheckIn Date: " + daysBetween + " </b>");
              
	 } 
	 catch (Exception e) 
	 {
	       e.printStackTrace();
	 }
  
	 String ta = String.valueOf(totalCost+br) ;
	if(br != 0)
	{
	out.println("<div align=\"center\">");
	out.println("<b> <font size=\"5\" color=\"Darklime\">Breakfast price for stay  $ " + br + "</font></b>");
	}
	if(br == 0)
	{
		out.println("<div align=\"center\">");
		out.println("<b> <font size=\"5\" color=\"Darklime\">You didn't order any Breakfast</font></b>");
	}
	out.println("<br>");
	out.println("<b> <font size=\"5\" color=\"Darklime\">Your discount was $ " + d + "</font></b>");
	out.println("<br>");
	out.println("<tr> </tr>");
	out.println("<b> <font size=\"5\" color=\"Darklime\">Your total cost with Breakfast After Discount is:$ " + (totalCost+br) + "</font></b>");
	out.println("<hr>");
	
	db.closeConnection(con);
	//out.println("<b>  CheckIn Date: " + chkin + " </b>");
	//out.println("<b>  CheckOut Date: " + chkout + " </b>");
	//out.println("<b>  Number of Days: " + dayString + " </b>");
	
    %>



<form name = "PayForm" method="post" action="roomReservation.jsp" onsubmit ="return validate_form()">
	<div align="center">
 <br/>
 <br/>
 <div align="center"><font size="4">Please Enter Your Payment Information </font></div>    
<br/>

<tr>
	<td><input type = "hidden" Name = "HotelID" value = '<%=hotelid%>'></td>
	</tr>
	
	<tr>
	<td><input type = "hidden" Name = "Room_no" value = '<%=radio%>'></td>
	</tr>
	
	<tr>
	<td><input type = "hidden" Name = "CheckIn" value = '<%=chkin%>'></td>
	</tr>
	
	<tr>
	<td><input type = "hidden" Name = "CheckOut" value = '<%=chkout%>'></td>
	</tr>
	<table>
	 <tr>
     <td>Card Holder's name</td>
     <td><input name ="cardName" type = "text" placeholder="Name"  required></td>
     </tr>
     
     <tr>
     <td>Billing Address</td>
     <td><input name ="BillingAddress" type = "text" placeholder="Address"  required></td>
     </tr>
     
     <tr>
     <td>Card Type</td>
     <td><input name ="type" type = "text" placeholder="type"  required></td>
     </tr>
     
      <tr>
     <td>Card Number</td>
     <td><input name ="cardNumber" type = "number" placeholder="0000000000000000" maxlength = "16" required></td>
     </tr>
     
      <tr>
     <td>CVV</td>
     <td><input name ="Cvc" type = "number" placeholder="000" minlength = "3" maxlength="4" required></td>
     </tr>
     
     <tr>
     <td>Expiration Date</td>
     <td><input name ="ExpDate" type = "text" placeholder="mm-yyyy"  maxlength="7" required></td>
     </tr>
     
     <br/>
     </table>
     <br/>
     <table>
     <tr>
     <td>Total Amount Due</td>
     <td><input name ="amount" type = "text" value="<%=(totalCost+br) %>" readonly></td>
     </tr>
     </table>
     
     <br/><br/>

<input type="submit" value="Pay">
 <tr>
	<td><input type = "hidden" Name = "CID" value = '<%=CID%>'></td>
	</tr>
<br/><br/>
</div>
<div align="center">
	    <a class="active" href="logout.jsp">Click here to logout!</a>
	  </div>
</form>
</body>
</html>