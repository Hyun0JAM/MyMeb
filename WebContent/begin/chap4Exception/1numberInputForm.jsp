<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 페이지에서 Exception 처리 방법 3가지</title>

<script type="text/javascript">
	function goSubmit(btn) {
		var frm;
		switch(btn) {
		   case 'btn1' :
			  frm = document.frm1;
			  frm.submit();
			  break;
		
		   case 'btn2' :
			  frm = document.frm2;
			  frm.submit();
			  break;
			  
		   case 'btn3' :
			  frm = document.frm3;
			  frm.submit();
			  break;
			  
		   default :
			 alert('해당되는 버튼이 없습니다.!!');
		     break;
		}
		
	}

</script>

</head>
<body>

	<h2> try ~ catch ==> RequestDispatcher 를 이용한 에러페이지 출력 </h2> <!-- 해커들이 오류페이지를 악용가능성 있으므로 오류페이지 편집 -->
	<form name="frm1" action="tryCatchRequestDispatcher.jsp" method="post">
	      num1 : <input type="text" name="num1" /><br/>
	      num2 : <input type="text" name="num2" /><br/>
	<button type="button" id="btn1" onClick="goSubmit('btn1');" >전송</button>      
	</form>
	
	<br/><br/><br/>
	
	<h2> JSP 페이지 directive(지시어)에서 errorPage 속성과 isErrorPage 속성을 이용한 에러페이지 출력방법, errorPage="error_ex02.jsp" 및 isErrorPage="true" 로 함.</h2>                
	<form name="frm2" action="directiveErrorPage.jsp" method="post">
	      num1 : <input type="text" name="num1" /><br/>
	      num2 : <input type="text" name="num2" /><br/>
	<button type="button" id="btn2" onClick="goSubmit('btn2');" >전송</button>      
	</form>

    <br/><br/><br/>
	
	<h2>web.xml 파일을 에러페이지 출력</h2>                
	<form name="frm3" action="webXml.jsp" method="post">
	      num1 : <input type="text" name="num1" /><br/>
	      num2 : <input type="text" name="num2" /><br/>
	<button type="button" id="btn3" onClick="goSubmit('btn3');" >전송</button>      
	</form>
</body>
</html>



