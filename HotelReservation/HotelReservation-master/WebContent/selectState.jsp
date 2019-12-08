<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="HotelReservation.*" %> 
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hotel Reservation System - Country and State Selection</title>
<link rel = "stylesheet" type="text/css" href = "css/country.css">
</head>
<body>
<div align="center"><font size="9" color="darklime">Hulton Hotels Booking System</font></div>
<hr>
    <br>
    <h5 align= "center"><font size="4">Please Select State from Given Options Below</font></h5>
    
    

<%
	String CID = request.getParameter("CID");
	//out.println("<td>" + CID + "</td>");
	
	
	String Country = request.getParameter("Country");

	List<String> stateList = new ArrayList<String>();
	ConnectionDatabase db = new ConnectionDatabase();
	Connection con = db.getConnection();
	ResultSet r;

	String q = "SELECT * from Hotell h where h.Country = ? ";
	PreparedStatement s = con.prepareStatement(q);
	s.setString(1,Country);
	
	try
	{
		r = s.executeQuery();
	}
	catch(SQLException e)
	{
	db.closeConnection(con);
	response.sendRedirect("dbError.jsp");
	e.printStackTrace();
	return;
	}
	if(!r.next())
	{
	db.closeConnection(con);
	response.sendRedirect("dbError.jsp");
	return;
	}
	
	
	while(r.next())
	{
		stateList.add(r.getString("State"));
		//out.println(stateList);
	}
	
	
	
	out.println("<form name=\"selectStateForm\" action=\"selection.jsp\" method=\"post\" onsubmit = \"return validate_form()\">");
    out.println("<div align=\"center\">");
    out.println("<div align=\"center\">");
    out.println("<table bgcolor=\"skyblue\">");
    out.println("<tr>");
    out.println("<td>");
    out.println("State <select name=\"State\" >");
    out.println("<br/>");
    out.println("<br/>");
    for(String State : stateList)
    {
      out.println("<option value=\"" + State + "\" >" + State + "</option>");
     }
    out.println("</tr>");
    out.println("</table>");
    out.println("</select>");
    out.println("<br/>");
    out.println("<br/>");
    out.println("<div align=\"center\">");
    out.println("<input type=\"submit\" value=\"Select State\">");
    out.println("<br/>");
    out.println("<br/>");
    out.println("<br/>");
    out.println("<br/>");
    out.println("<table bgcolor=\"skyblue\">");
    out.println("<tr>");
    out.println("<td>");
    out.println("<a class=\"active\" href=\"logout.jsp\">Log me out</a>");
    out.println("</tr>");
    out.println("</table>");
    out.println("</div>");
    %>
     <tr>
	<td><input type = "hidden" Name = "CID" value = '<%=CID%>'></td>
	</tr>
	
	<tr>
	<td><input type = "hidden" Name = "Country" value = '<%=Country%>'></td>
	</tr>
	<% 
    out.println("</form>");

	%>
	

</body>
</html>