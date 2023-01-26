<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>인코딩 설정</title>
</head>
<body>
		
	<h3>JSP의 여러가지 charset 설정</h3>	
	
	
	<dl>
		<dt>1. meta태그의 charset</dt>
		<dd>클라이언트의 웹 브라우저가 해당 페이지를 해석할 때 사용할 charset</dd><!-- 웹브라우저엔 HTML 파일로 날라옴. HTML파일이기 이전에 0과 1이긴 함. -->
		<dt>2. pageEncoding의 charset</dt> <!-- 여기서 utf-8을 쓰면 .java로 변환하면서 utf-8을 쓴다는 것 -->
		<dd>JSP파일을 Servlet(.java)으로 변환할 때 사용하는 charset</dd>
		<dt>3. contentType의 charset</dt>
		<dd>서블릿으로 생성된 결과물(응답)의 charset을 의미한다.</dd>
	</dl>

	
	<h3># 서블릿으로 한글 데이터 보내보기(GET)</h3>
		<!-- 여기에 /chap03/ 대신 이렇게 해놓으면 server.xml에서 경로를 /chap003으로 바꿔도 자동으로 알아서 접속해주겠지  -->
		<form action="<%=request.getContextPath() %>/encodingTest" method="GET">
		<input type="radio" name="subject" value="국어" id="kor"/><label for="kor">국어</label>
		<input type="radio" name="subject" value="영어" id="eng"/><label for="eng">영어</label>
		<input type="radio" name="subject" value="수학" id="math"/><label for="math">수학</label>	
		<input type="submit" value="선택"/>
	</form>
	
	
		<h3># 서블릿으로 한글 데이터 보내보기(POST)</h3>
		<!-- 여기에 /chap03/ 대신 이렇게 해놓으면 server.xml에서 경로를 /chap003으로 바꿔도 자동으로 알아서 접속해주겠지  -->
		<form action="<%=request.getContextPath() %>/encodingTest" method="POST">
		<input type="radio" name="subject" value="국어" id="kor2"/><label for="kor2">국어</label>
		<input type="radio" name="subject" value="영어" id="eng2"/><label for="eng2">영어</label>
		<input type="radio" name="subject" value="수학" id="math2"/><label for="math2">수학</label>	
		<input type="submit" value="선택"/>
	</form>
		
</body>
</html>