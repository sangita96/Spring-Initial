<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%!Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String name=null;
	int t_no=0;
	String from1=null;
	String to1=null;
	String depart=null;
	String arr=null;
	Long price;
		%>
		<% Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/train","root","");
		ps=con.prepareStatement("select * from train_data");
		rs=ps.executeQuery();
		%>
		<table align="center" bgcolor="cyan" border="4" bordercolor="black" cellpadding="4" cellspacing="4">
		<thead>
			<th>name</th>
			<th>t_no</th>
			<th>from1</th>
			<th>to1</th>
			<th>depart</th>
			<th>arr</th>
		
			<th>price</th>
			</thead>
		
		
		
		<%
		while(rs.next())
		{
			name=rs.getString(1);
			t_no=rs.getInt(2);
			from1=rs.getString(3);
			to1=rs.getString(4);
			depart=rs.getString(5);
			arr=rs.getString(6);
		
			price=rs.getLong(7);
		
				 %>
		 <tr>
		 	<td bgcolor="white"><font color="green"><input type="text"  name="t1" value='<%=name %>' size="5"></font></td>
		 	<td bgcolor="white"><font color="green"><input type="text"  name="t1" value='<%=t_no %>' size="5"></font></td>
		 	<td bgcolor="white"><font color="green"><input type="text"  name="t1" value='<%=from1 %>' size="5"></font></td>
		 	<td bgcolor="white"><font color="green"><input type="text"  name="t1" value='<%=to1 %>' size="5"></font></td>
		 	<td bgcolor="white"><font color="green"><input type="text"  name="t1" value='<%=depart %>' size="5"></font></td>
		 	<td bgcolor="white"><font color="green"><input type="text"  name="t1" value='<%=arr %>' size="5"></font></td>
		 	
		 	<td bgcolor="white"><font color="green"><input type="text"  name="t1" value='<%=price %>' size="5"></font></td>
		 	
		 	
		 	
		 	<td>			 			 	
		 	<a href='AddTrain.html'><input type="button" value="Add"></a></td>
		 	<td><a href='update.jsp?name1=<%=t_no%>&name2=<%=name%>&name3=<%=from1%>&name4=<%=to1%>&name5=<%=depart%>&name6=<%=arr%>&name8=<%=price%>'><input type="button" value="Update"></a></td>
		 	<td><a href='Delete.html'><input type="button" value="Delete"></a></td>
		 	
		 	</tr>
		 	
		 	
		 	
		 	<%} %>
		</table>

</body>
</html>