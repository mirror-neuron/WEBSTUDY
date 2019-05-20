<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Calc.jsp 페이지로부터 데이터 수신
	String strSu1 = request.getParameter("su1");
	String strSu2 = request.getParameter("su2");
	String op = request.getParameter("op");
	
	int su1, su2 = 0;
	String str = "";
	/*
	if(strSu1 == null || strSu2 == null)
	{
		response.sendRedirect("Calc.jsp");
	}
	else
	{
		su1 = Integer.parseInt(strSu1);
		su2 = Integer.parseInt(strSu2);
		
		// 자바에서 우리가 설계한 클래스를 사용하기 위해... 객체 생성
		Calc OB = new Calc();
		//-- 이클립스 자동완성 기능을 사용하여 구문을 작성할 경우
		//   『@page import="com.test.Calc"』 이 구문도 함께 처리됨.
		//   혹은, 자동완성 기능을 사용하지 않을 경우도
		//   『@page import="com.test.Calc"』 이와 같은 구문을 직접
		//   작성해서 해당 클래스를 사용할 수 있도록 처리해 주어야 함.
		
		OB.setSu1(su1);
		OB.setSu2(su2);
		OB.setOp(op);
		
		str = OB.result();
		
	} */

%>

<jsp:useBean id="ob" class="com.test.Calc" scope="page"></jsp:useBean>
<!-- 이 구문은 스크립 릿 영역에서(★)
     『com.test.Calc ob = new com.test.Calc();』
     를 작성하여 import 구문을 자동으로 처리한 것과
     마찬가지의 효과를 적용하게 된다.
     (객체가 만들어지는 장소 : Servlet(JSP) 컨테이너 안, Servlet(JSP)이 만든다.)-->

<jsp:setProperty property="su1" name="ob"/>
<jsp:setProperty property="su2" name="ob"/>
<jsp:setProperty property="op" name="ob"/>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc_ok2.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>두 번째 방법 처리 결과</h1>
	<hr>
</div>

<div>
 	<h2><%=ob.result() %></h2>
</div>


</body>
</html>