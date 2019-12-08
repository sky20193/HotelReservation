<html>

<head>
	<title>Login - Hulton Hotels Booking System</title>
	<link rel = "stylesheet" type="text/css" href = "css/main.css">
</head>

 <script type="text/javascript">
    function validate_form() {

      var CIDValue = document.forms["loginForm"]["CID"].value;
      if (CIDValue.length != 9) {
        alert("A valid Customer ID has 9 characters");
        return false;
      }
     
    return true;
    }
  </script>
<body >

<div align="center"><font size="9" color="DarkLime">Hulton Hotels Booking System</font></div>
<hr>
    <br>
    <h5 align= "center"><font size="5" color="rgb(0,0,255)">Please login with your Customer ID to Continue</font></h5>
<form name = "loginForm" method="post" action="loginhandler.jsp" onsubmit = "return validate_form()">
	<div align="center">
	<table>
	<tr>
	<br>
	<td><font color="rgb(0,0,0)">Customer ID:</font></td>
	<td><input name = "CID" type = "number">
	</table>
	</div>
	<br>
	<div align = "center">
	<input type="submit" value = "Login">
	</div>
	<br>
	<br>
	
	  <div align="center">
	  <table bgcolor="#6666FF">
	  <tr>
	    <td><a class="active" href="forget.jsp">Forgot Your Customer ID!</a></td>
	    </tr>
	    </table>
	  
	  <br>
	  <table bgcolor="#6666FF">
	  <tr>
	    <td><a class="active" href="registerPage.jsp">Don't have a Customer ID? Click here to register!</a></td>
	    </tr>
	    </table>
	  </div>
	  
</form>


</body>
</html>