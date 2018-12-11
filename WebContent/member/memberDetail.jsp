<%@page import="member.model.MemberVO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" />
<jsp:useBean id="memberdao" class="member.model.MemberDAO" scope="application" />
<link href="https://fonts.googleapis.com/css?family=Song+Myung" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/MyWeb/css/style.css" />
<%
	String str_idx = request.getParameter("idx");
	String url = request.getParameter("goBackUrl");
	MemberVO member = null;
	try {
	    int idx = Integer.parseInt(str_idx);
	    member = memberdao.getByIdx(idx);
		if(member == null) {
		 	request.setAttribute("str_idx", str_idx);
		   	RequestDispatcher dispatcher = request.getRequestDispatcher("error1.jsp");
		   	dispatcher.forward(request, response);
		   	return; 
		   	// 위에서 dispatcher.forward(request, response); 을 했다고 하더라도
		   	// 자바는 계속해서 다음 명령문을 실행을 하기 때문에
		   	// 다음 명령문을 실행하지 않도록 하기 위해 return; 을 해서 종료시킨다.
	    }
	} catch(NumberFormatException e) {
	   	request.setAttribute("str_idx", str_idx);
    	RequestDispatcher dispatcher = request.getRequestDispatcher("error1.jsp");
    	dispatcher.forward(request, response);    	
    	return;
    }
%>
<style>
#p{
	color: black;
	line-height:180%;
	font-size:0.9em;}
li{	text-align:left;}
button{
	margin-top:3%; 
	border:none; 
	padding: 5px 10px; 
	color: black;
	font-size:0.8em;
	font-weight: bold;
	border-radius: 3px;}
</style>
<div>
	<h2 class="font" style="font-weight:bold">"회원 상세 정보"</h2>
	<div class="font" style="border:1px dotted; margin-top:3%; width:450px; padding:30px;">
		<span id="p">회원번호 : </span>&nbsp;<%= member.getIdx() %><br/>
		<span id="p">회원명 : </span>&nbsp;<%= member.getName() %><br/>
		<span id="p">아이디 : </span>&nbsp;<%= member.getUserid() %><br/>
		<span id="p">연락처 : </span>&nbsp;<%= member.getAllHp() %><br/>
		<span id="p">성별 : </span>&nbsp;<%=member.getShowGender() %><br/>
		<span id="p">주소 : </span>&nbsp;(<%= member.getAllPost() %>) <%= member.getAllAddr() %><br/>
		<span id="p">생일 : </span>&nbsp;<%= member.getBirthyyyy() %>/<%= member.getBirthmm() %>/<%= member.getBirthdd() %><br/>
		<span id="p">가입일자 : </span>&nbsp;<%= member.getRegisterday() %><br/>
		<span id="p">코인 : </span>&nbsp;<%= member.getCoin() %><br/>
		<span id="p">포인트 : </span>&nbsp;<%= member.getPoint() %><br/>
	</div>
	<button type="button" onClick="javascript:history.back();">회원목록</button>
</div>
<jsp:include page="../footer.jsp" />