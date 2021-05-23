<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Trains</title>

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
<body>
<div align="center">
<form name="form1">
<h1> Search Trains Between Stations </h1>
<table>
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
				<select id="select2" name="destid" onchange="extract()">
				<option value="0">--Please Select--</option>
				<%
			//	String s_sta=request.getParameter("value");
				String sql2 ="select d_station_id, d_station_name from route_main ";
		PreparedStatement		pstmt2 = con.prepareStatement(sql2);
			ResultSet	rs1 = pstmt2.executeQuery();
				while(rs1.next()){
				%>
				<option value="<%=rs1.getString("d_station_id")%>" ><%=rs1.getString("d_station_name")%></option>
				<%
				}
				%>
				</select>
			</td>
			</tr>
</table>

<hr />
<br />

<%
try{
		int did=Integer.parseInt(request.getParameter("did"));
		int sid = did - 99;
		
		String sql3="select t.train_no, t.train_name, t.type, r.s_station_name, r.d_station_name, t.mon, t.tue, t.wed, t.thu, t.fri, t.sat, t.sun from train_info t, route_main r where t.s_station_id=r.s_station_id and t.s_station_id=? and t.d_station_id=?;";
		
		pstmt = con.prepareStatement(sql3);
		
		pstmt.setInt(1,sid);
		pstmt.setInt(2,did);
		
		rs = pstmt.executeQuery();

		out.println("<h3> Trains Between a Pair Of Stations </h3>");
		out.println("<br />");
		out.println("<table border='1' bordercolor=#333333 style='color:white; font-weight: bold;'>");
		out.println("<tr bgcolor=#333333>");
		out.println("<th rowspan='2'> Train No </th>");
		out.println("<th rowspan='2'> Train Name </th>");
		out.println("<th rowspan='2'> Type </th>");
		out.println("<th rowspan='2'> Origin </th>");
		out.println("<th rowspan='2'> Destination </th>");
		out.println("<th colspan='7'> Days Of Run </th>");
		out.println("</tr>");
		out.println("<tr bgcolor=#333333>");
				out.println("<td> Mon</td>");
				out.println("<td> Tue</td>");
				out.println("<td> Wed</td>");
				out.println("<td> Thu</td>");
				out.println("<td> Fri</td>");
				out.println("<td> Sat</td>");
				out.println("<td> Sun</td>");
				out.println("</tr>");

		int flag=0;
		
		while(rs.next()){
			flag=1;
			out.println("<tr style='color:blue; font-weight: bold;'>");
			out.println("<td>"+ rs.getInt("train_no") +"</td>");
			out.println("<td>"+ rs.getString("train_name") +"</td>");
			out.println("<td>"+ rs.getString("type") +"</td>");
			out.println("<td>"+ rs.getString("s_station_name") +"</td>");
			out.println("<td>"+ rs.getString("d_station_name") +"</td>");
			
			if(rs.getString("mon").equalsIgnoreCase("Y")){
				out.println("<td><span style='color: green;font-weight: bold;'>");
			}else{
				out.println("<td><span style='color: red;font-weight: bold;'>");				
			}
			out.println(rs.getString("mon") +"</span></td>");

			
			if(rs.getString("tue").equalsIgnoreCase("Y")){
				out.println("<td><span style='color: green;font-weight: bold;'>");
			}else{
				out.println("<td><span style='color: red;font-weight: bold;'>");				
			}
			out.println(rs.getString("tue") +"</span></td>");

			
			if(rs.getString("wed").equalsIgnoreCase("Y")){
				out.println("<td><span style='color: green;font-weight: bold;'>");
			}else{
				out.println("<td><span style='color: red;font-weight: bold;'>");				
			}
			out.println(rs.getString("wed") +"</span></td>");

			
			if(rs.getString("thu").equalsIgnoreCase("Y")){
				out.println("<td><span style='color: green;font-weight: bold;'>");
			}else{
				out.println("<td><span style='color: red;font-weight: bold;'>");				
			}
			out.println(rs.getString("thu") +"</span></td>");

			
			if(rs.getString("fri").equalsIgnoreCase("Y")){
				out.println("<td><span style='color: green;font-weight: bold;'>");
			}else{
				out.println("<td><span style='color: red;font-weight: bold;'>");				
			}
			out.println(rs.getString("fri") +"</span></td>");

			
			if(rs.getString("sat").equalsIgnoreCase("Y")){
				out.println("<td><span style='color: green;font-weight: bold;'>");
			}else{
				out.println("<td><span style='color: red;font-weight: bold;'>");				
			}
			out.println(rs.getString("sat") +"</span></td>");

			
			if(rs.getString("sun").equalsIgnoreCase("Y")){
				out.println("<td><span style='color: green;font-weight: bold;'>");
			}else{
				out.println("<td><span style='color: red;font-weight: bold;'>");				
			}
			out.println(rs.getString("sun") +"</span></td>");
			
			out.println("</tr>");
%>

<%
		}
		out.println("</table>");
		if(flag==0){
			%>
			
				alert("No Trains Found");
			
			<%
		}
		}catch(Exception e){
			//out.println(e);
		
	}
%>

</table>

</form>
</div>
</body>
</html>
