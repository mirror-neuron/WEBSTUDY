<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	// MemberInsert,jsp
	//-- 데이터 입력 처리 페이지
	MemberDTO dto = new MemberDTO();
	MemberDAO dao = new MemberDAO();
	request.setCharacterEncoding("UTF-8");
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	dto.setName(userName);
	dto.setTel(userTel);
	
	dao.add(dto);
	
	response.sendRedirect("MemberList.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsert.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>큰주제</h1>
	<hr>
</div>

<div>
	<p>작은주제</p>
	<form></form>
</div>

</body>
</html>