<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%

	application.setAttribute("fruit", "dragonfruit");
	session.setAttribute("fruit", "peach");
	request.setAttribute("fruit", "orange");
	pageContext.setAttribute("fruit", "pineapple");
	


%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>EL</title>
</head>
<body>


	<h3># EL (Expression Language)</h3>
	<ul>
		<li>JSP에서 애트리뷰트에 들어 있는 값을 편리하게 사용할 수 있는 문법</li>
		<li>여러 영역에 같은 name을 가진 애트리뷰트가 존재한다면 가장 가까운 영역의 값을 먼저 사용한다.</li>
		<li>(순서는 page - request - session - application) 페리세아 페리페라? ㅋ</li>
		<li>정확하게 접근하고 싶다면 해당 영역 이름을 앞에 명시해야 한다. 
			(pageScope, requestScope, sessionScope, applicationScope)</li>
	</ul>	
	
	
	<h3># EL로 Attribute에 저장된 값 출력하기</h3>
	<ul>
		<li>과일 그냥 출력 : ${fruit}</li> 
		<!-- 제일 가까운게 나옴 -->
		<!-- 만약 page영역에 값이 null이면 request영역의 값이 나올 것이다.
		각 애트리뷰트를 선언한 곳으로 올라가서 
		page-request-session-appli 순서대로 null값으로 바꿔보기-->

		<li>페이지 영역 : ${pageScope.fruit}</li>
		<li>리퀘스트 영역 : ${requestScope.fruit}</li>
		<li>세션 영역 : ${sessionScope.fruit}</li>
		<li>애플리케이션 영역 : ${applicationScope.fruit}</li>
	</ul>
	
	
	<h3># EL의 리터럴</h3>
	<ul>
		<li>boolean type : ${true }, ${false }</li> 
		<li>정수타입 : ${123 }, ${456 }, ${123 * 444 }</li>
		<li>실수타입 : ${123.1234 * 3 }</li>
		<li>문자열타입 : ${'Hello' }, ${"큰따옴표도 가능" }</li>
	</ul>
	
	
	<h3># EL의 연산자</h3>
	
	<dl>
		<dt>산술연산자 : +, -, /, %, mod</dt>
		<dd>${'${15 % 10} = '}${15 % 10 }</dd>
		<dt>
			<b>비교연산자 : </b>
			&lt;, &gt;, &le;, &ge;, ==, !=, 
			eq(equal), ne(not equal), 
			lt(less than), gt(greater than), 
			le(less than equal), ge(greater than equal)
		</dt>
		<dd>${'${15 eq 15}' } = ${15 eq 15 }</dd>
		<!-- <dd>${'${15 ne 15}' } = ${15 ne 15 }</dd> --> 		

		<dt>
			<b>논리연산자 : </b> and, or, not, &&, ||, !
		</dt>
		<dd>
			${fruit eq 'pineapple' 
				and applicationScope.fruit eq 'dragonfruit' },
			
			<%
				pageContext.setAttribute("a", 22);
			%>
			
			${a mod 2 eq 0 && a mod 11 eq 0}, 
			${a % 2 == 0 && a % 11 == 0}
		</dd>
	
		<dt>
			<b>삼항연산자 : </b> condition ? yes : no
		</dt>
		<dd>
			<% request.setAttribute("apple", 13); %>
			${apple % 10 == 0 ? '<b>바구니 / 10</b>' : '<b>바구니 / 10 + 1 </b>' } <!-- 에체템엘 태그 인식됨 -->
		</dd>
	</dl>
	
	
</body>
</html>