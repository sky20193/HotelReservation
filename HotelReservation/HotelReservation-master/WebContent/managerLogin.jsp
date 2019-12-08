<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="HotelReservation.*" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manager Login Page</title>
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
      
      
      if(new Date(Date) < new Date(Date1))
    	{
   	  alert("Begin date cannot be less than Ending Date");
    	  return false;
    	  }

 
      return true;
    }
  </script>

<body bgcolor="#A3E4D7">

 <div align="center"><font size="9">Hulton Hotels Corporation Page</font></div>
 <hr>
    
<% 
 String MID = request.getParameter("MID");
    
    ConnectionDatabase db = new ConnectionDatabase();
    Connection con = db.getConnection();
    ResultSet r;
    
    String q = "Select * from Manager where MID = ? ";
    PreparedStatement s = con.prepareStatement(q);
    s.setString(1,MID);
    try
    {
    	r = s.executeQuery();
    }
    catch(SQLException e)
    {
    	db.closeConnection(con);
    	out.println("<div align=\"center\">");
    	out.println("<br>");
    	out.println("<font size=\"5\" color=\"black\"><b>Invalid Manager Id"+"</font>");
    	out.println("<a class=\"active\" href=\"index.jsp\"><font size=\"5\" color=\"blue\">Main page!"+"</font>"+"</a>");
		//response.sendRedirect("dbError.jsp");
		e.printStackTrace();
		return;
    }
    if(!r.next())
    {
    	db.closeConnection(con);
    	out.println("<div align=\"center\">");
    	out.println("<font size=\"5\" color=\"black\"><b>Invalid Manager Id"+"</font>");
    	out.println("<a class=\"active\" href=\"index.jsp\"><font size=\"5\" color=\"blue\">Main page!"+"</font>"+"</a>");
		//response.sendRedirect("dbError.jsp");
		return;
    }
    if(r.next())
    {
    	db.closeConnection(con);
    	session.setAttribute("MID", new Integer(MID));
    }
    db.closeConnection(con);
    %>
	<br>
    <h4 align="center">Please Enter Begin and End Date </h4>
    <br>
	<form name="DateForm" method="post" action="ratingType.jsp" onsubmit ="return validate_form()">
	<tr>
	<td><input type = "hidden" Name = "MID" value = '<%=MID%>'></td>
	</tr>
	<div align="center">
	<table>
	<tr>
	<td>Begin Date: </td>
	<td><input name ="CheckIn" type = "text" placeholder="yyyy-mm-dd"  maxlength = "10" required></td>
	</table>
	</div>
	
	<div align="center">
	<table>
	<tr>
	<td>End Date: </td>
	<td><input name ="CheckOut" type = "text" placeholder="yyyy-mm-dd"  maxlength = "10" required></td>
	</table>
	<br>
	<div align = "center">
	<input type="submit" value = "Submit">
	</div>
</form>

<br>



</body>
</html>