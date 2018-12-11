<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" ></jsp:include>

<%-- <%
    String idx=(String)request.getAttribute("str_idx");
%>
 --%>

<div class ="row">
   <div class="col-md-12">
    <pre >

<%--        <span style="color: red;"> 
       <%= idx %></span>에 대한 검색결과가 없습니다
       정확한 검색어 인지 확인하시고 다시 검색해 주세요.
        --%>
       <span style="color: blue;">
       ${str_idx}</span>에 대한 검색결과가 없습니다
       정확한 검색어 인지 확인하시고 다시 검색해 주세요.
       <%-- ${str_idx} : 키값을 불러옴
       library 에 el .jar 파일이 있어야함 --%>
       
    
   </pre>
   </div>
</div>

<jsp:include page="../footer.jsp" ></jsp:include>
