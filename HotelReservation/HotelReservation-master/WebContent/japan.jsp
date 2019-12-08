<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import = "java.sql.*" %>
 <%@ page import="com.mysql.jdbc.Driver" %>
 <%@ page import = "HotelReservation.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>United States Information</title>

</head>
<body bgcolor='skyblue'>



<div align="center"><font size="9" color=" #0066ff">WelCome To JAPAN</font></div>
<hr>
<%
ConnectionDatabase db = new ConnectionDatabase();
Connection con = db.getConnection();
ResultSet r;

String q = "SELECT * from Hotell h where h.Country = 'JAPAN'";
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
%>
<font size='6' color='red'>
<%
out.println(" Hotels In Diffrent  States :-");

%>
</font>

<%
do{
out.write("<div align=\"left\">");
out.write("<table border=\"1\"  bgcolor=\"skyblue\" >");
out.write("<tr>");
out.write("<th>HotelID</th>");
out.write("<th>Street</th>");
out.write("<th>City</th>");
out.write("<th>State</th>");
out.write("<th>ZipCode</th>");
out.write("</tr>");


	
	out.println("<font size=\"5\" color =\"green\">");
	out.println("<pre class=\"tab\">	  ");
	out.println("<div align=\"left\">");
	out.println("<u>");
	out.println(r.getString(6));
	out.println("</u>");
	int HotelID = r.getInt(1);
	String Street = r.getString(2);
	String City = r.getString(3);
	String State = r.getString(6);
	String zip = r.getString(5);
	
	out.write("<tr>");
	out.write("<td>"+HotelID+"</td>");
	out.write("<td>"+Street+"</td>");
	out.write("<td>"+City+"</td>");
	out.write("<td>"+State+"</td>");
	out.write("<td>"+zip+"</td>");
	out.println("</div>");
	out.println("</pre>");
	out.println("</font>");
	out.println("</table>");
	out.println("<a href=\'https://www.google.com/maps/dir///@40.5876089,-74.309541,14z\'>");
	out.println("Direction");
	out.println("</a>");
	
}while(r.next());





db.closeConnection(con);
%>


<div align='center'>
<a href= "registerPage.jsp">Click Here To Register</a>
</div>





</body>
</html>