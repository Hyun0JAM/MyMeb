<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, member.model.* " %>
<jsp:useBean id="memberdao" class="member.model.MemberDAO" scope="application" />
<jsp:useBean id="membervo" class="member.model.MemberVO"/>
<jsp:setProperty property="*" name="membervo"  />
<%-- JAVA CODE --%>
<%
	String str_idx = request.getParameter("idx");
	int idx = Integer.parseInt(str_idx);
	
	membervo = memberdao.getByIdx(idx);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>회원 정보 수정</title>
		
		<!-- Link CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="../css/style.css" />
		<style type="text/css">
			td > span.error,
			td > span#error_passwd{
				font-size:10pt !important;
			}
		</style>
		
		<!-- Link JS -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script type="text/javascript">
			// jQuery
			$(document).ready(function(){
				// 에러메시지 숨기기
				$(".error").hide(); 
				$("#error_passwd").hide();
				// 아이디 input 잠금
				$(":input[id=userid]").attr("disabled",true);
				
				
				// 비밀번호 입력 시 
				$("#pwd").blur(function(){
					var passwd = $(this).val();
					
					var regExp_PW = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;
					// var regExp_PW = new regExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g); 와 같은 것
					// 숫자/문자/특수문자/ 포함 형태의 8~15자리 이내의 암호 정규식 2
					
					var bool = regExp_PW.test(passwd);
					
					if(!bool){
						$("#error_passwd").show();
						$(this).focus();
					}else{
						$("#error_passwd").hide();
						$("#pwdcheck").focus();
					}
				});
				
				// 비밀번호 확인 
				$("#pwdcheck").blur(function(){
					var passwd = $("#pwd").val();
					var passwdCheck = $(this).val();
					
					if(passwd != passwdCheck){
						$(this).parent().find(".error").show();
						$("#pwd").focus();
					}else{
						$(this).parent().find(".error").hide();
					}
					
				}); // end of #pwdcheck.blur- function
				
				// 이메일 입력
				$("#email").blur(function(){
					var email = $(this).val();
					
					var regExp_EMAIL = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
					var bool = regExp_EMAIL.test(email);
					if(!bool){
						$(this).parent().find(".error").show();
						$(this).focus();
					}else{
						$(this).parent().find(".error").hide();
					}
				});// end of #email.blur - function;
				
				// 핸드폰 가운데 자리
				$("#hp2").blur(function(){
					var hp2 = $(this).val();
					
					var bool1 = false;
					
					var regExp_HP2a = /[1-9][0-9][0-9]/g;
					// 세글자가 숫자라면 들어오도록 검사해주는 정규표현식
					
					var bool1 =  (hp2.length == 3) && regExp_HP2a.test(hp2) ;
					
					var regExp_HP2b = /[1-9][0-9][0-9][0-9]/g;
					var bool2 = (hp2.length == 4) && regExp_HP2b.test(hp2);
					
					if(!(bool1 || bool2)){
						$(this).parent().find(".error").show();
						$(this).focus();
					}else{
						$(this).parent().find(".error").hide();
					}
								
				});
				
				// 핸드폰 끝자리
				$("#hp3").blur(function(){
					var hp3 = $(this).val();
					
					var regExp_HP3 = /\d{4}/g;
					// 숫자 3자리 또는 숫자 4자리만 들어오도록 검사해주는 정규표현식
					
					var bool = regExp_HP3.test(hp3);
					
					if(!bool){
						$(this).parent().find(".error").show();
						$(this).focus();
					}else{
						$(this).parent().find(".error").hide();
					}
				});
				
				// 우편번호 입력
				$("#zipcodeSearch").click(function(){  
		            new daum.Postcode({
		               oncomplete: function(data) {
		                   $("#post1").val(data.postcode1);  // 우편번호의 첫번째 값     예> 151
		                   $("#post2").val(data.postcode2);  // 우편번호의 두번째 값     예> 019
		                   $("#addr1").val(data.address);    // 큰주소                        예> 서울특별시 종로구 인사로 17 
		                   $("#addr2").focus();
		               }
		            }).open();
				});
				
				// 주소 입력
				$(".address").blur(function(){
					var address = $(this).val().trim();
					if(address == ""){
						$(this).parent().find(".error").show();
					}else{
						$(this).parent().find(".error").hide();
					} 
				}); 
				
				// 기존 회원의 정보를 input에 넣기
				$("#name").val("<%= membervo.getName() %>");
				$("#userid").val("<%= membervo.getUserid() %>");
				$("#hp2").val("<%= membervo.getHp2() %>");
				$("#hp3").val("<%= membervo.getHp3() %>");
				$("#email").val("<%= membervo.getEmail() %>");
				$("#post1").val("<%= membervo.getPost1() %>");
				$("#post2").val("<%= membervo.getPost2() %>");
				$("#addr1").val("<%= membervo.getAddr1() %>");
				$("#addr2").val("<%= membervo.getAddr2() %>");
				$("#birthyyyy").val("<%= membervo.getBirthyyyy() %>");
				$("#birthmm").val("<%= membervo.getBirthmm() %>");
				$("#birthdd").val("<%= membervo.getBirthdd() %>");			
			});
			// JavaScript
			function modifyInfoes(){
				var con = confirm("수정하시겠습니까?");
				
				if(con){	
					var frm = document.modifyFrm;
					frm.method="POST";
					frm.action="memberUpdate.jsp";
					frm.submit();
			   	self.close();
				}else{
					history.back();
					alert("취소를 눌렀습니다."); 
				}
			}		
			
		</script>
	</head>
	<body> 
		<div align="center">
			<form name="modifyFrm">
				<h3>::: 회원 정보 수정 (<span style="font-size: 10pt; font-style: italic;"><span class="star">*</span>표시는 필수입력사항</span>) :::</h3>
				<table id="tblMemberRegister">
					<tbody>
					<tr>
						<td style="width: 20%; font-weight: bold;">성명&nbsp;<span class="star">*</span></td>
						<td style="width: 80%; text-align: left;">
						    <input type="text" name="name" id="name" class="requiredInfo" required /> 
							<span class="error">성명은 필수입력 사항입니다.</span>
						</td>
					</tr>
					<tr>
						<td style="width: 20%; font-weight: bold;">아이디&nbsp;<span class="star">*</span></td>
						<td style="width: 80%; text-align: left;">
						    <input type="text" name="userid" id="userid" class="requiredInfo" required />&nbsp;&nbsp;
						    <span class="error">아이디는 변경불가 사항입니다.</span>
						</td> 
					</tr>
					<tr>
						<td style="width: 20%; font-weight: bold;">비밀번호&nbsp;<span class="star">*</span></td>
						<td style="width: 80%; text-align: left;"><input type="password" name="pwd" id="pwd" class="requiredInfo" required />
							<span style="font-size:10pt;">비밀번호는 변경을 안하더라도 다시 입력하세요.</span><br/>
							<span id="error_passwd">암호는 영문자,숫자,특수기호가 혼합된 8~15 글자로만 입력가능합니다.</span>
						</td>
					</tr>
					<tr>
						<td style="width: 20%; font-weight: bold;">비밀번호확인&nbsp;<span class="star">*</span></td>
						<td style="width: 80%; text-align: left;"><input type="password" id="pwdcheck" class="requiredInfo" required /> 
							<span class="error">암호가 일치하지 않습니다.</span>
						</td>
					</tr>
					<tr>
						<td style="width: 20%; font-weight: bold;">이메일&nbsp;<span class="star">*</span></td>
						<td style="width: 80%; text-align: left;"><input type="text" name="email" id="email" class="requiredInfo" placeholder="abc@def.com" /> 
						    <span class="error">이메일 형식에 맞지 않습니다.</span>
						</td>
					</tr>
					<tr>
						<td style="width: 20%; font-weight: bold;">연락처</td>
						<td style="width: 80%; text-align: left;">
						    <select name="hp1" id="hp1" style="width: 75px; padding: 8px;">
								<option value="010" selected>010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>&nbsp;-&nbsp;
						    <input type="text" name="hp2" id="hp2" size="6" maxlength="4" />&nbsp;-&nbsp;
						    <input type="text" name="hp3" id="hp3" size="6" maxlength="4" />
						    <span class="error error_hp">휴대폰 형식이 아닙니다.</span>
						</td>
					</tr>
					<tr>
						<td style="width: 20%; font-weight: bold;">우편번호</td>
						<td style="width: 80%; text-align: left;">
						   <input type="text" id="post1" name="post1" size="6" maxlength="3" />
						   &nbsp;-&nbsp;
						   <input type="text" id="post2" name="post2" size="6" maxlength="3" />&nbsp;&nbsp;
						   <!-- 우편번호 찾기 -->
						   <img id="zipcodeSearch" src="../images/b_zipcode.gif" style="vertical-align: middle;" />
						   <span class="error error_post">우편번호 형식이 아닙니다.</span>
						</td>
					</tr>
					<tr>
						<td style="width: 20%; font-weight: bold;">주소</td>
						<td style="width: 80%; text-align: left;">
						   <input type="text" id="addr1" name="addr1" class="address" size="60" maxlength="100" /><br style="line-height: 200%"/>
						   <input type="text" id="addr2" name="addr2" class="address" size="60" maxlength="100" />
						   <span class="error">주소를 입력하세요</span>
						</td>
					</tr>
					<tr>
						<td style="width: 20%; font-weight: bold;">생년월일</td>
						<td style="width: 80%; text-align: left;">
						   <input type="number" id="birthyyyy" name="birthyyyy" min="1950" max="2050" step="1" value="1995" style="width: 80px;" required />
						   
						   <select id="birthmm" name="birthmm" style="margin-left: 2%; width: 60px; padding: 8px;">
								<option value ="01">01</option>
								<option value ="02">02</option>
								<option value ="03">03</option>
								<option value ="04">04</option>
								<option value ="05">05</option>
								<option value ="06">06</option>
								<option value ="07">07</option>
								<option value ="08">08</option>
								<option value ="09">09</option>
								<option value ="10">10</option>
								<option value ="11">11</option>
								<option value ="12">12</option>
						   </select> 
						   <select id="birthdd" name="birthdd" style="margin-left: 2%; width: 60px; padding: 8px;">
								<option value ="01">01</option>
								<option value ="02">02</option>
								<option value ="03">03</option>
								<option value ="04">04</option>
								<option value ="05">05</option>
								<option value ="06">06</option>
								<option value ="07">07</option>
								<option value ="08">08</option>
								<option value ="09">09</option>
								<option value ="10">10</option>
								<option value ="11">11</option>
								<option value ="12">12</option>
								<option value ="13">13</option>
								<option value ="14">14</option>
								<option value ="15">15</option>
								<option value ="16">16</option>
								<option value ="17">17</option>
								<option value ="18">18</option>
								<option value ="19">19</option>
								<option value ="20">20</option>
								<option value ="21">21</option>
								<option value ="22">22</option>
								<option value ="23">23</option>
								<option value ="24">24</option>
								<option value ="25">25</option>
								<option value ="26">26</option>
								<option value ="27">27</option>
								<option value ="28">28</option>
								<option value ="29">29</option>
								<option value ="30">30</option>
								<option value ="31">31</option>
							</select> 
						</td>
					</tr>
					<tr>
						<td colspan="2" style="line-height: 40px; text-align:center;" >
							<button type="button" id="btnRegister" style="width:80px;" onClick="modifyInfoes();">수정</button>
							<button type="button" id="btnRegisterCancel" style="width:80px;" onClick="javascript:window.close();">취소</button> 
						</td>
					</tr>
					</tbody>
				</table>
			</form>
		</div>
	</body>
</html>