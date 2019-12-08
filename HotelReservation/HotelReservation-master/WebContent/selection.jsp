
<%@ page import="HotelReservation.*" %>    
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<html>

<head>
	<title>Hotel Selection - Hulton Hotels Booking System</title>
	<link rel = "stylesheet" type="text/css" href = "css/room.css">
</head>
<body>
<div align="center"><font size="9" color="darklime">Hulton Hotels Booking System</font></div>
<hr>
    <br>
    <div align="center"><table bgcolor="skyblue"><tr><td><font size="4">Please Select Hotel by Entering Hotel ID Number and Enter Check In/Out Date</font></td></tr></table></div>
    <br>
    
    <script type="text/javascript">

    function validate_form() {

      
      var Date = document.forms["DateForm"]["CheckIn"].value;
      if (Date.length != 10) {
        alert("Please Enter Correct Date format -  yyyy-mm-dd ");
        return false;
      }
      var Date1 = document.forms["DateForm"]["CheckOut"].value;
      if (Date1.length != 10) {
        alert("Please Enter Correct Date format -  yyyy-mm-dd ");
        return false;
      }
      
      var checkInValue = document.getElementById("CheckIn").value;
      var checkOutValue = document.getElementById("CheckOut").value;

      if((new Date(checkInValue).getTime() < new Date(checkOutValue).getTime())) 
      {
      	alert("Warning: Check-In Date Must Be Less Than The Check-Out Date!");
          return false;
      }
      return true;
    }
  </script>
    <%
    
    //String CID = session.getAttribute("CID").toString();
    String CID = request.getParameter("CID");
	//out.println("<td>" + CID + "</td>");
    
    String Country = request.getParameter("Country");
    String State = request.getParameter("State");
    
    ConnectionDatabase db = new ConnectionDatabase();
    Connection con = db.getConnection();
    ResultSet r;

    String q = "select *from Hotell where Country = ? and State = ?";
    PreparedStatement s = con.prepareStatement(q);
    s.setString(1,Country);
    s.setString(2,State);
    
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
	
	
	if(!r.next()) //if no flights found
	{
		db.closeConnection(con);
		out.write("<div align=\"center\">");
		out.write("No Country exists");
		return;
	}
	%>
	<form name = "DateForm" method="post" action="roomSelection.jsp" onsubmit ="return validate_form()">
	<% 
	out.write("<div align=\"center\">");
	out.write("<table border=\"1\"  bgcolor=\"skyblue\" >");
	out.write("<tr>");
	out.write("<th>Select</th>");
	out.write("<th>HotelID</th>");
	out.write("<th>Street</th>");
	out.write("<th>City</th>");
	out.write("<th>ZipCode</th>");
	out.write("</tr>");
	
    do
    {
    	int HotelID = r.getInt(1);
    	String Street = r.getString(2);
    	String City = r.getString(3);
    	String ZipCode = r.getString(5);
    	
    	 
    	
    	out.write("<div align=\"center\">");
    	out.write("<tr>"); 
    	%>	
		<td><input type="radio" name="hID" value='<%= HotelID %>' required>
		<%
    	out.write("<td>"+HotelID+"</td>");
    	out.write("<td>"+Street+"</td>");
    	out.write("<td>"+City+"</td>");
		out.write("<td>"+ZipCode+"</td>");
	
		
    }while(r.next());
    out.write("</table>");
    //out.write("<br><br><a href=\"login.jsp\">Return to login page</a>");
	db.closeConnection(con);
	%>
	
	<div align="center">
	
	</div>
	<div align="center">
	<br>
	<br>
	<tr>
	<td>Check In Date: </td>
	<td><input name ="CheckIn" type = "text" placeholder="yyyy-mm-dd" id = "CheckIn" maxlength = "10" required></td>
	</table>
	</div>
	<div align="center">
	<table>
	<tr>
	<td>Check Out Date: </td>
	<td><input name ="CheckOut" type = "text" placeholder="yyyy-mm-dd" id = "CheckOut" maxlength = "10" required></td>
	</table>
	<br>
	<div align = "center">
	<input type="submit" value = "Submit">
	</div>
	
	 <tr>
	<td><input type = "hidden" Name = "CID" value = '<%=CID%>'></td>
	</tr>
	
</form>
<br>
<form method = "post" action= "logout.jsp">
<div align = "center">
	<input type="submit" value = "Logout">
	</div>
</form>
</body>
</html>
    
    
    
    