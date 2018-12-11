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
		   POST ������� �Ѱܿ� �����͸� ó�����ִ� �޼ҵ尡  
		   doPost(request, response) �ε� �Ѱܹ��� �����Ͱ� �ѱ��� ���
		     �Ʒ��� ���� ���־�߸� �ѱ��� �ȱ����� �� ���´�.
		     �߿��� ���� request.getParameter("name"); �̷��� ��ɺ���
		     ���� ����� �ؾ� �Ѵٴ� ���̴�.*/
		  request.setCharacterEncoding("UTF-8");  
		
		  String name = request.getParameter("name");
	      String color = request.getParameter("color");
	      String[] foodArr = request.getParameterValues("food"); // ��Ʈ��Ÿ���� �迭�� ��ȯ�Ѵ�.
	      String animal = request.getParameter("animal");
	      

	      response.setContentType("text/html; charset=UTF-8");
	      PrintWriter out = response.getWriter(); // ���������� ���ִ�(�����ϴ�) ��ü
	      out.println("<html>");
	      out.println("<head><title>���� ���� �׽�Ʈ ���ȭ��</title></head>");
	      out.println("<body>");
	      out.println("<h2>���� ���� �׽�Ʈ ���</h2>");
	      out.printf("<span style='color:blue; font-weight:bold;'>%s</span>���� ���� ������ <br/><br/>",name);
	      out.printf("%s���� �����ϰ� %s�� �����մϴ�.<br/><br/>",color,animal);
	      if(foodArr!=null) {
	    	  out.print("�����ϴ� ������ ");
	    	  for(int i=0;i<foodArr.length;i++) {
	    		  String comma = (i<foodArr.length)?",":" ";
	        	  out.printf("%s %s",foodArr[i],comma);
	    	  }
	    	  out.print("�Դϴ�.");
	      }
	      else out.println("�����ϴ� ������ �����ϴ�.");
	      out.println("</body>");
	      out.println("</html>");
	}
	
}
