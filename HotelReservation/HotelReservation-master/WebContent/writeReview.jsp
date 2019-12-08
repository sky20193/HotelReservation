<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="HotelReservation.*" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reviews</title>
</head>
<body bgcolor="#85C1E9">
<div align="center"><font size="9" color="darklime">Hulton Hotels Review Page</font></div>
<hr>
    <br>
    <div align="center"><font size="4">Please Write about Your Visit!</font></div>
    <br>
    <br>
    <br>
    
     <script type="text/javascript">
     
     function validate_form()
     {
     	var star = document.forms["reviewForm"]["star"].value;
	 	if (star > 5)
     	{ 
   	  		alert("Please Enter Valid Rate!");
   			return false;
    	 }
     return true;
   }
   

 </script>
<% 
	String confirm = request.getParameter("confirm");
	String type = request.getParameter("type");
	
	if(type.equals("1"))
	{
		%>
		<form name = "reviewForm" method = "post" action = "successReview.jsp" onsubmit ="return validate_form();">
		<div align = "center">
		<table>
		<tr>
     <td><b>Rate Out of 5:</b></td>
     <td><input name ="star" type = "number" required></td>
     </tr>
     </table>

		<br>
		
		<td><b>Breakfast review:</b></td>
		<table>
		<br>
		<textarea rows="4" cols="50" name = "comment">
		</textarea>
		</table>
		</div>
		<br>
	<div align = "center">
	<input type="submit" value = "Submit">
	</div>
	<tr>
	<td><input type = "hidden" Name = "type" value = '<%=type%>'></td>
	</tr>
	<tr>
	<td><input type = "hidden" Name = "confirm" value = '<%=confirm%>'></td>
	</tr>
		</form>
		
		
		<% 
	}
	if(type.equals("2"))
	{
		%>
		<form name = "reviewForm" method = "post" action = "successReview.jsp" onsubmit ="return validate_form();">
		<div align = "center">
		<table>
		<tr>
     <td><b>Rate Out of 5:</b></td>
     <td><input name ="star" type = "number" required></td>
     </tr>
     </table>

		<br>
		<td><b>Room review:</b></td>
		<table>
		<br>
		<textarea rows="4" cols="50" name = "comment">
		</textarea>
		</table>
		</div>
		<br>
	<div align = "center">
	<input type="submit" value = "Submit">
	</div>
	<tr>
	<td><input type = "hidden" Name = "type" value = '<%=type%>'></td>
	</tr>
	<tr>
	<td><input type = "hidden" Name = "confirm" value = '<%=confirm%>'></td>
	</tr>
		</form>
		
		<% 
	}
	if(type.equals("3"))
	{
		%>
		<form name = "reviewForm" method = "post" action = "successReview.jsp" onsubmit ="return validate_form();">
		<div align = "center">
		<table>
		<tr>
     <td><b>Rate Out of 5:</b></td>
     <td><input name ="star" type = "number" required></td>
     </tr>
     </table>

		<br>
		<td><b>Hotel review:</b></td>
		<table>
		<br>
		<textarea rows="4" cols="50" name = "comment">
		</textarea>
		</table>
		</div>
		<br>
	<div align = "center">
	<input type="submit" value = "Submit">
	</div>
	<tr>
	<td><input type = "hidden" Name = "type" value = '<%=type%>'></td>
	</tr>
	<tr>
	<td><input type = "hidden" Name = "confirm" value = '<%=confirm%>'></td>
	</tr>
		</form>
		
		<% 
	}
%>
</body>
</html>