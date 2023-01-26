package chap03.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EncodingTestServlet
 */
@WebServlet(description = "한글 인코딩 테스트를 해보는 서블릿 입니다.", 
	urlPatterns = { "/encodingTest" }) //urlPattern's' 라는 걸 보아 여러개의 url을 하나의 서블렛으로 매핑하는 것도 가능하것지
public class EncodingTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	
	/*
	
	GET방식 요청은 URL 뒤에 데이터가 추가되어 도착한다. 
	URL의 해석은 Tomcat이 담당하기 때문에 URL 뒤에 추가된 데이터를 올바른 인코딩 타입으로 해석하기 위해서는 Tomcat의 설정(server.xml)을 변경해야 한다.

	(포트번호 설정하는 곳(63번째 줄)에 URIEncoding="EUC-KR"추가)
	<Connector connectionTimeout="20000" port="8888" protocol="HTTP/1.1" redirectPort="8443" URIEncoding="EUC-KR"/> 
	*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//ContextPath : 우리 프로젝트의 최상위 URL(chap03). add and remove를 할 때 server.xml(Servers에 server.xml)에 자동으로 등록된다. 
		System.out.println("ContextPath : " + request.getContextPath());
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("subject: " + request.getParameter("subject"));
		
		
	}

	/*
	 POST방식 요청은 데이터가 request 내부(body)에 실려 도착하기 때문에 데이터를 꺼내기 전에 
	 request객체에 알맞은 인코딩 타입을 지정해주면 올바르게 디코딩할 수 있다. 
	 
	 request.setCharacterEncoding("EUC-KR");
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		doGet(request, response);//doGet을 호출해주니까 System.out.println("ContextPath : " + request.getContextPath());랑 System.out.println("subject: " + request.getParameter("subject")); 또 써줄 필요 없음
		
	}

}
