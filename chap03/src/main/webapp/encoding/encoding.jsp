<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���ڵ� ����</title>
</head>
<body>
		
	<h3>JSP�� �������� charset ����</h3>	
	
	
	<dl>
		<dt>1. meta�±��� charset</dt>
		<dd>Ŭ���̾�Ʈ�� �� �������� �ش� �������� �ؼ��� �� ����� charset</dd><!-- ���������� HTML ���Ϸ� �����. HTML�����̱� ������ 0�� 1�̱� ��. -->
		<dt>2. pageEncoding�� charset</dt> <!-- ���⼭ utf-8�� ���� .java�� ��ȯ�ϸ鼭 utf-8�� ���ٴ� �� -->
		<dd>JSP������ Servlet(.java)���� ��ȯ�� �� ����ϴ� charset</dd>
		<dt>3. contentType�� charset</dt>
		<dd>�������� ������ �����(����)�� charset�� �ǹ��Ѵ�.</dd>
	</dl>

	
	<h3># �������� �ѱ� ������ ��������(GET)</h3>
		<!-- ���⿡ /chap03/ ��� �̷��� �س����� server.xml���� ��θ� /chap003���� �ٲ㵵 �ڵ����� �˾Ƽ� �������ְ���  -->
		<form action="<%=request.getContextPath() %>/encodingTest" method="GET">
		<input type="radio" name="subject" value="����" id="kor"/><label for="kor">����</label>
		<input type="radio" name="subject" value="����" id="eng"/><label for="eng">����</label>
		<input type="radio" name="subject" value="����" id="math"/><label for="math">����</label>	
		<input type="submit" value="����"/>
	</form>
	
	
		<h3># �������� �ѱ� ������ ��������(POST)</h3>
		<!-- ���⿡ /chap03/ ��� �̷��� �س����� server.xml���� ��θ� /chap003���� �ٲ㵵 �ڵ����� �˾Ƽ� �������ְ���  -->
		<form action="<%=request.getContextPath() %>/encodingTest" method="POST">
		<input type="radio" name="subject" value="����" id="kor2"/><label for="kor2">����</label>
		<input type="radio" name="subject" value="����" id="eng2"/><label for="eng2">����</label>
		<input type="radio" name="subject" value="����" id="math2"/><label for="math2">����</label>	
		<input type="submit" value="����"/>
	</form>
		
</body>
</html>