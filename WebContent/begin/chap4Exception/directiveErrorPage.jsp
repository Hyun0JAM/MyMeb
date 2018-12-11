<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error_ex02.jsp"%>
<%
int num1 = Integer.parseInt(request.getParameter("num1"));
int num2 = Integer.parseInt(request.getParameter("num2"));
int sum = num1+num2;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>directiveErrorPage.jsp</title>
</head>
<body>
	<%= num1 %> + <%= num2 %> = <%= sum %><br/><br/>
	<a href="1numberInputForm.jsp">되돌아가기</a>
</body>
</html>