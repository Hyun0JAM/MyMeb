<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%><!-- 디폴트는 false 에러가 났을시 사용하려면 true -->
<% 
	String num1 = request.getParameter("num1"); 
	String num2 = request.getParameter("num2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error_ex02.jsp</title>
</head>
<body>
	<h1>error_ex02.jsp</h1>
	<h2>try ~ catch ==> RequestDispatcher 를 이용한 에러페이지 출력</h2><br/>
	숫자가 아닌 데이터가 입력되었습니다.<br/>
	에러메시지 : <%= exception.getMessage() %><%-- isErrorPage="true"이것이 있어야만 사용가능하다. --%>
	<a href="1numberInputForm.jsp">되돌아가기</a>
</body>
</html>