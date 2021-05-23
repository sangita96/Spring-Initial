<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>New Train Updation</title>

<%! 
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	
	public void jspInit(){
		try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/train","root","mysql");
		}
		catch(Exception e ){
			e.printStackTrace();
		}
		}
%>



function change(){
		var id= document.getElementById("select1").value;
		var cid=document.getElementById("select1").selectedIndex;
		var val = document.getElementById("select1").options[cid].text;
		
		var url = window.location.href;
		var urlindex = url.indexOf('?');
		var url1 = "";
		if(urlindex > -1){
			url1 = url.substring(0, urlindex);
			window.location.replace(url1+"?id="+id+"&value="+val);
		}
		else{
			window.location.replace(url+"?id="+id+"&value="+val);
		}
}


function valid() {
	var tno = document.form1.trainno.value;
	if (document.getElementById("select1").value == 0){
		alert("Select The Source Station");	
		document.getElementById("select1").focus();
		return false;		
	}
	else if (document.getElementById("select2").value == 0){
		alert("Select The Destination Station");	
		document.getElementById("select1").focus();
		document.form1.focus();
		return false;		
	}
	else if (document.form1.trainno.value==""){
		alert("Train No Cannot be left blank");	
		document.form1.trainno.focus();
		return false;
	}
	else if(tno.length < 4){
		alert("Train No Should be of 4 digts");	
		document.form1.trainno.focus();
		return false;		
	}
	else{
		document.form1.submit();
		return true;
	}      		
}


</head>
<body>


<div align="center">

<form name="form1" action="TrainInfo1.jsp" onsubmit="valid();">
		<h1> New Train Details Addition </h1>
<br/>		
		<table id="table1" align="center" style="font-weight: bold;" >
			  <tr>
      			<th colspan="2" style="font-size: 18px;"> Train Details </th>
			</tr>
			
			
			<tr>
				<td>	Source Station	</td>
				<td>

					<%
					String value = request.getParameter("value");
					String sql1="select * from route_main";
					pstmt = con.prepareStatement(sql1);
					rs = pstmt.executeQuery();
					%>
					
					<select id="select1" name="source" onchange="change();" onfocus="back()">
					<option value="0">--Please Select--</option>
					<% while(rs.next()){ %>
					<% if(rs.getString(3).equals(value)){%>
					<option value="<%= value%>" selected="selected" disabled="disabled"><%=value%></option>
					<%
					}
					else{
					%>
					<option value="<%=rs.getString(2)%>"><%=rs.getString(3)%></option>
					<%
					}
					}
					%>
					
					</select>
					

					<tr>

			<td>
				Destination Station
			</td>
			<td>
				<select id="select2" name="destid" onchange="extract();">
				<option value="0">--Please Select--</option>
				<%
				
				String s_sta=request.getParameter("value");
				String sql2 ="select * from route_main where s_station_name='"+s_sta+"'";
				pstmt = con.prepareStatement(sql2);
				rs = pstmt.executeQuery();
				while(rs.next()){
				%>
				<option value="<%=rs.getString(4)%>" ><%=rs.getString(5)%></option>
				<%
				}
				%>
				</select>
			</td>
			</tr>


<tr>
            	<td><label> Train N0 </label></td>
            	<td><input type="text" name="trainno" size="4" maxlength="4" onkeyup="num(this)" onkeydown="num(this)"/></td>
          	</tr>
			
		</table>
		<input type="button" Value="Continue" onclick="valid()">		
		</form>
       <h2> Login Details</h2><br/>
       <p style="font-size: 12pt">
		<a href='Logout.jsp'> Logout</a>
		</p>


		</body>
</html>