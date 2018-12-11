<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String method = request.getMethod();
	String ctxPath = request.getContextPath();
%>
<jsp:useBean id="memberdao" class="member.model.MemberDAO" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복 ID 검사하기</title>
<link rel="stylesheet" type="text/css" href="/MyWeb/css/style.css" />
<script type="text/javascript" src="/MyWeb/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#error").hide();
});
	function goCheck(){
		var userid = $("#userid").val().trim();
		if(userid==""){
			$("#error").show();
			$("#userid").val("");
			$("#userid").focus();
			return;
		}
		else {
			$("#error").hide();
			var frm = document.frmIdcheck;
			frm.method="POST";
			frm.action="idcheck.jsp";
			frm.submit();
		}
	}
	/* function setUserID(userid){//팝업창에서 부모창으로 값넘기기 일반적인 방법
		var openerfrm = opener.document.registerFrm; //opener은 팝업창을 열게한 부모창을 말한다.
		//여기서 부모창은 바로 memberform.jsp페이지 이다.
		openerfrm.userid.value = userid;
		openerfrm.pwd.focus();
		self.close(); // 여기서 self는 팝업창 자기자신을 말한다. 지금의 self는 idcheck.jsp페이지 이다.
	} */
	function setUserID(userid){ //팝업창에서 부모창으로 값넘기기 Jquery를 사용한 방법
		/* $("#userid",openner.document).val(userid); // openner.document,를 쓰면 부모창의 id값이 userid인 곳의 값을 userid값을 넣어주는것  또는*/
		$(opener.document).find("#userid").val(userid);
		$("#pwd",opener.document).focus();
		self.close();
	}
</script>
</head>
<body>
	<span style="font-size: 10pt; font-weight: bold;"><%= method %></span>   
   	<%
      if("GET".equalsIgnoreCase(method)){// equalsIgnoreCase 대소문자 구분안함
         // 전송방식이 GET이라면 ID중복검사를 하기 위한 폼을 띄워주어야 한다.
   	%>      
    <form name="frmIdcheck">
    	<table style="width: 95%; height: 100px;">
	  		<tr>
	    		<td style="text-align:center">
	    			아이디를 입력하세요<br style="line-height:300%"/>
		        	<input type="text" id="userid" name="userid" size="20" /><br/>
		            <span id="error" style="color: red; font-size: 12pt; font-weight: bold;">아이디를 입력하세요!!!</span><br/>
		            <!-- 확인버튼을 누르면 input태그의 name  -->
		            <button type="button" onClick="goCheck();" style="border:none; padding: 5px 10px;">확인</button>
	            </td>
	        </tr>
        </table>
    </form>
    <%}
    else{// POST방식일때  전송방식이 POST이라면 DB에 가서 ID중복검사를 해와야한다. 
    	String userid = request.getParameter("userid");
        boolean isUSEuserid = memberdao.idDuplicateCheck(userid);//userid 가 중복이라면 false리턴, 중복이 아니라면 true리턴
        if(isUSEuserid){// userid가 중복이 아니라면 사용가능한 아이디라고 알려줘야한다.
    %>
    <div align="center">
    	<br style="line-height: 350%;"/>
    	ID로[<span style="color: red; font-weight: bold;"><%= userid %></span>]은 사용가능합니다.
        <br/><br/><br/>
        <button type="button" onClick="setUserID('<%= userid %>');">닫기</button>
    </div>
    <% }
    else{%>
    	<!-- userid가 중복이므로 사용불가한 아이디라고 알려줘야한다. -->
    	<div align="center">
    		<br style="line-height: 350%;"/>
	     	ID로[<span style="color: red; font-weight: bold;"><%= userid %></span>]는 이미 사용중 입니다.
	        <br/>
	        <form name="frmIdcheck">
		    	<table style="width: 95%; height: 100px;">
			  		<tr>
			    		<td style="text-align:center">
			    			아이디를 입력하세요<br style="line-height:300%"/>
				        	<input type="text" id="userid" name="userid" size="20" /><br/>
				            <span id="error" style="color: red; font-size: 12pt; font-weight: bold;">아이디를 입력하세요!!!</span><br/>
				            <!-- 확인버튼을 누르면 input태그의 name  -->
				            <button type="button" onClick="goCheck();" style="border:none">확인</button>
			            </td>
			        </tr>
		        </table>
		    </form>
    	</div>
    <%}
    }
  	%>
</body>
</html>