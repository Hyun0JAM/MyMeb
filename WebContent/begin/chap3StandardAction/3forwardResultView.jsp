<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	
	String first = request.getParameter("firstNum");
	String last = request.getParameter("lastNum");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과물 보여주기(EL 사용한 것)</title>
</head>
<body>
	<h3>결과물 보여주기(EL 사용한 것)</h3><br/>
	<%= first %>부터 <%= last %>까지의 합은?<br/>
	결과값: <span style="color: blue;">${sum}</span><br/>
	결과값*100: <span style="color: blue;">${sum*100}</span>
</body>
</html>