<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String[] gender = request.getParameterValues("genderGroup");
	String[] major = request.getParameterValues("major");
	String[] hobby = request.getParameterValues("hobby");
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RadioSelect_ok.jsp</title>
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<hr>
	<p>RadioSelect.jsp → RadioSelect_ok.jsp ●</p>
</div>

<div>
	<h2>radio, select 데이터 수신</h2>
	
	<div>
		<h3>수신한 데이터</h3>
		<!-- <p>이름 : 유진석</p> -->
		<p>이름 : <%=name %></p> 
		<!-- <p>성별 : M(남자)</p> -->
		<p>성별 : <%=gender %></p>
		<!-- <p>전공 : 국문학</p> -->
		<p>전공 : <%=major %></p> 
		<!-- <p>취미 : 음악감상</p> -->
		<p>취미 : <%=hobby %></p>
	</div>

</div>
	
</body>
</html>