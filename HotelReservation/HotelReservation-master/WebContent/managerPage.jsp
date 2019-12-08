<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manager Login</title>
</head>

 <script type="text/javascript">
    function validate_form() {

      var CIDValue = document.forms["managerForm"]["MID"].value;
      if (CIDValue.length != 9) {
        alert("A valid MID ID has 9 characters");
        return false;
      }
 
     return true;
    }
  </script>

<body bgcolor="#A3E4D7">

<div align="center"><font size="5">Manager Login Page</font></div>
<hr>
    <br>
    <h5 align= "center"><font size="3"">Enter Your ID to continue</font></h5>
<form name = "managerForm" method="post" action="managerLogin.jsp" onsubmit = "return validate_form()">
	<div align="center">
	<table>
	<tr>
	<br>
	<td>Manager ID:</td>
	<td><input name = "MID" type = "number">
	</table>
	</div>
	<br>
	<div align = "center">
	<input type="submit" value = "Login">
	</div>

	  <br>
	  <div align="center">
	    <a class="active" href="managerSignUp.jsp">Click here to register!</a>
	  </div>
</form>


</body>
</html>