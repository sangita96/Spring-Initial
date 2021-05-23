<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<%! 
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	
	public void jspInit(){
		try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/train","root","");
		System.out.println("Connected");
		}
		catch(Exception e ){
			e.printStackTrace();
		}
		}
%>


</head>
<body>
<%

int uid1=0;
String pass1=null;

try{
	/*String sid = request.getSession().getId();
	session.setAttribute("sid",sid);*/

	uid1 = Integer.parseInt(request.getParameter("userid"));
	pass1 = request.getParameter("password");


	String sql1 ="select user_id, pass from login";

	pstmt = con.prepareStatement(sql1);

	

	rs = pstmt.executeQuery();

	

	if(rs.next()){
		int uid = rs.getInt("user_id");
		String pass = rs.getString("pass");
		if(uid== uid1 &&  pass.equals(pass1))
			if(rs.getString("author").equalsIgnoreCase("admin"))				
			{
				response.sendRedirect("adminhome.jsp");	
			}
			else if(rs.getString("author").equalsIgnoreCase("user"))
			{
				response.sendRedirect("adminlogin.jsp");						
			}
		{
			response.sendRedirect("adminhome.jsp");
		}
	}

		
		else
		{
			response.sendRedirect("home.html");
		}
	
}
catch(Exception e){
	e.printStackTrace();
	System.out.println(e);
	response.sendRedirect("home.html");						
}

%>
</body>
</html>