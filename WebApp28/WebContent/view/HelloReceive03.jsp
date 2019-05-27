<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%	
    request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloReceive03.jsp</title>
</head>
<body>

<div>
	<h1>결과 수신 페이지</h1>
	<h2>HelloReceive03.jsp</h2>
	<hr>
</div>

<div>
	<!-- 컨트롤러로부터 수신한 결과 -->
	<ul>
		<c:forEach var="item" items="${lists }">
			<li>First Name : ${item.firstName }</li>
			<li>Last Name : ${item.lastName }</li>
		</c:forEach>
	</ul>
</div>

</body>
</html>