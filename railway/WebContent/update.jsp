<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="lime">
<%! String str1, str2,str3, str4,str5, str6,str7,str8;
int tno;
Long price;%>
<%
str1=request.getParameter("name1");
 tno=Integer.parseInt(str1);
str2=request.getParameter("name2");
str3=request.getParameter("name3");
str4=request.getParameter("name4");
str5=request.getParameter("name5");
str6=request.getParameter("name6");
str7=request.getParameter("name7");
 str8=request.getParameter("name8"); price=Long.parseLong(str8);
%>
<form action="finalupdate.jsp">
Train Number:<input type="text" name="t1" value=<%=tno %>><br>
Train Name:<input type="text" name="t2" value=<%=str2 %>><br>
Train source:<input type="text" name="t3" value=<%=str3 %>><br>
Train Destination:<input type="text" name="t4" value=<%=str4 %>><br>
Train depart:<input type="text" name="t5" value=<%=str5 %>><br>
Train Arrival:<input type="text" name="t6" value=<%=str6 %>><br>
Train Coach:<input type="text" name="t7" value=<%=str7 %>><br>
Train Price:<input type="text" name="t8" value=<%=price %>><br>
<input type="submit" value="save">



</form>











</body>
</html>