<%@ page contentType="text/html; charset=UTF-8"%>
<%

	String result = (String)request.getAttribute("result");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive11.jsp</title>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 11</h1>
	<hr>
</div>

<div>
	<p>사칙 연산 수행(Receive11.jsp)</p>
</div>

<%=result %>

</body>
</html>