<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> Bookings</title>
$(function() {
			  $( "#datepicker" ).datepicker({ showAnim: 'bounce',
				  minDate: "-1W -0D", maxDate: "0D" });
		});
		</script>
		<style >
			body{ font: 62.5% "Arial", sans-serif; margin: 50px;}
		</style>

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


function valid(){
	if(document.form1.date.value != ""){
		document.form1.submit();
	}else{
		alert("Please Select a Date to view Bookings");
		document.form1.date.focus();
	}
}

</head>
<body>


<div align="center">
		<form name="form1" action="./adminbook.jsp">
			<h1 align="center"> Bookings </h1>
			<br/>
			<label style="font-weight: bold; color: red;"> Select A Date To View Bookings</label>
			<p>
			<input type="text" name="date" readonly="readonly" id="datepicker" title="YYYY/MM/DD" size="12"/>
			<img alt="" src="./jsDate/css/images/date.png" height="35px" width="35px" onclick="document.form1.date.focus()">
			</p>
			<input type="button" value="Search" onclick="valid();">
			<br/>
			<br/>
			<div>
			<%
		tryblock:	try{
				String date = request.getParameter("date");
				
				if(date.equalsIgnoreCase(null)){
					break tryblock;
				}
				String sql1="select distinct t.PNR, t.train_no, t.dep_date, t.adult, t.child, t.no_seats, t.board_station, t.dest_station, t.total_km, u.name from ticket_book t, reg_user u where t.user_id=u.user_id and t.book_date='"+date+"' ";
				
				pstmt = con.prepareStatement(sql1);
				
				rs = pstmt.executeQuery();
				
				out.println("<table border='1' bordercolor=#333333>");
				out.println("<tr bgcolor=#333333>");
				out.println("<th align='left' colspan='8' style='color:white'> Booking Details : </th> </tr>");
				out.println("<tr bgcolor=#333333 style='color:white'>	<th> PNR No</th> <th> Train No</th> <th> Dep_Date</th> <th> No_Seats</th><th> Boarding Station</th><th> Destination Station</th><th> Distance</th><th> Booked By</th>	</tr>");

				int flag=0;
				while(rs.next()){
					flag=1;
					out.println("<tr style='color:blue; font-weight:bold'>");
					out.println("<td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getString(9)+"</td><td>"+rs.getString(10)+"</td>");
					out.println("</tr>");
				}
				out.println("</table>");
				
				if(flag==0){
					%>
					<script type="text/javascript">
						alert("No Bookings Found");
					</script>
					<%
				}
				
			}
			catch(Exception e){
			}
			%>
			</div>
		</form>
		</div>
		

					</body>
					</html>
					