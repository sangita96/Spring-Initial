<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%! String str1, str2,str3, str4,str5, str6,str8;
int tno;
Long price;%>
<%
str1=request.getParameter("t1");
 tno=Integer.parseInt(str1);
str2=request.getParameter("t2");
str3=request.getParameter("t3");
str4=request.getParameter("t4");
str5=request.getParameter("t5");
str6=request.getParameter("t6");

 str8=request.getParameter("t8"); 
 price=Long.parseLong(str8);
%>

<% Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/train","root","");
PreparedStatement ps=con.prepareStatement("update admin set name=?, from1=?,to1=?,depart=?,arr=?,coach=?, price=? where t_no=? ");
ps.setString(1,str2);
ps.setString(2,str3);
ps.setString(3,str4);
ps.setString(4,str5);
ps.setString(5,str6);

ps.setLong(7,price);
ps.setInt(8, tno);
int i=ps.executeUpdate();
if(i>0)
{
	out.println("sucessfully updated to the database");
	
	
}


out.println(str1);
out.println(str2);
out.println(str3);
out.println(str4);
out.println(str5);
out.println(str6);

out.println(str8);
%>
</body>
</html>