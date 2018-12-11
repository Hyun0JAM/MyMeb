<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>JPS 표준액션 중 include 에 대해서 알아봅니다.</title>
</head>
<body>
	<h3>책소개</h3>
	도서명 : 향수<br/>
	저자    : 차지석<br/>
	페이지수 : 300p<br/>
	<jsp:include page="1includeContent.jsp" ></jsp:include>
	가격 : 20,000원<br/>
	
</body>
</html>