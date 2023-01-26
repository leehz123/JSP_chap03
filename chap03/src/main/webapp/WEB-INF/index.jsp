<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>WEB-INF index</title>
</head>
<body>


	<h3># WEB-INF 내부의 메인 페이지</h3>
	<p>안녕하세요</p>
	<!-- 이상태에서 실행해보니 404 Not Found가 나오고 있다. 경로가 맞는데 왜 안 보일까 -->
	<p>WEB-INF 폴더 내부의 자원들에는 URL을 통한 직접 접근이 불가능하다. 직접 접근을 막고 내가 설정해놓은 방식대로만 접근할 수 있게 하는 것</p>
	<p>그래서 http://localhost:8888/chap03/WEB-INF/index.jsp 로 접근하면 안 되고 ★★★★기본 주소인 http://localhost:8888/chap03/ 로 접근해야 한다★★★★ 그러면 web.xml파일의 welcome-file-list에 welcome-file로 추가해놓은 /WEB-INF/index.jsp 가 뜸</p>
	<p>하지만 forward 또는 include 등으로 접근해서 사용하는 것은 가능하다.</p>
	<p>사용자가 마음대로 웹페이지의 순서를 어기고 돌아다니는 것을 방지할 수 있다. 그래서 앞으로 모든 페이지는 WEB-INF 밑에 작성하게 됨</p>
</body>
</html>