<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 표준 액션중 forward에대해서 알아봅니다.</title>

<script type="text/javascript">

function goSubmit() {
	var frm = document.myFrm;
	// frm.method = "GET"; 기본 method는 "GET"이다.
	frm.action = "3fowardCalc.jsp";//동일한 경로
	frm.submit();
	
}

</script>
</head>
<body>
	<h2>입력한 두개의 수 사이를 누적한 값 알아오기</h2>
	<form name="myFrm">
	<pre>
		첫번째 수 : <input type="text" name="firstNum"  id = "firstNum">
		두번째 수 : <input type="text" name="lastNum" id = "lastNum">
		<button type="button" onClick ="goSubmit();">계산하기</button>
	</pre>
	</form> 
</body>
</html>