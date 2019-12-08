<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.Random.*" %>
<%@ page import = "java.math.*" %>
<%@ page import = "HotelReservation.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>


<%

String Name = request.getParameter("Name");
String Address = request.getParameter("Address");
String Email = request.getParameter("Email");
String Phone_number = request.getParameter("Phone_number");

ConnectionDatabase db = new ConnectionDatabase();
Connection con = db.getConnection();
int status;

int lower = 100000000;;
int upper =  999999999;

int ID = (int)Math.floor(lower + Math.random() * upper);
String CID = String.valueOf(ID);



String email = "select * from Customer";

String[] em ;
List<String> w = new ArrayList<String>();

PreparedStatement ak = con.prepareStatement(email);
ResultSet r;

r = ak.executeQuery();

while(r.next())
{
	 w.add(r.getString("Email"));
}
/*
for(String i : w)
{
	if(i.equals(Email))
	{
		out.println("<div align=\"center\">");
		out.println("Email already Exists");
		break;
	}
}
*/


String q = "insert into Customer(CID,Name,Address,Phone_number,Email) values (?,?,?,?,?);";
PreparedStatement s = con.prepareStatement(q);
s.setString(1, CID);
s.setString(2, Name);
s.setString(3, Address);
s.setString(4, Phone_number);
s.setString(5, Email);

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
	out.println("<font size=\"6\" color=\"darklime\">Thank you for taking the time to register " + Name + "!</font>");
	out.println("<br>");
	out.println("<hr>");
	out.println("<br>");
	out.println("<br>");
	out.println("<font size=\"4\">Your Customer Identification Number (CID) is</font>");
	out.println("<br>");
	out.println("<br>");
	out.println("<b> <font size=\"5\">" + ID + "</font></b>");
	out.println("<br>");
	out.println("<br>");
	out.println(" <font size=\"4\" color=\"Black\">Note: Please keep this number in a safe place.</font>");
	out.println("<br>");
	out.println("<br>");
	out.println("<form action=\"login.jsp\">");
	out.println("  <div align=\"center\">");
	out.println("    <input type=\"submit\" value=\"You may now login here\" />");
	out.println("  </div>");
	out.println("</form>");
}

db.closeConnection(con);










%>
<html>
<body bgcolor="skyblue">
<title>WelcomePage</title>
<link rel = "stylesheet" type="text/css" href = "css/registerWelcome.css">
<div id = "footer">
 <img src = "welcome.gif" width = "800" height = "200"/>
 </div>
</body>

</html>
