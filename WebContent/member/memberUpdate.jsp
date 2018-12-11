<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberdao" class="member.model.MemberDAO" scope="application"/>

<%-- DTO(Data Transfer Object) == VO(Value Object) --%>
<jsp:useBean id="membervo" class="member.model.MemberVO" />
<jsp:setProperty property="*" name="membervo" />
<%
	String str_idx = request.getParameter("idx");
	int idx = Integer.parseInt(str_idx);
	
	int n = memberdao.modifyMemberInfo(membervo);

	if(n == 1){ %>
		<script type="text/javascript">
			alert("회원 정보 수정 성공!");
			self.close();
		</script>
	<%}
	else{%>
		<script type="text/javascript">
			alert("회원 정보 수정 실패!");
			history.back();
		</script>
	<%}
%>

<script type="text/javascript">
	console.log("<%= idx %>");
</script>