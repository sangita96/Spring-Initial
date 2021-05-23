<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Railway Reservation System</title>
<link href="Customerlogin.css" rel="stylesheet">
</head>
<body>
<div id="site_title">
            <h1><a href="home.jsp">
               
             
            </a></h1>
        </div>
  
    <div id="templatemo_sidebar">
     <h2>NEW USER</h2>
    	 <h2> <a href="./UserReg.jsp"> User Registration</a>
    	
                
        </div>
    	     
        <div align="center">
<form action="cusvalid.jsp">
<h1> <em> <font color="blue">Online Railway Reservation Customer Login</font></em> </h1>

<table>
<tr>
	<td> <label> <font color="maroon" size="5">User Id</font> </label> </td> 
	<td> <input type="text" name="userid" /> </td>
</tr>
<tr>
	<td> <label> <font color="maroon" size="5">Password </font></label> </td> 
	<td> <input type="password" name="password" /> </td>
</tr>
<tr>
	<td align="center"> <input type="submit" value="SignIn" id="signin"> </td> 
	<td align="center"> <input type="button" value="Cancel" id="cancel" onclick="parent.location='./Welcome.html'" /> </td>
</tr>
</table>
</form>
</div>

	<!-- Form Body -->

	</body>
</html>