package chap03.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class InitParamTestServlet extends HttpServlet {

	
	//init() : 이 서블릿이 최초로 초기화될 때 실행되는 메서드 (서버 켜질 떄 한번 실행되고 말 것임)
	@Override
	public void init(ServletConfig config) throws ServletException {
		//지역 초기화 팦라미터는 ServletConfig내부에 들어 있다.
		//주로 해당 서블릿의 초기화에 이용되는 값들이다. 
		System.out.println(config.getInitParameter("user"));
		System.out.println(config.getInitParameter("password"));
		//서버를 재시작 했을 땐 안 나옴. 근데 우리가 여기에 최초로 접속했을 떄 나옴
		//http://localhost:8888/chap03/init 로 접속하면 콘솔에 출력됨 
		 
	}	
	
	
	 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//전역 초기화 파라미터는 어플리케이션 객체 내부에 들어 있다.
		//주로 (프로그램에서 인데 프로그램이란 말 요즘 잘 안 씀)웹애플리케이션 전체에서 영향을 미치는 값들이 들어 있다.
		ServletContext application = req.getServletContext();
		
		System.out.println(application.getInitParameter("pub_date"));
		System.out.println(application.getInitParameter("developer"));
		
		//전역파라미터로는 서블릿 컨피그에 있는 파라미터를 볼 수 없음
		System.out.println(application.getInitParameter("user"));
		System.out.println(application.getInitParameter("password"));
		
	}

}
