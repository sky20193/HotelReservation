 <html>

<head>
	<title>Login</title>
	<link rel = "stylesheet" type="text/css" href = "css/index.css">
</head>

<body >
<div align="center"><font size="9" color="Lime">Hulton Hotels Booking System</font></div>
<hr>
<br>

<%
//home page

//set loginstatus attribute on first time access of this page
// 0 = not logged in
// 1 = logged in as customer
// 2 = logged in as customer representative
// 3 = logged in as manager
if(session.isNew() || session.getAttribute("CID") == null)
{
	session.setAttribute("CID", new Integer(0));
}


//if not logged in, only show login and register links
if(((Integer)session.getAttribute("CID")).intValue() == 0)
{
	
	%>
	
	<form method = "post" action = "login.jsp">
	<div align = "center">
	<table>
	<tr>
	<td><input type="submit" value="Customer Login and Register"></td> 
	</tr>
	</table>
	</div>
	</form>
	<br>

	
	<form method = "post" action = "managerPage.jsp">
	<div align = "center">
	<table>
	<tr>
	<td><input type="submit" value="Manager Login and Register"></td> 
	</tr>
	</table>
	</div>
	</form>
	<br>
	<div class="bottom-right alert">
  	Copy Rights! © 2017
  	<br>
  	
  	<pre class="tab">	   <b>Bhavin Patel</b></pre>
  	<pre class="tab">	   <b>Akash Patel</b></pre>
  	<pre class="tab">	   <b>Matthew Kalitasr </b></pre>
  	<pre class="tab">	   <b>Akshar Patel</b></pre> 
  	 	
	</div>


	
	<% 
}
%>
<style>
 {box-sizing:border-box}
body {font-family: Verdana,sans-serif;}
.mySlides {display:none}

/* Slideshow container */
.slideshow-container {
  max-width: 500px;
  position: relative;
  margin: auto;
  top:200px;
  
}


/*  text */
.text {
  color: red;
  font-size: 20px;
  padding: 8px 12px;
  position: absolute;
  top: 8px;
  width: 50%;
  text-align: center;
  text-decoration:underline;
  
}
.textdubai {
  color: red;
  font-size: 20px;
  padding: 8px 12px;
  position: absolute;
  top: 8px;
  width: 50%;  
  margin-left:300px;
  text-decoration:underline;
  
}



/* The dots/bullets/indicators */
.dot {
	top:200px;
  height: 15px;
  width: 15px;
  margin: 200px 5px;
  background-color: red;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.8s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 0.4s;
  animation-name: fade;
  animation-duration: 0.4s;
}

@-webkit-keyframes fade {
  from {opacity: .1} 
  to {opacity: 0.9}
}

@keyframes fade {
  from {opacity: .1} 
  to {opacity: 0.9}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}
</style>
</head>
<body>
<!--  
<h2>Automatic Slideshow</h2>
<p>Change image every 2 seconds:</p>
-->

<div class="slideshow-container" align="center">

<div class="mySlides fade"> 
  
  
  <div class="text"><b>United States</div>
  <a href="usa.jsp">
  <img border="0" src="usa3.jpg" height="300" width="600">
  </a>
</div>


<div class="mySlides fade">  
  <div class="text"><b>India</div>
  <a href="india.jsp">
  <img border="0" src="taj.jpg" height="300" width="600">
  </a>
</div>


<div class="mySlides fade">    
  <div class="text"><b>Japan</div>
  <a href="japan.jsp">
  <img border="0" src="japan.jpg" height="300" width="600">
  </a>
</div>

<div class="mySlides fade">  
  <div class="text"><b>Canada </div>
  <a href="canada.jsp">
  <img border="0" src="cn.jpg" height="300" width="600">
  </a>
</div>


<div class="mySlides fade">    
  <div class="textdubai"><b>Dubai</b> </div>
  <img border="0" src="dubai.jpg" height="300" width="600">
 
</div>

</div>
<br>
</div>
<br>


<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>

<script>
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
   
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 3000); // Change image every 2 seconds
}
</script>

</body>
</html>