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


	<h3># �ܺ� ���̺귯�� �߰��ϴ� ����</h3>
	<ol>
		<li>�ش� ������Ʈ ��Ŭ�� -> Build Path -> Configure Build Path... - Libraries </li>
		<li>Module path �� Add External JARs</li>
		<li>���ϴ� ���̺귯�� ã�Ƽ� ���(�츮�� jstl.jar�ΰ� �װ� �޾����ϱ� �װ� ����</li>
		
		<li>�ش� ������Ʈ ��Ŭ�� -> Properties </li>
		<li>Deployment Assembly -> Add</li>
	</ol>


	<h3># JSTL(JSP Standard Tag Library)</h3>
	
	<ul>
		<li>JSP���Ͽ��� �ڹ� �ڵ带 �ս��� ����ϱ� ���� Ŀ���� �±� ���̺귯��</li> 
		<li>�ڹ��� �� ���� �ٽ� ����� �±� ���·� ����� �� �ִ�.</li>
		<li>�ַ� ȭ���� ���� �� ������ ��ɵ��� ���� �� �ִ�.</li>
		<li>JSP ���� �� ���� Ŀ���� �±׸� �߰��� �� ����ؾ� �Ѵ�.</li>	
	</ul>
	
	<h3># JSTL Core</h3>
	<p>�ڹ��� �ֿ� �ٽ� �������� ����� �� �ִ� Ŀ���� �±� ���̺귯��</p>
	<dl>
		<dt>c:set</dt>
		<dd>setAttribute�� ���ϰ� ����� �� �ִ�.</dd>	
		
		<dt>c:if</dt>
		<dd>�ڹ��� if���� ���ϰ� ����� �� �ִ�. (else, else if�� ����)</dd>
		
		<dt>c:choose, c:when, c:otherwise</dt>
		<dd>if, else if, elseó�� ����� �� �ִ� ���ǹ�</dd>
		
		<dt>c:forEach</dt>
		<dd>�������� �ݺ� ó��</dd>
		<dt>c:forTokens</dt>
		<dd>�ϳ��� �� �����͸� �ڸ��鼭 �ݺ� ó�� (�ڸ� �� �ϳ��� ��ū�̶�� �ϴ� �Ű�~)</dd>
		<dt>c:url</dt>
		<dd>Context Path�� ������ URL�� �ڵ����� ����</dd>
	</dl>
	
		<p>�̿ܿ��� �� �ִ� �ʿ��� �� ã�� ���� �ǰ� ���۸��ϴ� ������ �� �̰� jstl�̴� ��� �Ǵ��� ��� ã�ƺ��� ��</p>
	<hr />
	
	
	
	
	<!-- 
	# c:set
	
	���ŷο� setAttribute�� ���ϰ� ����� �� �ִ�. (���� ���� ���� ����)
	-var : ��Ʈ����Ʈ�� �̸�
	-value : ��Ʈ����Ʈ�� ��
	-scope : page/request/session/application (�⺻�� : page)	
	-->
	
	<c:set var="car" value="myCar" />
 	<c:set var="fruit" value="apple" scope="request" />

	<% request.setAttribute("fruit", "banana"); //���� �� �ᱹ �̰��� �̰� �� �����ڳ� %>
	
	${fruit } <!-- banana�� ���� �� -->


	page.car : ${pageScope.car },
	request.car : ${requestScope.car }


		
		
		
		
	<c:set var="animal" value="�罿"/> <!-- Ŀ���� �±��̱� ������ value="null"�̷��� null�� ���������� �������ִ� �ͱ����� �Ұ���. ���� ��¥ �� �־��ָ� null�� �Ǳ� ��-->
	<c:if test="${animal!=null }"> <!-- null�̸� ���� �� �������� -->
		<p>animal attribute�� ��� �ִ� ���� ${animal }�Դϴ�.</p>
	</c:if>
	
	
	<!-- jstl�±׸� ����ؾ� �ϴ� ���� �� Ƽ���丮 �� ���� ~~~~ -->
	<c:set var="tea" value="����" scope="application" />
	<c:if test="${tea!= null }"> 
		<p>${tea }�Դϴ�.</p>
	</c:if>
	
	


	
	<c:set var="num" value="75"/>
	
	<p>
	<c:choose>
		<c:when test="${num > 100 || num < 0}">
			��ȿ���� ���� �����Դϴ�.
		</c:when>
		<c:when test="${num > 90 }">
			A����Դϴ�.
		</c:when>
		<c:when test="${num > 80 }">
			B����Դϴ�.
		</c:when>
		<c:when test="${num > 70 }">
			C����Դϴ�.
		</c:when>
		<c:otherwise>
			F����Դϴ�.(else)
		</c:otherwise>
	</c:choose>
	</p>
	
	
	
	
	
	
	<!-- begin ~ end�� Ȱ���� ���ϴ� ���ڷ� �ݺ��ϱ� -->
	<!-- 
	 # forEach���� varStatus
	 - status.first : ù ��° �ݺ��� �� true
	 - status.last : ������ �ݺ��� �� true 
	 - status.index : �ε��� (���� i��) 
	 - status.count : ���� (1���� ����)
	 - status.begin : �����ߴ� ��
	 - status.end : ������ ��
	 -->

	<!-- i�� 55���� 80������ -->
	<c:forEach begin="55" end="65" var="i" varStatus="status">
		<c:choose>
			<c:when test="${status.first }">
				<div id="div${i }" style="color : red;">${i }��° DIV�Դϴ�.</div>
			</c:when>
			<c:when test="${status.last }">
				<div id="div${i }" style="color : green;">${i }��° DIV�Դϴ�.</div>
			</c:when>
			<c:when test="${status.count % 2 == 1 }">
				<div id="div${i }" style="color : blue;">${status.index }��° DIV${status.count }�Դϴ�.</div>
			</c:when>
			<c:otherwise>
				<div id="div${i }">${i }��° DIV�Դϴ�.</div>
			</c:otherwise>		
		</c:choose>	
	</c:forEach>
	
	
	<!-- items�� iterable(������� ���� �� �ִ�) ��ü �־� ����ϱ� -->	
	<%
		//c:set���δ� ��� �ڹ� ������ ����� �� �ִ� ���� �ƴϴ�. �迭 �� ���� �׷��� �̷��� ���� ��
		String[] drinks = {"�ݶ�", "���̴�", "ȯŸ", "�̸���", "�䱸��Ʈ"};
		request.setAttribute("drinks", drinks);
	%>
	
	<!-- items�� Array, List, Set �� ��� ���� -->
	<c:forEach items="${drinks }" var="drink">
		<div id="${drink }">${drink }</div>
	</c:forEach>
	
	
	
	
	<!-- delim�� ���� �� ��� ���� -->
	<c:forTokens items="milk/bread,fish/cake,beer" delims="/," var="food">
		<li id="${food }">${food }</li>
	</c:forTokens>
	
	
	<!-- contextPath�� �̿��� �� �� ����� �±� -->
	<p><c:url value="/main/test"/></p>
	<!-- ������ �̷��� request.getContextPath()�̿��ؼ� �߾�� �� -->	
	<p><%=request.getContextPath() %>/main/test</p>
	
	<p>
		<c:url value="/main/test">
			<c:param name="age" value="10"/>
			<c:param name="math" value="95"/>
		</c:url>
	</p>
	

	

	<!-- a�±׿� ���� ���ֱ� ���������ܾ� �׷��ϱ� var="myURL"�� �־ myURL������ ������ �� �װ� a�±׿� ���� �� ���� -->
	<c:url value="/main/test" var="myURL" scope="page">
		<c:param name="age" value="10"/>
		<c:param name="math" value="95"/>
	</c:url>
	
	<a href="${myURL }">����������!</a>
	
	
	
	
	
	
</body>
</html>