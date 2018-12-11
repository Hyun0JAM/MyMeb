<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<title>오늘의 메뉴</title>
</head>
<body>
	<h3>오늘의 메뉴</h3>
	<ol>
		<li>햄버거 5000원</li>
		<li>짜장면 5000원</li>
		<li>짬뽕 6000원</li>
		<li>팔보채 8000원</li>
	</ol>
	<div id="today">
		<%@include file="5today.jsp" %>
	</div>
</body>
</html>