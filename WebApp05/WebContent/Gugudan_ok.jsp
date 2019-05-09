<%@ page contentType="text/html; charset=UTF-8"%>
 
<%
	request.setCharacterEncoding("UTF-8");
	
	String str = request.getParameter("dan");

	int n = Integer.parseInt(str);

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan_ok.jsp</title>
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<hr>
	<p>Gugudan.jsp → Gugudan_ok.jsp ●</p>
</div>

<div>
	<h2>구구단 출력</h2>
</div>

<%-- 	
	<%for(int i=1; i<=9; i++)
	  {%>
		  <%=n %> * <%=i %> = <%=(n*i) %><br>	 
	<%}%> 
--%>

<%
    
	for(int i=1; i<=9; i++)
	{
		out.print(n + " * " + i + " = " + (n*i) + "<br>");
	}
%>

<!-- html 주석문 -->
<%-- jsp 주석문 --%>




</body>
</html>