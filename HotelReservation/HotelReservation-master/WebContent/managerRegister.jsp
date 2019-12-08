<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.sql.*" %>
<%@ page import = "java.util.Random.*" %>
<%@ page import = "java.math.*" %>
<%@ page import = "HotelReservation.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manager final register</title>
</head>
<body bgcolor="#A3E4D7">

<div align="center"><font size="5">Manager Sign Up Page</font></div>
<hr>

<%

String Name = request.getParameter("Name");
String secure = request.getParameter("secure");
String Email = request.getParameter("Email");
String Phone_number = request.getParameter("Phone_number");

ConnectionDatabase db = new ConnectionDatabase();
Connection con = db.getConnection();
int status;

int lower = 100000000;;
int upper =  999999999;

int ID = (int)Math.floor(lower + Math.random() * upper);
String MID = String.valueOf(ID);

String q = "insert into Manager(MID,Name,Email,Phone,Secure) values (?,?,?,?,?);";
PreparedStatement s = con.prepareStatement(q);
s.setString(1, MID);
s.setString(2, Name);
s.setString(3, Email);
s.setString(4, Phone_number);
s.setString(5, secure);

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
	out.println("<br>");
	out.println("<font size=\"4\">Your ID number is</font>");
	out.println("<br>");
	out.println("<br>");
	out.println("<b> <font size=\"5\">" + ID + "</font></b>");
	out.println("<br>");
	out.println("<br>");
	out.println(" <font size=\"3\">Please keep this number in a safe place.</font>");
	out.println("<br>");
	out.println("<br>");
	out.println("<form action=\"managerPage.jsp\">");
	out.println("  <div align=\"center\">");
	out.println("    <input type=\"submit\" value=\"You may now login here\" />");
	out.println("  </div>");
	out.println("</form>");
}

db.closeConnection(con);




%>



</body>
</html>