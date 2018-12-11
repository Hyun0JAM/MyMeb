<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //현재시각 알아오기 
	Date now = new Date();
	String today = String.format("%tF %tT",now,now);
	String today2 = String.format("오늘은 %tY년 %tm월 %td일 %tA 입니다.",now,now,now,now);
		
%>
<%-- String today = String.format("%tF , %tT", now, now);
    /*
      String.format() 메소드는 System.out.printf() 메소드 처럼
           문자열을 형식에 맞도록 해주는 포맷기능을 한다.
           그런데  System.out.printf() 메소드는 포맷된 결과를 바로 모니터에 출력을 해주지만, 
      String.format() 메소드는 모니터에 바로 출력해주지 않고
          원하는 포맷으로 문자열을 만들어서 리턴(반환)만 해주는 메소드이다.
          %d ==> 정수
          %s ==> 문자열
          %f ==> 실수
          %t ==> 날짜(시간)    
    */

    /*
      <참고>
	   날짜 타입 format         설명
	   --------------------------------------------------
        %tF              날짜를 yyyy-mm-dd 형식으로 포맷해주는 것
		%tT              날짜의 시각을 HH:MM:SS 형식으로 포맷해주는 것  
        %tp              오전, 오후를 출력
		%tA              요일명 출력
		%tY              4자리 년도만 출력
        %tB              월의 이름(January, February ...)출력
		%tm              월의 01,02,03 ~~ 10,11,12 로 출력
		%td              일수를 1~31 로 출력
		%te              %td와 동일함
		%tk              시간을 0~23 으로 출력
        %tl              시간을 1~12 으로 출력
		%tM              분을 00~59 으로 출력
        %tS              초를 00~59 으로 출력
		%tZ              타임존을 출력(한국은 KST로 나옴).
	*/	

	String today2 = String.format("오늘은 %tY년 %tm월 %td일 %tA 입니다.", now, now, now, now); --%>
<!DOCTYPE html>
<html>
<head>
<title>날짜와 현재시각을 알아본다.</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div style="margin: 20px;">
		<ul style="list-style-type: square;">
			<li>오늘의 날짜 : <%=now %></li>
			<li>오늘의 날짜 : <%=today %></li>
			<li>오늘의 날짜 : <span style="color:red"><%=today2 %></span></li>
		</ul>
	</div>
	<div style="margin: 20px;">
		<ul style="list-style-type: disk;">
			<li>오늘의 날짜 : <%=now %></li>
			<li>오늘의 날짜 : <%=today %></li>
			<li>오늘의 날짜 : <span style="color:red"><%=today2 %></span></li>
		</ul>
	</div>
	<div style="margin: 20px;">
		<ul style="list-style-type: circle;">
			<li>오늘의 날짜 : <%=now %></li>
			<li>오늘의 날짜 : <%=today %></li>
			<li>오늘의 날짜 : <span style="color:red"><%=today2 %></span></li>
		</ul>
	</div>
	<div style="margin: 20px;">
		<ol style="list-style-type: none">
			<li>오늘의 날짜 : <%=now %></li>
			<li>오늘의 날짜 : <%=today %></li>
			<li>오늘의 날짜 : <span style="color:red"><%=today2 %></span></li>
		</ol>
	</div>
	<div style="margin: 20px;">
		<ol style="list-style-type: decimal">
			<li>오늘의 날짜 : <%=now %></li>
			<li>오늘의 날짜 : <%=today %></li>
			<li>오늘의 날짜 : <span style="color:red"><%=today2 %></span></li>
		</ol>
	</div>
	<div style="margin: 20px;">
		<ol style="list-style-type: decimal-leading-zero;">
			<li>오늘의 날짜 : <%=now %></li>
			<li>오늘의 날짜 : <%=today %></li>
			<li>오늘의 날짜 : <span style="color:red"><%=today2 %></span></li>
		</ol>
	</div>
	<div style="margin: 20px;">
		<ol start="50" style="list-style-type: decimal-leading-zero;">
			<li>오늘의 날짜 : <%=now %></li>
			<li>오늘의 날짜 : <%=today %></li>
			<li>오늘의 날짜 : <span style="color:red"><%=today2 %></span></li>
		</ol>
	</div>
	<div style="margin: 20px;">
		<ol start="50" style="list-style-type: lower-roman;">
			<li>오늘의 날짜 : <%=now %></li>
			<li>오늘의 날짜 : <%=today %></li>
			<li>오늘의 날짜 : <span style="color:red"><%=today2 %></span></li>
		</ol>
	</div>
	<div style="margin: 20px;">
		<ol start="50" style="list-style-type: upper-roman;">
			<li>오늘의 날짜 : <%=now %></li>
			<li>오늘의 날짜 : <%=today %></li>
			<li>오늘의 날짜 : <span style="color:red"><%=today2 %></span></li>
		</ol>
	</div>
	<div style="margin: 20px;">
		<ol start="50" style="list-style-type: lower-alpha;">
			<li>오늘의 날짜 : <%=now %></li>
			<li>오늘의 날짜 : <%=today %></li>
			<li>오늘의 날짜 : <span style="color:red"><%=today2 %></span></li>
		</ol>
	</div>
	<div style="margin: 20px;">
		<ol start="50" style="list-style-type: upper-alpha;">
			<li>오늘의 날짜 : <%=now %></li>
			<li>오늘의 날짜 : <%=today %></li>
			<li>오늘의 날짜 : <span style="color:red"><%=today2 %></span></li>
		</ol>
	</div>
</body>
</html>