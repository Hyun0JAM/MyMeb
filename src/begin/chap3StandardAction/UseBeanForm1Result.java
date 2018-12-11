package begin.chap3StandardAction;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class UseBeanForm1Result extends HttpServlet {
	private static final long serialVersionUID = -2179993809513624309L;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request,response);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request,response);
	}
	
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String jubun = request.getParameter("jubun");
		
		MemberDTO memberdto = new MemberDTO();
		memberdto.setName(name);
		memberdto.setJubun(jubun);
		
		request.setAttribute("memberdto", memberdto);
		// ----- �ʼ��ϱ�
		RequestDispatcher dispatcher = request.getRequestDispatcher("/begin/chap3StandardAction/7UseBeanForm1Result.jsp"); // �Ѱ��� JSP����-->���?
		// Ȯ���ڰ� JAVA�� ��� / �տ� ������Ʈ���� �����Ǿ��ִ°Ͱ� �����Ƿ� ������Ʈ���� ���� ���־�� �Ѵ�.
		dispatcher.forward(request, response);
	}
}
