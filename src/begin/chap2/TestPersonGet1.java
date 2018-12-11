package begin.chap2;

import java.io.*;
import javax.servlet.http.*;
/*
   Servlet �� ������ ����� ���ִ� �ڹ��� Ŭ������ ���ϴµ�
   Servlet �� �Ǳ� ���� ����������  
      1). ����(Servlet) Ŭ������ �ݵ��
         javax.servlet.http.HttpServlet Ŭ������ �θ� Ŭ������ ����� �޾ƾ� �Ѵ�.
*/

public class TestPersonGet1 extends HttpServlet{

   private static final long serialVersionUID = 3609578930915147102L;
   
   /*
      2).��Ŭ���̾�Ʈ�� ��û ����� GET ������� ��û�� �ؿ��� 
          doGet() �޼ҵ�� ������ ���ֵ��� �ڵ��� �ؾ� �ϰ�,
            ��Ŭ���̾�Ʈ�� ��û ����� POST ������� ��û�� �ؿ��� 
          doPost() �޼ҵ�� ������ ���ֵ��� �ڵ��� ���־�� �Ѵ�.
                 �׷��Ƿ� �ݵ�� doGet() �޼ҵ�� doPost() �޼ҵ带 
          Overriding(������)�� ���־�� �Ѵ�.
          
          doGet()�޼ҵ�� doPost()�޼ҵ��� 
            ù��° �Ķ���ʹ� HttpServletRequest Ÿ���̰�,
            �ι�° �Ķ���ʹ� HttpServletResponse Ÿ���̴�.
   */
   @Override
   public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
      System.out.println("==> Ȯ�ο�: ����� doGet(request, response) �Դϴ�.");
      String name = request.getParameter("name");
      String color = request.getParameter("color");
      String[] foodArr = request.getParameterValues("food"); // ��Ʈ��Ÿ���� �迭�� ��ȯ�Ѵ�.
      String animal = request.getParameter("animal");

      /*System.out.println(name);
      System.out.println(color);
      for(int i=0;i<foodArr.length;i++) {
    	  String comma = (i<foodArr.length)?",":" ";
    	  System.out.print(foodArr[i]+comma);
      }
      System.out.println(animal);*/
      
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
   /* ù��° �Ķ������ HttpServletRequest request ��
   ������������ ����ڰ� ��û�� ����(������)�� �޾��ִ� �뵵�� ���δ�.s
  
   �ι�° �Ķ������ HttpServletResponse response ��  
   ù��° �Ķ������ HttpServletRequest request �� �޾ƿͼ� 
   ó���� ���� ������� �������� ����ڿ��� �����ֱ� ���� �뵵�� ����Ѵ�.     
*/
   @Override
   public void doPost(HttpServletRequest request, HttpServletResponse responese) throws IOException {
      System.out.println("==> Ȯ�ο�: ����� doPost(request, response) �Դϴ�.");
   }

}