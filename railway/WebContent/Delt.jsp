<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String t_no=request.getParameter("t1");
	int t_no1=Integer.parseInt(t_no);
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/train","root","");
		 PreparedStatement ps=con.prepareStatement("delete from train_data where t_no=?");
			ps.setInt(1, t_no1);
			 int s=ps.executeUpdate();
		if(s==1)
		{
			out.println("successfully deleted");
		}
		else
		{
			out.println("empty set");
		}	
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	%>
</body>
</html>