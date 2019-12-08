<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="HotelReservation.*" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel = "stylesheet" type="text/css" href = "css/main1.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hulton Hotels Booking System</title>
</head>

<body>
 <div align="center"><font size="9" color="DarkLime">Hulton Hotels Booking System</font></div>
 <hr>
    <br>
   
    <%
    String CID = request.getParameter("CID");
    
    ConnectionDatabase db = new ConnectionDatabase();
    Connection con = db.getConnection();
    ResultSet r;
    
    String q = "Select * from Customer where CID = ? ";
    PreparedStatement s = con.prepareStatement(q);
    s.setString(1,CID);
    try
    {
    	r = s.executeQuery();
    }
    catch(SQLException e)
    {
    	db.closeConnection(con);
    	out.println("<div align=\"center\">");
    	out.println("<font size=\"5\" color=\"black\"><b>Invalid Customer Id"+"</font>");
    	out.println("<a class=\"active\" href=\"login.jsp\"><font size=\"5\" color=\"blue\">Login Page!"+"</font>"+"</a>");
		//response.sendRedirect("dbError.jsp");
		e.printStackTrace();
		return;
    }
    if(!r.next())
    {
    	db.closeConnection(con);
    	out.println("<div align=\"center\">");
    	out.println("<font size=\"5\" color=\"black\"><b>Invalid Customer Id"+"</font>");
    	out.println("<a class=\"active\" href=\"login.jsp\"><font size=\"5\" color=\"blue\">Login Page!"+"</font>"+"</a>");
		//response.sendRedirect("dbError.jsp");
		return;
    }
    if(r.next())
    {
    	db.closeConnection(con);
    	session.setAttribute("CID", new Integer(CID));
    }
    
    out.println("<div align=\"center\">");
    
    out.println("<br>");
    out.println("<table bgcolor=\"silver\"> <font size=\"7\" color=\"red\"><b> Welcome To Our Website" + "</font>");   
    out.println("<br>");
    out.println("<br>");
    out.println("<br>");
    out.println("<br>");
    
   
    out.println("<table bgcolor=\"skyblue\">");
    out.println("<tr>");
    out.println("<td>");
    out.println("<font size=\"5\" color=\"black\"><b>If you want to update any of your information"+"</font>");
    out.println("<a class=\"active\" href=\"updateProfile.jsp\"><font size=\"5\" color=\"blue\">click here!"+"</font>"+"</a>");
    %>
    
    <form method = "post" action= "selectCountryAndState.jsp">
     <tr>
	<td><input type = "hidden" Name = "CID" value = '<%=CID%>'></td>
	</tr>
	<% 
    
    out.println("</tr>");
    out.println("</table>");
    out.println("<br>");
    out.println("<br>");
    out.println("<table bgcolor=\"skyblue\">");
    out.println("<tr>");
    out.println("<td>");
    out.println("<font size=\"5\" color=\"red\"><b> Otherwise,  "+"</font>");       
    out.println(" <font size=\"5\" color=\"black\"><b> if you would like to make a Reservation."+"</font>");
    //out.println("<a class=\"active\" href=\"selectCountryAndState.jsp\"><font size=\"5\" color=\"blue\">click here!"+"</font>"+"</a>");
     %>
     <font size = 5><font color = "blue"></font></font><input type="submit" value = "Click here"></font></font>
    </form>
    <% 
    out.println("</tr>");
    out.println("</table>");
   
    
    out.println("<br>");
    out.println("<br>");
    out.println("<table bgcolor=\"skyblue\">");
    out.println("<tr>");
    out.println("<td>");
    out.println("<font size=\"5\" color=\"red\"><b> OR,  "+"</font>" );
    
    out.println("<font size=\"4\" color=\"black\"><b> If you have a Confirmation Number and would like to see your reservation detail."+"</font>");
    out.println("<a class=\"active\" href=\"reserveInfo.jsp\"><font size=\"5\" color=\"blue\">click here!"+"</font>"+"</a>");
    out.println("</tr>");
    out.println("</table>");
    out.println("<br>");
    out.println("<br>");
    out.println("<table bgcolor=\"skyblue\">");
    out.println("<tr>");
    out.println("<td>");
    out.println("<font size=\"5\" color=\"red\"><b> OR,  "+"</font>" );
    
    out.println("<font size=\"5\" color=\"black\"><b> If you want to write about your visit at out Hotel!."+"</font>");
    out.println("<a class=\"active\" href=\"reviews.jsp\"><font size=\"5\" color=\"blue\">click here!"+"</font>"+"</a>");
    out.println("</tr>");
    out.println("</table>");
    out.println("<br>");
    
    out.println("</table>");
    
    
    
    %>
    
    <br>
<form method = "post" action= "logout.jsp">
<div align = "center">
	<input type="submit" value = "Logout">
	</div>
</form>
  
</body>
</html>