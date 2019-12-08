<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer ID Retriever</title>
</head>

<script type="text/javascript">
    function validate_form() {

      var CIDValue = document.forms["forgetForm"]["phone"].value;
      if (CIDValue.length != 10) {
        alert("A valid phone number has 10 digits no dashes!");
        return false;
      }
     
    return true;
    }
  </script>
  
<body bgcolor="#A3E4D7">

<div align="center"><font size = "9">Hulton Hotel Booking System</font></div>
<hr>
<br>

<h5 align ="center"><font size = "5">Please Enter Your Name and Phone Number</font></h5>

<form name = "forgetForm" method = "post" action = "retriever.jsp" onsubmit = "return validate_form()">
<div align="center">
<table>
<tr>
<td>Name:</td>
<td><input type="text" name= "name" placeholder= "name" required></td>
</tr>

<tr>
<td>Phone Number:</td>
<td><input type="number" name= "phone" placeholder = "0000000000" required></td>
</tr>
</table>
</div>
<br>
<div align = "center">
<tr><input type ="submit" value = "Submit"></tr>
</div>

</form>
</body>
</html>