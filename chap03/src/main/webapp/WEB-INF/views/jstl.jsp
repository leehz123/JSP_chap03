<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL</title>
</head>
<body>


	<h3># 외부 라이브러리 추가하는 순서</h3>
	<ol>
		<li>해당 프로젝트 우클릭 -> Build Path -> Configure Build Path... - Libraries </li>
		<li>Module path 에 Add External JARs</li>
		<li>원하는 라이브러리 찾아서 등록(우리는 jstl.jar인가 그거 받았으니까 그거 선택</li>
		
		<li>해당 프로젝트 우클릭 -> Properties </li>
		<li>Deployment Assembly -> Add</li>
	</ol>


	<h3># JSTL(JSP Standard Tag Library)</h3>
	
	<ul>
		<li>JSP파일에서 자바 코드를 손쉽게 사용하기 위한 커스텀 태그 라이브러리</li> 
		<li>자바의 몇 가지 핵심 기능을 태그 형태로 사용할 수 있다.</li>
		<li>주로 화면을 만들 때 유용한 기능들이 포함 돼 있다.</li>
		<li>JSP 파일 맨 위에 커스텀 태그를 추가한 뒤 사용해야 한다.</li>	
	</ul>
	
	<h3># JSTL Core</h3>
	<p>자바의 주요 핵심 문법들을 사용할 수 있는 커스텀 태그 라이브러리</p>
	<dl>
		<dt>c:set</dt>
		<dd>setAttribute를 편리하게 사용할 수 있다.</dd>	
		
		<dt>c:if</dt>
		<dd>자바의 if문을 편리하게 사용할 수 있다. (else, else if는 없다)</dd>
		
		<dt>c:choose, c:when, c:otherwise</dt>
		<dd>if, else if, else처럼 사용할 수 있는 조건문</dd>
		
		<dt>c:forEach</dt>
		<dd>순차적인 반복 처리</dd>
		<dt>c:forTokens</dt>
		<dd>하나의 긴 데이터를 자르면서 반복 처리 (자른 거 하나를 토큰이라고 하는 거고~)</dd>
		<dt>c:url</dt>
		<dd>Context Path를 포함한 URL을 자동으로 생성</dd>
	</dl>
	
		<p>이외에도 더 있는 필요할 때 찾아 쓰면 되고 구글링하다 만나면 아 이건 jstl이다 라고 판단이 들면 찾아보면 댐</p>
	<hr />
	
	
	
	
	<!-- 
	# c:set
	
	번거로운 setAttribute를 편리하게 사용할 수 있다. (쉽게 변수 설정 가능)
	-var : 애트리뷰트의 이름
	-value : 애트리뷰트의 값
	-scope : page/request/session/application (기본값 : page)	
	-->
	
	<c:set var="car" value="myCar" />
 	<c:set var="fruit" value="apple" scope="request" />

	<% request.setAttribute("fruit", "banana"); //위에 게 결국 이거임 이게 더 귀찮자나 %>
	
	${fruit } <!-- banana가 나올 것 -->


	page.car : ${pageScope.car },
	request.car : ${requestScope.car }


		
		
		
		
	<c:set var="animal" value="사슴"/> <!-- 커스텀 태그이기 때문에 value="null"이렇게 null을 직접적으로 지정해주는 것까지는 불가능. 값을 진짜 안 넣어주면 null이 되긴 함-->
	<c:if test="${animal!=null }"> <!-- null이면 값이 안 나오도록 -->
		<p>animal attribute에 들어 있던 값은 ${animal }입니다.</p>
	</c:if>
	
	
	<!-- jstl태그를 사용해야 하는 이유 내 티스토리 글 보기 ~~~~ -->
	<c:set var="tea" value="녹차" scope="application" />
	<c:if test="${tea!= null }"> 
		<p>${tea }입니다.</p>
	</c:if>
	
	


	
	<c:set var="num" value="75"/>
	
	<p>
	<c:choose>
		<c:when test="${num > 100 || num < 0}">
			유효하지 않은 점수입니다.
		</c:when>
		<c:when test="${num > 90 }">
			A등급입니다.
		</c:when>
		<c:when test="${num > 80 }">
			B등급입니다.
		</c:when>
		<c:when test="${num > 70 }">
			C등급입니다.
		</c:when>
		<c:otherwise>
			F등급입니다.(else)
		</c:otherwise>
	</c:choose>
	</p>
	
	
	
	
	
	
	<!-- begin ~ end를 활용해 원하는 숫자로 반복하기 -->
	<!-- 
	 # forEach문의 varStatus
	 - status.first : 첫 번째 반복일 때 true
	 - status.last : 마지막 반복일 때 true 
	 - status.index : 인덱스 (현재 i값) 
	 - status.count : 개수 (1부터 시작)
	 - status.begin : 시작했던 값
	 - status.end : 마지막 값
	 -->

	<!-- i가 55부터 80까지★ -->
	<c:forEach begin="55" end="65" var="i" varStatus="status">
		<c:choose>
			<c:when test="${status.first }">
				<div id="div${i }" style="color : red;">${i }번째 DIV입니다.</div>
			</c:when>
			<c:when test="${status.last }">
				<div id="div${i }" style="color : green;">${i }번째 DIV입니다.</div>
			</c:when>
			<c:when test="${status.count % 2 == 1 }">
				<div id="div${i }" style="color : blue;">${status.index }번째 DIV${status.count }입니다.</div>
			</c:when>
			<c:otherwise>
				<div id="div${i }">${i }번째 DIV입니다.</div>
			</c:otherwise>		
		</c:choose>	
	</c:forEach>
	
	
	<!-- items에 iterable(순서대로 꺼낼 수 있는) 객체 넣어 사용하기 -->	
	<%
		//c:set으로는 모든 자바 문법을 사용할 수 있는 것이 아니다. 배열 못 넣음 그래서 이렇게 해줄 것
		String[] drinks = {"콜라", "사이다", "환타", "미린다", "요구르트"};
		request.setAttribute("drinks", drinks);
	%>
	
	<!-- items로 Array, List, Set 등 사용 가능 -->
	<c:forEach items="${drinks }" var="drink">
		<div id="${drink }">${drink }</div>
	</c:forEach>
	
	
	
	
	<!-- delim은 여러 개 등록 가능 -->
	<c:forTokens items="milk/bread,fish/cake,beer" delims="/," var="food">
		<li id="${food }">${food }</li>
	</c:forTokens>
	
	
	<!-- contextPath를 이용할 때 를 대비한 태그 -->
	<p><c:url value="/main/test"/></p>
	<!-- 원래는 이렇게 request.getContextPath()이용해서 했어야 함 -->	
	<p><%=request.getContextPath() %>/main/test</p>
	
	<p>
		<c:url value="/main/test">
			<c:param name="age" value="10"/>
			<c:param name="math" value="95"/>
		</c:url>
	</p>
	

	

	<!-- a태그에 직접 써주긴 지저분하잔아 그러니까 var="myURL"을 넣어서 myURL변수에 저장한 후 그걸 a태그에 넣을 수 있음 -->
	<c:url value="/main/test" var="myURL" scope="page">
		<c:param name="age" value="10"/>
		<c:param name="math" value="95"/>
	</c:url>
	
	<a href="${myURL }">눌러보세요!</a>
	
	
	
	
	
	
</body>
</html>