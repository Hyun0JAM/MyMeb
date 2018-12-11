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
		// ----- 필수암기
		RequestDispatcher dispatcher = request.getRequestDispatcher("/begin/chap3StandardAction/7UseBeanForm1Result.jsp"); // 넘겨줄 JSP파일-->뷰딴?
		// 확장자가 JAVA일 경우 / 앞에 프로젝트명이 생략되어있는것과 같으므로 프로젝트명은 생략 해주어야 한다.
		dispatcher.forward(request, response);
	}
}
