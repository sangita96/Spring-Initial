<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Railway Reservation System</title>

</head>
<center>
<body bgcolor="silver">
<img src="./images/admin1.png" width="200" height="100" />
<div id="site_title">
            <h1><a href="home.jsp">
                
            </a></h1>
        </div>
  
        
        <div align="center">
<form action="valid.jsp">
<h1> <em>
Online Railway Reservation Admin Login</em> </h1>

<table>
<tr>
	<td> <label> User Id </label> </td> 
	<td> <input type="text" name="userid" /> </td>
</tr>
<tr>
	<td> <label>Password </label> </td> 
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
	</center>
</html>