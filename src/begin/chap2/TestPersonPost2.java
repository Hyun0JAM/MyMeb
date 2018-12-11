package begin.chap2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestPersonPost2
 */
@WebServlet("/TestPersonPost2")
public class TestPersonPost2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestPersonPost2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		/*
		   POST 방식으로 넘겨온 데이터를 처리해주는 메소드가  
		   doPost(request, response) 인데 넘겨받은 데이터가 한글일 경우
		     아래와 같이 해주어야만 한글이 안깨지고 잘 나온다.
		     중요한 것은 request.getParameter("name"); 이러한 명령보다
		     먼저 기술을 해야 한다는 것이다.*/
		  request.setCharacterEncoding("UTF-8");  
		
		  String name = request.getParameter("name");
	      String color = request.getParameter("color");
	      String[] foodArr = request.getParameterValues("food"); // 스트링타입의 배열을 반환한다.
	      String animal = request.getParameter("animal");
	      

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
	
}
