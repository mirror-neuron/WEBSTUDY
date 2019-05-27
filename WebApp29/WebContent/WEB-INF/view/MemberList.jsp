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
<title>MemberList.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/main.css">
</head>
<body>

<div>
	<table class="table">
		<tr>
			<th>아 이 디</th>
			<th>비밀번호</th>
			<th>이    름</th>
			<th>전화번호</th>
			<th>이 메 일</th>
		</tr>
		
		<c:forEach var="dto" items="${lists }">
			<tr>
				<td style="text-align: center;">${dto.id }</td>
				<td style="text-align: center;">${dto.pw }</td>
				<td style="text-align: center;">${dto.name }</td>
				<td style="text-align: center;">${dto.tel }</td>
				<td style="text-align: center;">${dto.email }</td>
			</tr>
		</c:forEach>
	</table>
</div>

</body>
</html>