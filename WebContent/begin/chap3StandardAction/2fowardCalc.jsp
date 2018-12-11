<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String firstStr = request.getParameter("firstNum");
   String lastStr = request.getParameter("lastNum");
   
   int firstNum = Integer.parseInt(firstStr);
   int lastNum = Integer.parseInt(lastStr);
   
   int sum=0;
   for(int i=firstNum; i<=lastNum; i++){
	   sum +=i;
   }
   
   /* request 내장객체는 클라이언트가(2forwardTest) 보내온 폼에 있는 값을 
	    읽어오는 역할도 있고(request.getParameter()) 
	    저장소 기능을 하는 역할도 있다.(request.setAttribute("키", 객체))
		   
	  request.setAttribute("키", 객체)은 객체를 request 영역에 "키"로 저장하겠다는 말이다.
   */
	
   //request.setAttribute("sum", new Integer(sum));
   // 또는 아래와 같이 사용한다. 왜냐하면 자바가 알아서 auto boxing 해주기 때문이다.
   request.setAttribute("sum", sum);
%>


<!-- request.setAttribute("sum", sum);의 값을 2forwardResultView.jsp여기로 넘겨주겠다, 이 페이지에서 사용하겠다.-->
<jsp:forward page="2forwardResultView.jsp"/> 