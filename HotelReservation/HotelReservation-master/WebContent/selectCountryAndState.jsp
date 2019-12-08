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
<link rel = "stylesheet" type="text/css" href = "css/state.css">
</head>
<body>
<div align="center"><font size="9" color="darklime">Hulton Hotels Booking System</font></div>
<hr>
    <br>
    <h5 align= "center"><font size="4">Please Select Country from Given Options Below</font></h5>
    
    

<%
	String CID = request.getParameter("CID");
	
	
	List<String> countryList = new ArrayList<String>();

	ConnectionDatabase db = new ConnectionDatabase();
	Connection con = db.getConnection();
	ResultSet r;

	String q = "SELECT distinct h.Country from Hotell h";
	PreparedStatement s = con.prepareStatement(q);

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
		countryList.add(r.getString("Country"));
	}
	
	
	out.println("<form name=\"selectCountryForm\" action=\"selectState.jsp\" method=\"post\" onsubmit = \"return validate_form()\">");
	%>
	 <tr>
	<td><input type = "hidden" Name = "CID" value = '<%=CID%>'></td>
	</tr>
	<%
    out.println("<div align=\"center\">");
    out.println("<table bgcolor=\"skyblue\">");
    out.println("<tr>");
    out.println("<td>");
    out.println("Country <select name=\"Country\">");
    for(String Country : countryList)
    {
      out.println("<option value=\"" + Country + "\" >" + Country + "</option>");
     }
    out.println("</tr>");
    out.println("</table>");
    
    out.println("</select>");
    out.println("<br/>");
    out.println("<br/>");
    out.println("<input type=\"submit\" value=\"Select Country\">");
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
    out.println("</form>");

	
	
%>

</body>
</html>