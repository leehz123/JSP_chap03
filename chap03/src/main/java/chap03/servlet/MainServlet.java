package chap03.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MainServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("user uri : " + req.getRequestURI()); //user uri : /chap03/main/asdf
		//이 uri를 보고 어느 view 로 forward할 지 정할 수 있음.
		
		//req.getRequestURL();		
		
		String uri = req.getRequestURI();
		String path = null;
		
		//여기서 더 업그레이드 하면 어차피 이 서블릿에 들어온다는 것은 /chap03/main/ 이부분은 일치한다는 거기 때문에 이거 지우고 /jstl만 써도 됨
		switch(uri) {
		case "/chap03/main/jstl":
			path= "/WEB-INF/views/jstl.jsp";
			break;
		case "/chap03/main/el": //chap03/main 지워도 제대로 동작함 엥 왜 난 안 되지;;;;
			path= "/WEB-INF/views/el.jsp";
			break;
		default: //case "chap03/main";
			path = "/WEB-INF/views/index.jsp";
			break;
		}
		
		req.getRequestDispatcher(path).forward(req, resp);
	}
	
}
