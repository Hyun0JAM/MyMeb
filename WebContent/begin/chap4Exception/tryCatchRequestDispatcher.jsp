<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
int num1=0,num2=0,sum=0;
try{
	num1 = Integer.parseInt(request.getParameter("num1"));
	num2 = Integer.parseInt(request.getParameter("num2"));
	sum = num1+num2;
}catch(NumberFormatException e){
	/* 에러페이지로 이동 */
	RequestDispatcher dispatcher = request.getRequestDispatcher("error_ex01.jsp");
	dispatcher.forward(request, response);
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tryCatchRequestDispatcher.jsp페이지 입니다.</title>
</head>
<body>
	<%= num1 %> + <%= num2 %> = <%= sum %><br/><br/>
	<a href="1numberInputForm.jsp">되돌아가기</a>
</body>
</html>