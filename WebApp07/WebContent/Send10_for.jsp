<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String userName=request.getParameter("userName");
	//최초 요청했떤 자료
	
	request.setAttribute("message", "안녕하세요.포워드");
	//Send10_for에서 추가한 자료
	
	/* 실질적으로 일을 한건 receive10.jsp이지만 클라이언트에게 Send10_for.jsp로 보여짐 */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send10_for.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 10</h1>
	<hr>
</div>

<div>
	<p>포워드</p>
</div>

<div>
	<p>이름 : <%=userName %></p>
	<jsp:forward page="Receive10.jsp"></jsp:forward>
	<!-- jsp 문법의 forward 태그 , Receive10.jsp 로 포워드 태그 -->
</div>

</body>
</html>