<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%
	Date now = new Date();
	String today=String.format("오늘은 %tY년 %tm 월 %td일 %tA 입니다.",now,now,now,now);
	
%>
 copyrightn 이 웹페이지의 저작권은 차지석씨에게 있습니다.<br/>
 <span style="color : blue; font-weight: bold;'"><%= today %></span>