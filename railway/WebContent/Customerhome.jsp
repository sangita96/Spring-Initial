<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>User Page</title>

<%! 
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
public void jspInit(){
	try{
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/train","root","");
	}
	catch(Exception e ){
		e.printStackTrace();
	}
	}
%>

</head>
<center>
<body bgcolor="orange">  <img src="./images/train3.jpg" width="200" height="100" />


 <div id="templatemo_menu">
    
            <ul>
                <li><a href="Welcome.html" class="current">Home</a></li>
                <li><a href="Searchtrain.jsp">Train between Station</a></li>
                
             
               
            </ul>    	
    
    	</div> <!-- end of templatemo_menu -->

    	<h1 align="center"> <font color="maroon"> User HomePage</font> </h1>
<div style="float: right;">
		<br/>
		<br/>
		<h3> Quick Links </h3>
        <ul>
            <li><a href="./seatavail.jsp"> Make a Booking  </a></li>
           
            <li><a href="./Cancel.jsp"> Cancellation  </a></li>
        </ul>
		
</div>
</body>
</center>
</html>



