<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String danSt = request.getParameter("gugudan");

	int dan = Integer.parseInt(danSt);
	
	String str = "";
	
	for(int i=1 ; i<=9 ; i++)
	{
		str += String.format("%d * %d = %d<br>", i, dan, i*dan);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive09.jsp</title>


</head>
<body>

<%=str %>


</body>
</html>