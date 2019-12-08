<%@ page import="HotelReservation.*" %>    
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*"%>

<html>

<head>
	<title>Room Selection - Hulton Hotels Booking System</title>
</head>


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

      return true;
    }
  </script>
  
  
<body bgcolor="#A3E4D7">
<div align="center"><font size="9" color="darklime">Hulton Hotels Booking System</font></div>
<hr>
    <br>
    <div align="center"><font size="3">Please Select Room by Entering Room Number </font></div>
    <br>
    <%
    
    //String CID = session.getAttribute("CID").toString();
    String CID = request.getParameter("CID");
    String HotelID = request.getParameter("HotelID");
    String CheckIn = request.getParameter("CheckIn");
	String CheckOut = request.getParameter("CheckOut");
    
	String radio = request.getParameter("hID");
    ConnectionDatabase db = new ConnectionDatabase();
    Connection con = db.getConnection();
    ResultSet r ,w;
    
    String q1 = "select *from RoomReserve where HotelID = ?";
    PreparedStatement s1 = con.prepareStatement(q1);
	s1.setString(1, radio);
	
	w = s1.executeQuery();
	List<String> breakfast = new ArrayList<String>();
	
	while(w.next())
	{
		breakfast.add(w.getString("breakfast"));
		for (int i = 1; i < breakfast.size(); i++) {
	        String a1 = breakfast.get(i);
	        String a2 = breakfast.get(i-1);
	        if (a1.equals(a2)) {
	            breakfast.remove(a1);
	        }
	    }
	}
	
	
	
    
    String q = "select * from RoomReserve where HotelID = ? and status = 1 ";
    PreparedStatement s = con.prepareStatement(q);
	s.setString(1, radio);
    
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
	
	out.write("<div align=\"center\">");
	out.write("<table border=\"1\" bgcolor=\"skyblue\">");
	out.write("<tr>");
	out.write("<th>Select</th>");
	out.write("<th>Room_no</th>");
	out.write("<th>Type</th>");
	out.write("<th>Capacity</th>");
	out.write("<th>Description</th>");
	out.write("<th>Discount</th>");
	out.write("<th>Price</th>");	
	out.write("</tr>");
	%>
	<form name = "DateForm" method="post" action="payment.jsp">
     <% 
	do
	{
		int Room_no = r.getInt(2);
		String tpe = r.getString(3);
		int Capacity = r.getInt(4);
		String Description = r.getString(5);
		String Discount = r.getString(6);
		double Price = r.getDouble(7);
		
		
		
		out.write("<div align=\"center\">");
    	out.write("<tr>"); 
    	%>	
		<td><input type="radio" name="rad" value='<%= Room_no %>' required>
		<% 
    	out.write("<td>"+Room_no+"</td>");
    	out.write("<td>"+tpe+"</td>");
    	out.write("<td>"+Capacity+"</td>");
		out.write("<td>"+Description+"</td>");
		out.write("<td>"+Discount+"</td>");
		out.write("<td>"+Price+"</td>");
		
		
	}while(r.next());
	 out.write("</table>");
	    //out.write("<br><br><a href=\"login.jsp\">Return to login page</a>");
	db.closeConnection(con);
    %>
    <tr>
	<td><input type = "hidden" Name = "CID" value = '<%=CID%>'></td>
	</tr>
	
	<div align="center">
	<table bgcolor="skyblue">
	<tr>
	<tr>
	<td><input type = "hidden" Name = "HotelID" value = '<%=radio%>'></td>
	</tr>
	
	<tr>
	<td><input type = "hidden" Name = "CheckIn" value = '<%=CheckIn%>'></td>
	</tr>
	
	<tr>
	<td><input type = "hidden" Name = "CheckOut" value = '<%=CheckOut%>'></td>
	</tr>
	</table>
	</div>
	<table bgcolor="skyblue">
	<div align="center">
	<br>
	<%
	out.println("<table bgcolor=\"skyblue\">");
    out.println("<tr>");
    out.println("<td>");
	out.println("Breakfast Type: <select name=\"breakfast\">");
    for(String brea : breakfast)
    {
      out.println("<option value=\"" + brea + "\" >" + brea + "</option>");
     }
    
    out.println("</select>");
	
	%>
	<br>
	</table>
	<br>
	<table>
	<td>Number of Breakfast order per Day: </td>
	<td><input name = "order" type = "number" required>
		</div>
		</table>
		<br>
	<div align = "center">
	<input type="submit" value = "Submit">
	</div>
	<br>
	  <br>
	  <div align="center">
	    <a class="active" href="logout.jsp">Click here to logout!</a>
	  </div>
</form>
</body>
</html>
    

</body>
</html>