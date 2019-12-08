<html>

<head>
	<title>Customer Info Modification - Hulton Hotel Reservation</title>
</head>

<script type="text/javascript">
    function validate_form() {

      var CIDValue = document.forms["updateForm"]["CID"].value;
      if (CIDValue.length != 9) {
        alert("A valid Customer ID has 9 characters");
        return false;
      }
     
    return true;
    }
  </script>

<body bgcolor="#F5B041">
<div align="center"><font size="9" color="DarkLime">Hulton Hotels Booking System</font></div>
<hr>
    <br>
    <h5 align= "center"><font size="4">For Security, Please Re-Enter your Customer ID Number to update Information</font></h5>
    
<form name = "updateForm" method="post" action="modifyCustomer.jsp" onsubmit = "return validate_form()">
	<div align="center">
	<table >
	<tr>
	<td>Customer ID: </td>
	<td><input name = "CID" type = "number">
	</table>
	</div>
	<br>
	<div align = "center">
	<input type="submit" value = "Find Account">
	</div>
	<br>
	  <br>
	  <div align="center">
	    <a class="active" href="login.jsp"> Return to login page!</a>
	  </div>
</form>
</body>
</html>