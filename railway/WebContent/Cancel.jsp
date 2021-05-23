<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> Cancellation </title>
<link href="Cancel.css" rel="stylesheet">
<script>
function validate(){
	var p1 = document.form1.pnr1.value;
	var p2 = document.form1.pnr2.value;
	if(p1=="" || p2==""){
		alert("Please Enter Proper PNR No");
		document.form1.pnr1.select();
	}else{
	document.form1.submit();
	}
}
</script>

</head>
<body >

<div id="templatemo_wrapper">

	<div id="templatemo_header">
    
    	<div id="site_title">
            <h1><a href="home.jsp">
               
             
            </a></h1>
        </div>
 
        
        
        <div class="cleaner"></div>
	</div> <!-- end of header -->
    
    <div id="templatemo_content">


	<!-- Form Body -->

<div align="center">


<form name="form1" action="./Cancel1.jsp">
<h1><font color="orange"> Ticket Cancellation </font></h1>

<br  />
	<p>
	<label><font color="lime" size="4"> Enter the 10 digit PNR No </font></label> <br  /><br />
	<input name="pnr1"  type="text" size="3" maxlength="3" /> - <input name="pnr2" type="text" size="7" maxlength="7" /><br  />
	<input type="button" value="Check" onclick="validate()" />
	<input type="reset" value="Clear"  />
	</p>
</form>
		
</div>

	<!-- Form Body -->

    </div> <!-- end of templatemo_content -->
    
    


</body>
</html>
