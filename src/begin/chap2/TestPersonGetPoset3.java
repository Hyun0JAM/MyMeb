package begin.chap2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestPersonGetPoset3
 */
@WebServlet("/3testPersonGetPost.do")
public class TestPersonGetPoset3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request,response);
	}
	// web.xml에 따로 기술 할 필요가 없고 GET/POST방식 둘다 상관없다
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
		String method = request.getMethod();
		
		  String name = request.getParameter("name");
	      String color = request.getParameter("color");
	      String[] foodArr = request.getParameterValues("food"); // 스트링타입의 배열을 반환한다.
	      String animal = request.getParameter("animal");
	      

	      response.setContentType("text/html; charset=UTF-8");
	      PrintWriter out = response.getWriter(); // 웹브라우저에 써주는(기재하는) 객체
	      out.println("<html>");
	      out.println("<head><title>개인 성향 테스트 결과화면</title></head>");
	      out.println("<body>");
	      out.printf("<h1>%s</h1>",method);
	      out.println("<h2>개인 성향 테스트 결과</h2>");
	      out.printf("<span style='color:green; font-weight:bold;'>%s</span>님의 개인 성향은 <br/><br/>",name);
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
