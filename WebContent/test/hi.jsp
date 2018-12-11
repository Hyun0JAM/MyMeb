<%@page import="java.util.Date"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 연습</title>
</head>
<body>
	<h1>Hello JSP~~~</h1>
	<h2>안녕 제이에스피~~~</h2>
	<img src="tomcat.png"/>
	<%
		//자바소스 들어 오는 곳
		Date today = new Date();

		String date = String.format("%TF", today);
		String time = String.format("%tp %tT",today, today);
	%>
	<br/><br/>
	오늘의 날짜 : <span style="color:red;"><%=date %></span><br/>
	현재 시간 : <span style="color:blue;"><%=time %></span>
</body>
</html>