<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array"%>
<%@page import="com.sun.org.apache.xpath.internal.functions.Function"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>New Train Information</title>

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


function empty(ele){		
	if(ele.value==""){
		ele.value=0;
	}
}

function check(ele){
	if(ele.value < 5){
		alert("A train must have minimum of 5 Sleeper Class Coaches ");
		ele.focus();
		ele.select();
	}
}

// validation of empty, min and max limits for the inputs specified 
function validate(){

	if(document.form1.tname.value == "" ){
		alert("Train Name Cannot be left blank");
		document.form1.tname.focus();
		document.form1.tname.select();
		return;
	}

	var len = 0;
	for(var i=0; i < document.form1.days.length; i++){
		if(document.form1.days[i].checked)
			len = len +1;
		}
		if(len == 0){
			alert("Specify the days of departure for the train");
			document.form1.days[0].focus();
			return;
		}
	
	 if(document.form1.sl.value < 5 || document.form1.sl.value == ""){
		alert("A train must have minimum of 5 Sleeper Class Coaches ");
		document.form1.sl.focus();
		document.form1.sl.select();
	}else if(document.form1.sl.value > 7){
		alert("There can only be 7 Sleeper Class Coaches for a train");
		document.form1.sl.focus();
		document.form1.sl.select();
	}else if(document.form1.a1.value > 2){
		alert("There can only be 2 AC First Class Coaches for a train");
		document.form1.a1.focus();
		document.form1.a1.select();
	}else if(document.form1.a2.value > 2){
		alert("There can only be 2 AC 2 Tier Coaches for a train");
		document.form1.a2.focus();
		document.form1.a2.select();		
	}else if(document.form1.a3.value > 3){
		alert("There can only be 3 AC 3 Tier Coaches for a train");
		document.form1.a3.focus();
		document.form1.a3.select();
	}else{
		document.form1.submit();
	}
}



</head>
<body>

<form name="form1" action="./TrainSchedule.jsp">
<h1 align="center"> 
New Train Details Addition  </h1>

<div id="divHead" >
            <%
            String tno=request.getParameter("trainno");           
            
            String sql5 ="select * from train_info where train_no=?";
            
            pstmt = con.prepareStatement(sql5);
            
            pstmt.setString(1,tno);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()){
    			out.println("<h3> <span style='color: red;'> Train NO Already Exist TRY AGAIN </span> </h3>");
    			out.println("<a href='TrainInfo.jsp'> OK </a>");
    			out.println("</div>");
  		}
            else{
            %>
            <br/>
	  	<table id="table1" align="center" style="font-weight: bold;" >
		  <tr>
      		<th colspan="2" style="font-size: 18px;"> Train Details </th>
		</tr>
          <tr>
            <td><label> Train N0 </label></td>
            <td>       
			<input type="text" name="trainno" value="<%= tno %>" readonly="readonly" tabindex="-1"/></td>
			
          </tr>
         
         
         <!-- Scriplet to fetch the source and destination from back end based on the destination Id -->
          <%
              int did=Integer.parseInt(request.getParameter("destid"));
	          
	          String sql1 = "select station_name from route where station_id="+did+";"; 
	          
	          pstmt = con.prepareStatement(sql1);
	          
	          rs = pstmt.executeQuery();
	          
	          String dest="";
	          
	          while (rs.next()){
	        	  dest = rs.getString("station_name");
	        	 
	          }
	
	          
	          int sid= did - 99;
	          
	          String sql2 = "select station_name from route where station_id="+sid+";"; 
	          
	          pstmt = con.prepareStatement(sql2);
	          
	          rs = pstmt.executeQuery();
	          
	          String src="";
	          while (rs.next()){
	        	  src = rs.getString("station_name");
	          }
          
          %>
         <!-- End of Scriplet to fetch the source and destination from back end based on the destination Id -->
          
         
          <tr>
         
         
            <td><label> Source </label></td>
            <td>
            
            <!-- To forward the id's fetched from backend -->
            <input type="hidden" name="srcid" value=<%=sid %>>
            <input type="hidden" name="destid" value=<%=did %>>
            

            <input type="text"  name="src" value=<%= src %> readonly="readonly" tabindex="-1"/> </td>
          </tr>
          <tr>
            <td><label> Destination </label></td>
            <td><input type="text" name="dest"value=<%= dest %> readonly="readonly" tabindex="-1"/> </td>
          </tr>
          <tr>
            <td><label> Train Name </label></td>
            <td><input type="text" name="tname" maxlength="30" onkeyup="alp1(this)" onkeydown="alp1(this)" /></td>
          </tr>
          <tr>
            <td><label> Type </label></td>
            <td>
            <select name="type">
            <option> ORDINARY </option>
            <option> EXPRESS </option>
            <option> RAJDHANI  </option>
            <option> JAN SHATABADI </option>
            <option> SHATABADI </option>
            </select>
            </td>
          </tr>
          <tr>
            <td><label> Departures On </label></td>
            <td align="left">
            <input type="checkbox" name="days" value="mon" /> Monday<br>
            <input type="checkbox" name="days" value="tue" /> Tuesday<br> 
            <input type="checkbox" name="days" value="wed" /> Wednesday<br> 
            <input type="checkbox" name="days" value="thu" /> Thursday<br> 
            <input type="checkbox" name="days" value="fri" /> Friday<br> 
            <input type="checkbox" name="days" value="sat" /> Saturday<br>
            <input type="checkbox" name="days" value="sun" /> Sunday 
            </td>
          </tr>
          <tr>
            <th colspan="2"> No Of Coaches </th>
          </tr>
          <tr>
            <td><label> Sleeper Class </label></td>
            <td><input type="text" name="sl" value="0" size="4" maxlength="4" onkeyup="num(this)" onkeydown="num(this)" onchange='check(this)' onblur='empty(this)' /></td>
          </tr>
          <tr>
            <td><label> AC First Class </label></td>
            <td><input type="text" name="a1" value="0" size="4" maxlength="4" onkeyup="num(this)" onkeydown="num(this)" onblur='empty(this)'/></td>
          </tr>
          <tr>
            <td><label>AC 2 Tier </label></td>
            <td><input type="text" name="a2" value="0" size="4" maxlength="4" onkeyup="num(this)" onkeydown="num(this)" onblur='empty(this)'/></td>
          </tr>
          <tr>
            <td><label> AC 3 Tier </label></td>
            <td><input type="text" name="a3" value="0" size="4" maxlength="4" onkeyup="num(this)" onkeydown="num(this)" onblur='empty(this)'/></td>
          </tr>
    </table>
    
    <p align="center">
    	<input type="button" value="Save Details" onclick="validate()" />
    	<input type="reset" />
    </p>
  
</div>
</form>


</body>
</html>