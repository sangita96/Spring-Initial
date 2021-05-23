<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*;" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%!int i=0; %>
	<%
	String name=request.getParameter("t1");
	String t_no=request.getParameter("t2");
	int t_no1=Integer.parseInt(t_no);
	String from1=request.getParameter("t3");
	String to1=request.getParameter("t4");
	String depart=request.getParameter("t5");
	String arr=request.getParameter("t6");
	
	
	String price=request.getParameter("t8");
	long pr1=Long.parseLong(price);
	System.out.println(name + " "+ t_no + " "+ from1 + " "+ to1 + " "+ depart + " "+ arr + " " + pr1);
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/train","root","");
		PreparedStatement ps = con.prepareStatement("insert into train_data values(?,?,?,?,?,?,?)");
         ps.setString(1, name);
			ps.setInt(2, t_no1);
			ps.setString(3, from1);
			ps.setString(4, to1);
			ps.setString(5, depart);
			ps.setString(6, arr);
			
			ps.setLong(7, pr1);
			i=ps.executeUpdate();
		 
		 
		 
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
			if(i>0)
				response.sendRedirect("View.jsp");
			else
				response.sendRedirect("Wrong data");
				//response.sendRedirect("error.html");
	%>
</body>
</html>