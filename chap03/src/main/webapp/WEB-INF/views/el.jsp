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
		<li>JSP���� ��Ʈ����Ʈ�� ��� �ִ� ���� ���ϰ� ����� �� �ִ� ����</li>
		<li>���� ������ ���� name�� ���� ��Ʈ����Ʈ�� �����Ѵٸ� ���� ����� ������ ���� ���� ����Ѵ�.</li>
		<li>(������ page - request - session - application) �丮���� �丮���? ��</li>
		<li>��Ȯ�ϰ� �����ϰ� �ʹٸ� �ش� ���� �̸��� �տ� ����ؾ� �Ѵ�. 
			(pageScope, requestScope, sessionScope, applicationScope)</li>
	</ul>	
	
	
	<h3># EL�� Attribute�� ����� �� ����ϱ�</h3>
	<ul>
		<li>���� �׳� ��� : ${fruit}</li> 
		<!-- ���� ������ ���� -->
		<!-- ���� page������ ���� null�̸� request������ ���� ���� ���̴�.
		�� ��Ʈ����Ʈ�� ������ ������ �ö󰡼� 
		page-request-session-appli ������� null������ �ٲ㺸��-->

		<li>������ ���� : ${pageScope.fruit}</li>
		<li>������Ʈ ���� : ${requestScope.fruit}</li>
		<li>���� ���� : ${sessionScope.fruit}</li>
		<li>���ø����̼� ���� : ${applicationScope.fruit}</li>
	</ul>
	
	
	<h3># EL�� ���ͷ�</h3>
	<ul>
		<li>boolean type : ${true }, ${false }</li> 
		<li>����Ÿ�� : ${123 }, ${456 }, ${123 * 444 }</li>
		<li>�Ǽ�Ÿ�� : ${123.1234 * 3 }</li>
		<li>���ڿ�Ÿ�� : ${'Hello' }, ${"ū����ǥ�� ����" }</li>
	</ul>
	
	
	<h3># EL�� ������</h3>
	
	<dl>
		<dt>��������� : +, -, /, %, mod</dt>
		<dd>${'${15 % 10} = '}${15 % 10 }</dd>
		<dt>
			<b>�񱳿����� : </b>
			&lt;, &gt;, &le;, &ge;, ==, !=, 
			eq(equal), ne(not equal), 
			lt(less than), gt(greater than), 
			le(less than equal), ge(greater than equal)
		</dt>
		<dd>${'${15 eq 15}' } = ${15 eq 15 }</dd>
		<!-- <dd>${'${15 ne 15}' } = ${15 ne 15 }</dd> --> 		

		<dt>
			<b>�������� : </b> and, or, not, &&, ||, !
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
			<b>���׿����� : </b> condition ? yes : no
		</dt>
		<dd>
			<% request.setAttribute("apple", 13); %>
			${apple % 10 == 0 ? '<b>�ٱ��� / 10</b>' : '<b>�ٱ��� / 10 + 1 </b>' } <!-- ��ü�ۿ� �±� �νĵ� -->
		</dd>
	</dl>
	
	
</body>
</html>