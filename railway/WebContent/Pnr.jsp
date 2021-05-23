<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>PNR Status</title>

<script >
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
<body>

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
<form name="form1">
<h1> Reservation Current Status </h1>

<br  />
<p>
<label> Enter the 10 digit PNR No of the ticket to know The exact Status of the Reservation </label> <br  /><br />
<input name="pnr1"  type="text" size="3" maxlength="3" /> - <input name="pnr2" type="text" size="7" maxlength="7" /><br  />
<input type="button" value="Get Status" onclick="validate()" />
<input type="reset" value="Clear"  />
</p>
<jsp:include page ="./Pnr1.jsp" />
</form>
</div>


	<!-- Form Body -->

    </div> <!-- end of templatemo_content -->
    
    
     
    
  

</div> <!-- end of wrapper -->


</body>
</html>
