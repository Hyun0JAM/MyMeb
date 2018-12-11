<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="begin.chap3StandardAction.MemberDTO" %>
    
<%
	//객체 생성
	MemberDTO mdto = new MemberDTO(); //import 해줘야되
	
	String name = mdto.getName();
	String gender = mdto.getViewGender();
	int age = mdto.getAge();
	
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 표준액션중 useBean 에 대해서 알아봅시다</title>
</head>
<body>
	<h2>스크립틀릿을 사용하여 MemberDTO 클래스의 객체정보를 불러오기</h2>
	<ul style="list-style-type: none;">
		<li>성명: <%= name %> </li>
		<li>성별: <%= gender %> </li>
		<li>나이: <%= age %> </li>
	</ul>
	<hr style="height: 2px; background-color: red; border: none;">
	
	<h2>JSP 표준액션중 useBena을 사용하여 MemberDTO 클래스의 객체정보를 불러오기</h2>
	<!-- 이게 import한것과 객체를 생성한것과 같은것이다. -->
	<jsp:useBean id="memberdto" class="begin.chap3StandardAction.MemberDTO"/>
	<ul style="list-style-type: none;">
		<!-- property java파일의 get뒤에 붙은 이름 첫글자는 소문자로 해서, name에 생성되어진 객체 이름 -->
		<li>성명: <jsp:getProperty property="name" name="memberdto"/> </li>
		<li>성별: <jsp:getProperty property="viewGender" name="memberdto"/> </li>
		<li>나이: <jsp:getProperty property="age" name="memberdto"/> </li>
	</ul>
</body>
</html>