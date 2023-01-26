<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>매인페이지</title>
</head>
<body>

	<h3>Index.jsp</h3>
	<ul>
		<li>view : view 들을 모아놓은 폴더. 
					jsp파일들은 사용자에게 보여지는 화면을 구현하는 코드들이기 때문에 view에 해당한다.</li>
	</ul>

	<p>그니까 오늘 배운 건 순서가 web.xml에 등록한 MainServlet (url패턴이 /main/*) 을 기본주소/main/asdfgdasg 로 접속하면 MainServlet에서 자바처리를 마친 req와 resp가 여기로 와서 index.jsp화면이 보여지는 거겠지)</p>
	<p>http://localhost:8888/chap03/main/asdf로 MainServlet 서블릿 갔다가 여기로 오는 거!</p>

</body>
</html>