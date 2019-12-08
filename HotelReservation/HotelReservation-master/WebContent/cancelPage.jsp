<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="HotelReservation.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Reservation</title>
</head>
<script type="text/javascript">
    function validate_form() {

      var CIDValue = document.forms["loginForm"]["CID"].value;
      if (CIDValue.length != 9) {
        alert("A valid Customer ID has 9 characters");
        return false;
      }
      else
    	  {
    	  return true;
    	  }
    }
  </script>
  
  <%
  	String CID = request.getParameter("CID");
  %>
<body>
<div align="center"><font size="9">Hulton Hotels Booking System</font></div>
    <br>
    <h5 align= "center"><font size="4">Please Enter your Confirmation Number</font></h5>
    
<form method="post" action="cancel.jsp">
	<div align="center">
	<table>
	<tr>
	<td>Confirmation Number: </td>
	<td><input name = "confirm" type = "number" required>
	</table>
	
	</div>
	<br>
	<div align = "center">
	<input type="submit" value = "Submit">
	</div>
	<br>
	  <br>
	  <div align="center">
	    <a class="active" href="logout.jsp"> Click here to log out!</a>
	  </div>
	   <tr>
	<td><input type = "hidden" Name = "CID" value = '<%=CID%>'></td>
	</tr>
</form>
</body>
</html>