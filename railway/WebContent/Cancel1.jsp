<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Cancellation</title>

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
<script >
function validate(no){
	
	
	var chk=0;
	if(no==1){
		if (document.form1.seat.checked == true){
			
			chk = chk +1;
		}			
	}
	else{
		for(var i=0; i< parseInt(no); i++){

			if (document.form1.seat[i].checked == true){
			
				chk = chk +1;
			}	
		}
	}

	if(chk == 0){
			alert("Please Select Passengers Whose Ticket is to be cancelled");
			return;
	}
	else{
			document.form1.submit();
	}
}
</script>

<script >
//script to disable goback button of the browser

//function forwards to the next page from history of cache
function noBack(){
	window.history.forward();
}

//Calls noBack() function
function Back(){
	if (event.persisted){ 
		noBack();
	}
}

window.onload=noBack();
window.onpageshow = Back();
</script>

</head>
<body bgcolor="silver">

<div id="templatemo_wrapper">

	<div id="templatemo_header">
    
    	<div id="site_title">
            <h1><a href="home.jsp">
                <img src="./images/train_logo.PNG" width="494" height="110" />
             
            </a></h1>
        </div>
 
       
        
        <div class="cleaner"></div>
	</div> <!-- end of header -->
    
    <div id="templatemo_content">


	<!-- Form Body -->

<div align="center">



<%
int pnr=0;
String pnr1="";
String pnr2="";

		pnr1=request.getParameter("pnr1");
		pnr2=request.getParameter("pnr2");
		String pnrno = pnr1.concat(pnr2);
		pnr = Integer.parseInt(pnrno);
		pstmt=con.prepareStatement("delete from passenger_info where PNR=?");
		pstmt.setString(1, pnrno);
		int i=pstmt.executeUpdate();
		if(i>0)
		{
			out.println("Sucessfully canceled");
		}
		else
		{
			out.println("not canceled");
			
		}
		
		
	%>	
		
		
		
		
		
		
		


</body>
</html>
