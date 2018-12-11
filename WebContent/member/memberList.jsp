<%@page import="member.model.MemberVO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/MyWeb/css/style.css" />
<jsp:useBean id="memberdao" class="member.model.MemberDAO" scope="application" />
<jsp:include page="../header.jsp" />
<%
	List<MemberVO> memberList = null;
	//검색타입 및 검색어 받아오기
	String searchType = request.getParameter("searchType");
	String searchWord = request.getParameter("searchWord");
	
	if(searchType==null) 
		searchType = "name";
	else {
		if(!"name".equals(searchType)&&
		   !"userid".equals(searchType)&&
		   !"email".equals(searchType)) 
			searchType = "name";
	}
	
	
	if(searchWord== null) searchWord="";
	
	//한페이지당 보여줄 회원명수
	String str_sizePerPage = request.getParameter("sizePerPage");
	String str_period = request.getParameter("period");
	int period = 0;
	if(str_period==null) period = -1;
	else{
		try{
			period = Integer.parseInt(str_period);
			if(period!=-1&&period!=1&&period!=3&&period!=10&&period!=30&&period!=60) period= -1;
		} catch(NumberFormatException e){
			period = -1;
		}
	}
	int sizePerPage =0;
	if(str_sizePerPage == null)	sizePerPage = 5; // 초기의 한페이지당 컬럼갯수를 5개로
	else {
		try{
			sizePerPage = Integer.parseInt(str_sizePerPage);
			if(sizePerPage!=3&&sizePerPage!=5&&sizePerPage!=10) sizePerPage=5;
		} catch(NumberFormatException e){
			sizePerPage = 5;
		}
	}
	//*** 전체 멤버 수 구하기
	int totalMemberCount = 0;
	totalMemberCount = memberdao.getTotalCount(searchType,searchWord,period);
	//*** 전체 페이지 수 구해오기
	int totalPage = (int)Math.ceil((double)totalMemberCount/sizePerPage);
	//*** 사용자가 보고자하는 페이지번호
	String str_currentShowPageNo = request.getParameter("currentShowPageNo");
	int currentShowPageNo = 0;
	if(str_currentShowPageNo==null) currentShowPageNo = 1; // 초기화면을 1페이지로 설정
	else { // 사용자가 특정 페이지를 보고자 한 경우
		try{
			currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
			if(currentShowPageNo<1||currentShowPageNo>totalPage) currentShowPageNo = 1;
		} catch(NumberFormatException e){
			currentShowPageNo = 1;
		}
	}
	//페이징 처리하기 이전의 전체회원 가져오기
	//memberList = memberdao.getAllMember();
	//페이징 처리를 한 전체 회원 목록조회(날짜구간없는)
	//memberList = memberdao.getAllMember(sizePerPage,currentShowPageNo);
	//날짜구간이 있는 
	memberList = memberdao.getAllMember(sizePerPage,currentShowPageNo,period,searchType,searchWord);
%>
<script type="text/Javascript">
	$(document).ready(function(){
		$("#sizePerPage").bind("change",function(){
			/* var val = $(this).val();
			alert(""); */
			var frm = document.memberFrm;
			frm.method = "GET"; 
			//보안성이 필요하지 않으므로 Get방식이지만 유저가 '?'뒤의 값을 존재하지 않는 임의의값으로 장난을치더라도 기본값이되도록 막아주어야한다.
			frm.action = "memberList.jsp";
			frm.submit();
		});
		<%--console.log(<%=totalPage%>);
		var sizePerPage = <%=sizePerPage %>;
		console.log(sizePerPage); --%>
		$("#sizePerPage").val(<%= sizePerPage %>);
		$("#period").bind("change",function(){
			var frm = document.memberFrm;
			frm.method = "GET"; 
			frm.action = "memberList.jsp";
			frm.submit();
		});
		
		$("#period").val("<%= period %>");
		$("#searchType").val("<%= searchType %>");
		$("#searchWord").val("<%= searchWord %>");
		$("#deletebtn").click(function(){
			var con = confirm("정말 삭제 하시겠습니까?");
			if(con){
				deleteFrm.action="/MyWeb/MemberServlet.java";
				deleteFrm.submit();
			}
		});
	});
	
	// 회원수정버튼 
    function modifyInfo(idx){
    	// 팝업창 띄우기
		var url = "modifyMemberInfo.jsp?idx="+idx;
		window.open(url, "회원 정보 수정", "left=200px, top=100px, width=1600px, height=800px;" );
		// 기본적으로 아무런 조건 없이 그냥 어떤 창을 띄우면 method는 GET방식으로 움직인다.
    }
	function goSearch(){
		var searchWord = $("#searchWord").val().trim();
		if(searchWord==""){
			alert("검색어를 입력하세요");
			return;
		}
		else{
			var frm = document.memberFrm;
			frm.method = "GET"; 
			frm.action = "memberList.jsp";
			frm.submit();
		}
	}
</script>
<style type="text/css">
	.th {text-align:center;}
	.td {text-align:center;}
	.namestyle{background-color:lightgray}
	button{
		cursor: pointer;
		border:none;}
</style>
<div class=row>
	<div class="cd-md-12">
		<h2>::: 회원전체 정보보기 :::</h2>
		<form name="memberFrm">
			<div style="margin:30px;">
				<select id="searchType" name="searchType" style="margin-right:10px;" >
					<option value="name">회원명</option>
					<option value="userid">아이디</option>
					<option value="email">이메일</option>
				</select>
				<input type="text" id="searchWord" name="searchWord" size="25" class="box" style="margin-right:10px;"/>
				<button type="button" onclick="goSearch();">검색</button>
			</div>
			<div>
				<div style="display: inline;margin-right:30px;">
					<span style="color: red;font-weight:bold">페이지당 회원명수</span>
					<select id="sizePerPage" name="sizePerPage">
						<option value="10">10</option>
						<option value="5">5</option>
						<option value="3">3</option>
					</select>
				</div>
				<div style="display: inline;">
					<select id="period" name="period">
						<option value="-1">전체</option>
						<option value="3">최근 3일이내</option>
						<option value="10">최근 10일이내</option>
						<option value="30">최근 30일이내</option>
						<option value="60">최근 60일이내</option>
					</select>
				</div>
			</div>
		</form>
		<table class="outline">
			<thead>
				<tr>
					<th class="th">회원번호</th>
					<th class="th">회원명</th>
					<th class="th">아이디</th>
					<th class="th">이메일</th>
					<th class="th">휴대폰</th>
					<th class="th">가입일자</th>
					<th class="th">수정 | 삭제</th>
				</tr>
			</thead>
			<tbody>
			<% 
			if(memberList!=null) {
				for(MemberVO mvo : memberList){
				%>
				<tr>
					<form name="deleteFrm" method = "POST" />
						<input type="hidden" id="deleteIdx" name="deleteIdx" value="<%=mvo.getIdx() %>"/>
						<td class="td"><%=mvo.getIdx() %></td>
						<td class="td name"><a href="memberDetail.jsp?idx=<%=mvo.getIdx() %>"><%=mvo.getName() %></a></td>
						<td class="td"><%=mvo.getUserid() %></td>
						<td class="td"><%=mvo.getEmail() %></td>
						<td class="td"><%=mvo.getHp1()+"-"+mvo.getHp2()+"-"+mvo.getHp3() %></td>
						<td class="td"><%=mvo.getRegisterday() %></td>
						<td class="td"><button type="button" onClick="modifyInfo('<%= mvo.getIdx() %>');">수정</button>&nbsp;|<button type="button" id="deletebtn">삭제</button></td>
					</form>
				</tr>	
				<%
				}
			}
			else{
			%>
				<tr>
					<td colspan="7">가입된 정보가 없습니다.</td>
				</tr>
			<%}%>
			</tbody>
			<thead> <!-- 페이지바 만들기 -->
				<tr>
					<th colspan="5" class="th">
					<% 
						int blockSize = 10; // 1개 블럭당 보여줄 페이지 번호의 갯수
						int loop = 1; // 1부터증가하여 1개 블럭을 이루는 페이지 번호의 갯수(지금은 10개)
						int pageNo = ((currentShowPageNo-1)/blockSize) * blockSize+1;
					//이전만들기
						if(pageNo!=1){
					%>
					<a href="memberList.jsp?sizePerPage=<%=sizePerPage %>&currentShowPageNo=<%=pageNo-1 %>&searchType=<%=searchType %>&searchWord=<%=searchWord %>&period=<%=period %>">[이전]&nbsp;</a>
					<%}
						while(!(pageNo>totalPage||loop>blockSize)){
							if(pageNo==currentShowPageNo){%>
							<span style="color:red;text-decoration:underline;font-weight:bold;"><%=pageNo %></span>&nbsp;
							<%} 
							else{%>
							<a href="memberList.jsp?sizePerPage=<%=sizePerPage %>&currentShowPageNo=<%=pageNo %>&searchType=<%=searchType %>&searchWord=<%=searchWord %>&period=<%=period %>" ><%=pageNo %>&nbsp;</a>
							<%}pageNo++;
							loop++;
						}
						//다음만들기
						if(!(pageNo>totalPage)){
					%>
					<a href="memberList.jsp?sizePerPage=<%=sizePerPage %>&currentShowPageNo=<%=pageNo %>&searchType=<%=searchType %>&searchWord=<%=searchWord %>&period=<%=period %>">[다음]</a>
					<%}%>
					</th>
					<th colspan="2" class="th"> 
						현재 [<%=currentShowPageNo %>]페이지 / 총 [<%=totalPage %>]페이지
						회원수 : 총 <%=totalMemberCount %>
					</th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<jsp:include page="../footer.jsp" />