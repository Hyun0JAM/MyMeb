package begin.chap2;

import java.io.*;
import javax.servlet.http.*;
/*
   Servlet 은 웹서비스 기능을 해주는 자바의 클래스를 말하는데
   Servlet 이 되기 위한 전제조건은  
      1). 서블릿(Servlet) 클래스는 반드시
         javax.servlet.http.HttpServlet 클래스를 부모 클래스로 상속을 받아야 한다.
*/

public class TestPersonGet1 extends HttpServlet{

   private static final long serialVersionUID = 3609578930915147102L;
   
   /*
      2).웹클라이언트의 요청 방식이 GET 방식으로 요청을 해오면 
          doGet() 메소드로 응답을 해주도록 코딩을 해야 하고,
            웹클라이언트의 요청 방식이 POST 방식으로 요청을 해오면 
          doPost() 메소드로 응답을 해주도록 코딩을 해주어야 한다.
                 그러므로 반드시 doGet() 메소드와 doPost() 메소드를 
          Overriding(재정의)를 해주어야 한다.
          
          doGet()메소드와 doPost()메소드의 
            첫번째 파라미터는 HttpServletRequest 타입이고,
            두번째 파라미터는 HttpServletResponse 타입이다.
   */
   @Override
   public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
      System.out.println("==> 확인용: 여기는 doGet(request, response) 입니다.");
      String name = request.getParameter("name");
      String color = request.getParameter("color");
      String[] foodArr = request.getParameterValues("food"); // 스트링타입의 배열을 반환한다.
      String animal = request.getParameter("animal");

      /*System.out.println(name);
      System.out.println(color);
      for(int i=0;i<foodArr.length;i++) {
    	  String comma = (i<foodArr.length)?",":" ";
    	  System.out.print(foodArr[i]+comma);
      }
      System.out.println(animal);*/
      
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter(); // 웹브라우저에 써주는(기재하는) 객체
      out.println("<html>");
      out.println("<head><title>개인 성향 테스트 결과화면</title></head>");
      out.println("<body>");
      out.println("<h2>개인 성향 테스트 결과</h2>");
      out.printf("<span style='color:blue; font-weight:bold;'>%s</span>님의 개인 성향은 <br/><br/>",name);
      out.printf("%s색을 좋아하고 %s를 좋아합니다.<br/><br/>",color,animal);
      if(foodArr!=null) {
    	  out.print("좋아하는 음식은 ");
    	  for(int i=0;i<foodArr.length;i++) {
    		  String comma = (i<foodArr.length)?",":" ";
        	  out.printf("%s %s",foodArr[i],comma);
    	  }
    	  out.print("입니다.");
      }
      else out.println("좋아하는 음식은 없습니다.");
      out.println("</body>");
      out.println("</html>");
      
   }
   /* 첫번째 파라미터인 HttpServletRequest request 은
   웹브라우저에서 사용자가 요청한 내용(데이터)을 받아주는 용도로 쓰인다.s
  
   두번째 파라미터인 HttpServletResponse response 은  
   첫번째 파라미터인 HttpServletRequest request 가 받아와서 
   처리한 최종 결과물을 웹브라우저 사용자에게 보여주기 위한 용도로 사용한다.     
*/
   @Override
   public void doPost(HttpServletRequest request, HttpServletResponse responese) throws IOException {
      System.out.println("==> 확인용: 여기는 doPost(request, response) 입니다.");
   }

}