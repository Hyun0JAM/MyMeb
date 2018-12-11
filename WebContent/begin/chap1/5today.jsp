<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Date now = new Date();
	String today = String.format("오늘은 %tY년 %tm월 %td일 %tA 입니다.",now,now,now,now);
%>
<%=today %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

</body>
</html>