<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberdto" class="begin.chap3StandardAction.MemberDTO"/>
<jsp:setProperty property="name" name="memberdto" value="${param.name}"/>
<jsp:setProperty property="jubun" name="memberdto" value="${param.jubun}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>개인정보 입력 결과(JSP표준액션)</title>
</head>
<body>
	<div class="container">
		<h2>개인정보 입력 결과</h2>
		<p>The .table-hover class enables a hover state on table rows:</p>            
		<table class="table table-hover">
		  <thead><!-- 타이틀 -->
		    <tr>
		      <th>성명</th>
		      <th>주민번호</th>
		      <th>성별</th>
		      <th>나이</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <td><jsp:getProperty property="name" name="memberdto" /></td>
		      <td><jsp:getProperty property="jubun" name="memberdto" /></td>
		      <td><jsp:getProperty property="showGender" name="memberdto" /></td>
		      <td><jsp:getProperty property="showAge" name="memberdto" /></td>
		    </tr>
		  </tbody>
		</table>
	</div>
</body>
</html>