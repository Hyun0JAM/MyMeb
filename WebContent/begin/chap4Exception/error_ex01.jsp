<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String num1 = request.getParameter("num1"); 
	String num2 = request.getParameter("num2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error_ex01.jsp</title>
</head>
<body>
	<h1>error_ex01.jsp</h1>
	<h2>try ~ catch ==> RequestDispatcher 를 이용한 에러페이지 출력</h2><br/>
	숫자가 아닌 데이터가 입력되었습니다.<br/>
	<%= "첫번째 수"+ num1 %><br/><!-- JSP속의 JAVA속에 html사용가능 -->
	<%= "두번째 수"+ num2 %><br/>
	<a href="1numberInputForm.jsp">되돌아가기</a>
</body>
</html>