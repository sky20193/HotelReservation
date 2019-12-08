<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manager Sign Up</title>
</head>

 <script type="text/javascript">
	
    function validate_form() {
      var nameValue = document.forms["registerForm"]["Name"].value; 
      if (!nameValue || nameValue.length > 50) {
        alert("Please enter a valid name.");
        return false;
      }

     

      var emailValue = document.forms["registerForm"]["Email"].value;
      var emailRegularExpression = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      if (!emailValue || !emailRegularExpression.test(emailValue) || emailValue.length > 50) {
        alert("Please enter a valid email.");
	    return false;
      }
      
     
      var phoneValue = document.forms["registerForm"]["Phone_number"].value;
	  if (!phoneValue || phoneValue.length != 10) {
	    alert("Please enter a phone number. A phone number must contain only 10 digits with no dashes");
	    return false;
	  }
	  
	  var secure = document.forms["registerForm"]["secure"].value;
	 
      if (secure != 732715) { 
    	  alert("Please Enter Valid Manager code. If you do not have Manager Code then you are not eligible person to access. Sorry!");
    	return false;
      }
     
	  
	 
	  
      return true;
    }
    

  </script>



<body bgcolor="#A3E4D7">
<div align="center"><font size="5">Manager Sign Up Page</font></div>
<hr>
   
    <h4 align="center">Enter the following information to create a new account: </h4>
    <br>

    <form name="registerForm" action="managerRegister.jsp" method="post" onsubmit ="return validate_form();">
      <div align="center">
        <table>
		
          <tr>
            <td>Name</td>
            <td><input name ="Name" type = "text" placeholder="Name" maxlength = "50" required></td>
          </tr>

          <tr>
            <td>Email</td>
            <td><input name="Email" type="text" placeholder="Email" maxlength = "127" required></td>
          </tr>

          <tr>
            <td>Phone number</td>
            <td><input name ="Phone_number" type = "number" placeholder="0000000000" required></td>
          </tr>
         
           <tr>
            <td>Manager Security Code</td>
            <td><input name="secure" type= "text" placeholder="Security Code" required></td>
          </tr>
          
			
        </table>
        <br>
	  </div>
	  <div align="center">
	    <input type="submit" name ="submit" value="Register">
	  </div>
    </form>


</body>
</html>