<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="memberdao" class="member.model.MemberDAO" scope="application" />

<jsp:useBean id="membervo" class="member.model.MemberVO" />
<%-- scope="page" 을 안적으면 기본값이 scope="page" 이다. --%>
<jsp:setProperty property="*" name="membervo"/>
<%
	int n = memberdao.registerMember(membervo); 

    if(n == 1) { %>
    	<script type="text/javascript">
    		alert("회원가입 성공!!");
    		location.href="memberList.jsp";
    		// 자바스크립트에서 페이지이동은 location.href="이동해야할 페이지명"; 으로 한다. 
    	</script>
    <% }
    else { %>
    	<script type="text/javascript">
			alert("회원가입 실패!!");
			location.href="memberform.jsp";
			// 자바스크립트에서 페이지이동은 location.href="이동해야할 페이지명"; 으로 한다. 
		</script>
    <% }
%>
