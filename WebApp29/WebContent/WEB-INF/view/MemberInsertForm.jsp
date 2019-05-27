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
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/main.css">
</head>
<body>

<div>
	<h1>회원 명단 출력</h1>
	<hr>
</div>

<div>
	<form action="MemberInsert.jsp" method="post">
		<c:forEach var="member" begin="1" end="5" step="1">
			아 이 디 : <input type="text" class="txt" name="id"><br>
			패스워드 : <input type="text" class="txt" name="pw"><br>
			이    름 : <input type="text" class="txt" name="name"><br>
			전화번호 : <input type="text" class="txt" name="tel"><br>
			이 메 일 : <input type="text" class="txt" name="email"><br>
		</c:forEach>
		
		<button type="submit" class="btn" style="width: 200px; font-size: 16pt;">입력</button>
	</form>
</div>

</body>
</html>