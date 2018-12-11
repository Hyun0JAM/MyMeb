<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>1부터10까지합구하기</title>
</head>
<body>
	<% 
		//스크립틀릿
		//자바코드
		int sum=0;
		for(int i=1;i<=10;i++){
			sum+=i;
		}
	%>
	<%-- JSP주석 --%>
	<%-- 
	<% 로 시작하여 %> 로 끝나는 것을 "스크립틀릿" 이라고 부른다.
     "스크립틀릿" 에 자바 코딩이 들어가는 것이다.
         그런데 "스크립틀릿"에 코딩된 부분은 웹브라우저에서 소스보기를 하더라도
         안 보여지므로 보안성이 좋다. 
         
     <%=  %> 을 expression(표현식) 이라고 부른다.
         이 expression(표현식)은 "스크립틀릿에서 작성된 결과값" 을 
         웹브라우저상에 보여주고자 할때 사용하는 것이다.
         
     1oneToTenSum.jsp 라는 파일은 실제로는
         확장자 .java 파일로 저장되어서 컴파일 되어진 
         확장자 .class 파일로 저장되어지는데 
         어느 경로에 저장되어지는지 알아본다.  
         
     C:\myjsp\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\MyWeb\org\apache\jsp\begin\chap1\_1oneToTenSum_jsp.java 와  
     C:\myjsp\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\MyWeb\org\apache\jsp\begin\chap1\_1oneToTenSum_jsp.class 로 
         저장된다.    
         
         혹가다가   1oneToTenSum.jsp 라는 파일을 수정을 했지만 
         수정한대로 안 먹으면
     _1oneToTenSum_jsp.java 와 _1oneToTenSum_jsp.class 파일이
         잘못 꼬였기 때문이다.
         그래서  _1oneToTenSum_jsp.java 와 _1oneToTenSum_jsp.class 파일을
         삭제한후 1oneToTenSum.jsp 라는 파일을 수정하면 잘 될것이다.
	 --%>
	<div class="container">
	  <h2 class="text-info">1부터 10까지의 합은<span class="bg-danger"><%=sum %></span>입니다.</h2>
	  <p></p>            
	  <table class="table table-hover">
	    <thead>
	      <tr>
	        <th></th>
	        <th></th>
	        <th></th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
	        <td></td>
	        <td></td>
	        <td></td>
	      </tr>
	      <tr>
	        <td></td>
	        <td></td>
	        <td></td>
	      </tr>
	      <tr>
	        <td></td>
	        <td></td>
	        <td></td>
	      </tr>
	    </tbody>
	  </table>
	</div>
</body>
</html>