<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="HotelReservation.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>write Reviews</title>
<link rel = "stylesheet" type="text/css" href = "css/review.css">
</head>
<script type="text/javascript">
    function validate_form() {

      var CIDValue = document.forms["reviewForm"]["confirm"].value;
      if (CIDValue.length != 9 && CIDValue.length != 10) {
        alert("A valid Confirmtaion Number has either 9 or 10 characters");
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
<div align="center"><font size="9" color="darklime">Hulton Hotels Booking System</font></div>
<hr>
    <br>
    <h5 align= "center"><font size="4">Please Enter your Confirmation Number</font></h5>
    
<form name="reviewForm" method="post" action="reviewType.jsp" onsubmit = "return validate_form()">
	<div align="center">
	<table bgcolor="skyblue">
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
	   <tr>
	<td><input type = "hidden" Name = "CID" value = '<%=CID%>'></td>
	</tr>
</form>

<form method = "post" action= "logout.jsp">
<div align = "center">
	<input type="submit" value = "Logout">
	</div>
</form>
</body>
</html>