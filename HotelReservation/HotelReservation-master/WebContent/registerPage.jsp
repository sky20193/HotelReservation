<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.Random.*" %>
<%@ page import = "java.math.*" %>
<%@ page import = "HotelReservation.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <title>Hulton Hotels Booking System</title>
    <link rel = "stylesheet" type="text/css" href = "css/registerPage.css">
  </head>
  
  <script type="text/javascript">

    function validate_form() {
      var nameValue = document.forms["registerForm"]["Name"].value;
      if (!nameValue || nameValue.length > 50) {
        alert("Please enter a valid name.");
        return false;
      }

      var streetAddressValue = document.forms["registerForm"]["Address"].value;
      if (!streetAddressValue || streetAddressValue.length > 100000) {
        alert("Please enter a valid street address.");
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
	  
      return true;

    }

  </script>
  
  <%
  
  ConnectionDatabase db = new ConnectionDatabase();
  Connection con = db.getConnection();
  
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
  
  %>
  
   <body>
    <div align="center"><font size="9" color="DarkLime">Hulton Hotels Booking System</font></div>
    <hr>
    <br>

    <h4 align="center"><font size="6" color="#000000">Enter the following information to create a new account:</font> </h4>
    <br>

    <form name="registerForm" action="register.jsp" method="post" onsubmit ="return validate_form()">
      <div align="center">
        <table bgcolor="#6666FF">

          <tr>
            <td><font size="4" color="Black">Name</td></font>
            <td><input name ="Name" type = "text" placeholder="Name" maxlength = "50" required></td>
          </tr>

          <tr>
            <td>Address</td>
            <td><input name="Address" type= "text" placeholder="Address" maxlength = "100000" required></td>
          </tr>

          <tr>
            <td>Email</td>
            <td><input name="Email" type="text" placeholder="Email" maxlength = "127" required></td>
          </tr>

          <tr>
            <td>Phone number</td>
            <td><input name ="Phone_number" type = "number" placeholder="0000000000" required></td>
          </tr>

        </table>
	  </div>
	  <div align="center">
	    <input type="submit" value="Register">
	  </div>
    </form>
  </body>
</html>