<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Booking</title>


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

<script>
function destination(){				//Disables stations in destination select Field based on selection from source selesct
	var ele1 = document.getElementById("src1");
	var ele2 = document.getElementById("des1");
	var len = parseInt(ele2.length);
	var sindex = ele1.selectedIndex;
	
	ele2.value=0;
	
	for(var j=0; j< len ; j++){
		ele2.options[j].disabled = false;
	}
	
	for(var i=1; i< parseInt(sindex); i++){
		ele2.options[i].disabled = true;
	}

	if(ele1.value==0){
		document.getElementById("des1").disabled=true;
	}else{
		document.getElementById("des1").disabled=false;
	}
}

function blurdes(){			//to disable destination select if source is not selected
	var ele1 = document.getElementById("src1");
	var ele2 = document.getElementById("des1");
	if(ele1.value==0){
		document.getElementById("des1").disabled=true;
	}else{
		document.getElementById("des1").disabled=false;
	}
}

function empty(ele){		
	if(ele.value==""){
		ele.value=0;
	}
}

function getvalue(){	//on change event of select1 which is for selection for class type the value is stored into a hidden element named clas
	var val = document.getElementById("select1").value;
	document.form1.clas.value=val;
}

function max(){
	
	if (parseInt(document.form1.adult.value)+ parseInt(document.form1.child.value) > 6){
		alert("Booking Is Possible For Only Six Seats");
		document.form1.adult.select();
		document.form1.adult.focus();
		return false;
	}
	else{
		return true;
	}			
}


function valid(){		//Validating before submiting
	var ele1 = document.getElementById("src1");
	var ele2 = document.getElementById("des1");
	var ele3 = document.getElementById("select1");

	if(ele1.value == 0){
		alert("Please Select The Boarding Station");
		document.getElementById("src1").focus;
	}else if(ele2.value == 0){
		alert("Please Select The Destination Station");
		document.getElementById("des1").focus;
	}else if(ele3.value == 0){
		alert("Please Select The Class");
		document.getElementById("select1").focus;
	}else if(max()){
				if (parseInt(document.form1.adult.value)+ parseInt(document.form1.child.value) == 0){
				alert("Booking Should Be Done For Atleast One Person");
				document.form1.adult.select();
				document.form1.adult.focus();
				return;
			}else{
				document.form1.submit();
			}
		}
}
</script>


</head>
<body onload="blurdes()" bgcolor="teal">


    	<div id="site_title">
            <h1><a href="home.jsp">
                <img src="./images/train_logo.PNG" width="494" height="110" />
             
            </a></h1>
        </div>
 
        

	<!-- Form Body -->

<div align="center">


	<form name="form1" action="./Book1.jsp">
	
	<div  align="center">
	<h2>Selected Train Details </h2>
	<div align="left">
	<table border="1" bordercolor=#333333>
	<tr bgcolor=#333333>
		<th colspan="6" align="left" style="color:white;"> Selected Train :</th>
	</tr>
		<tr bgcolor=#333333 style="color: white; font-weight: bold;">
			<th> Train No </th>
	        <th> Train Name </th>
			<th> Type </th>
		    <td> Date <br> (Y-MM-DD)</td>
	    	<th> Origin </th>
			<th> Destination </th>
   		</tr>

<%
int tno=0;
String dt = "";
String srcid="";
try{
	
		tno = Integer.parseInt(request.getParameter("tno"));
		dt = request.getParameter("date1");

		String sql4="select t.train_no, t.train_name, t.type, t.s_station_id, r.s_station_name, r.d_station_name, s.dep_date from train_info t, route_main r, s1 s where t.train_no=? and t.s_station_id=r.s_station_id and s.dep_date=? and s.train_no=t.train_no;";

		pstmt = con.prepareStatement(sql4);
		pstmt.setInt(1,tno);
		pstmt.setString(2,dt);
	
		rs=pstmt.executeQuery();
		
		while(rs.next()){
			srcid =  rs.getString("s_station_id");
%>
			<tr>
			<td>  <input type="text" name="tno" size="3" value="<%= rs.getString("train_no") %>" readonly="readonly" tabindex="-1" /> </td>
			<td>  <input type="text" size="18" value="<%= rs.getString("train_name") %>" readonly="readonly" tabindex="-1" /> </td>
			<td>  <input type="text" size="10" value="<%= rs.getString("type") %>" readonly="readonly" tabindex="-1" /> </td>
			<td>  <input type="text" name="date1" size="9" value="<%= rs.getDate("dep_date") %>" readonly="readonly" tabindex="-1" /> </td>
			<td>  <input type="text" size="13" value="<%= rs.getString("s_station_name") %>" readonly="readonly" tabindex="-1" /> </td>
			<td>  <input type="text" size="13" value="<%= rs.getString("d_station_name") %>" readonly="readonly" tabindex="-1" />	</td>
			</tr>

<%	
		}
}catch(Exception e){
}
%>	
	</table>
	</div>
</div>
<br>
<%
try{
	String id = srcid;		//TO FETCH THE SOURCE STATION ID 
	int len = id.length();
	String id1 = id.substring(0,len-2);			//To get the starting digits of station id by eliminating the last to digits
	id1 = id1 + "%%";		//Adding %% to find the stations which come under the range of station id ex: 1%% i.e 100 to 199
	String sql1="select * from route where station_id like '"+id1+"' ";		//SQL Query that gets station id's which come under one route
	
	pstmt = con.prepareStatement(sql1);
	
	rs = pstmt.executeQuery();
	%>
	
	<table border='1' bordercolor=#333333>
	<tr>
	<td bgcolor=#333333 style="color: white; font-weight: bold;"> Boarding Station </td>
	<td> <select id="src1" name="src" onchange="destination()">
	<option value="0">--Please Select--</option>
	<%
	while(rs.next()){
		out.println("<option value="+rs.getInt("station_id")+">"+rs.getString("station_name")+"</option>");
		
	}
	%>
	</select> </td>
	</tr>	
	<tr>
	<td bgcolor=#333333 style="color: white; font-weight: bold;"> Destination Station </td>
	<td> <select id="des1" name='des' onfocus="blurdes();">
	<option value="0">--Please Select--</option>
	<%
	rs = pstmt.executeQuery();
	while(rs.next()){
		out.println("<option value="+rs.getInt("station_id")+">"+rs.getString("station_name")+"</option>");
		
	}
	%>
	</select></td>
	</tr>
	</table>
	<%
}
catch(Exception e){
	e.printStackTrace();
}
%>

<!-- JavaScript to remove last station from boarding station and starting station from destination station -->
<script type="text/javascript">
	var ele = document.getElementById("src1");	//Fetching the select element of boarding station to ele variable
	var len = parseInt(ele.length);		//Counting the length of elements in it
	ele.remove(len-1);		//Removing the last element from options

	var ele1 = document.getElementById("des1");		//fetching the destination stations to ele1
	ele1.remove(1);		//removing the starting station from the list
</script>	

	<div align="center">
	<br>
	<hr>
	<table border="1" bordercolor=#333333>
		<tr bgcolor=#333333 style="color: white; font-weight: bold;">
			<th colspan="2"> <label>Booking Details</label> </th>
		</tr>
		<tr>
				<td bgcolor=#333333 style="color: white; font-weight: bold;"> 
				<label> Class Type</label> 
				</td>
			<td>
			<select id="select1" onchange="getvalue()">
		         		<option value="0">--Please Select--</option>
		                <option value="a1"> AC First Class </option>
		                <option value="a2"> AC 2 Tier </option>
		                <option value="a3"> AC 3 Tier </option>
						<option value="sl"> Sleeper Class	</option>
		    </select>
			<input name="clas" type="hidden" value="sl"> <!-- JavaScript Over writes the value at the onchange event of select -->
			</td>
		</tr>
		<tr>
			<td bgcolor=#333333 style="color: white; font-weight: bold;"> 
			<label> No Of Adults</label></td>
			<td> <input type="text" name="adult" value="0" size="4" maxlength="2" onblur="empty(this)" onkeyup="num(this)" onkeydown="num(this)" /> <span style="color: red;"></span> </td>
		</tr>
		<tr>
			<td bgcolor=#333333 style="color: white; font-weight: bold;"> 
			<label> No Of Children</label></td>
			<td> <input type="text" name="child" value="0" size="4" maxlength="2" onblur="empty(this)" onchange="max()" onkeyup="num(this)" onkeydown="num(this)" /> </td>
		</tr>
	</table>
 <span style="color: red;">*Max 6 Seats Per Ticket</span>	 
	<p>
		<input type="button" value="Continue" onclick="valid()" />
	</p>
	</div>

	
	</form>
		
</div>
	<!-- Form Body -->

   
    
   
					
      

</body>
</html>
