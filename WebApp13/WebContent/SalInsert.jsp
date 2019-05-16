<%@page import="com.test.SalDTO"%>
<%@page import="com.test.SalDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// SalInsert.jsp
	
	// 데이터 수신
	// grade
	String grade = request.getParameter("grade");
	String losal = request.getParameter("losal");
	String hisal = request.getParameter("hisal");
	
	SalDAO dao = new SalDAO();
	
	try
	{
		dao.connection();	
		
		// 수신된 데이터로 SalDTO 구성 → add() 메소드의 매개변수
		SalDTO sal = new SalDTO();
		sal.setGrade(grade);
		sal.setLosal(Integer.parseInt(losal));
		sal.setHisal(Integer.parseInt(hisal));

		// dao 의 add() 메소드 호출 → 데이터 입력(insert 수행)
		dao.add(sal);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 새로운 페이지 요청할 수 있도록 안내
	response.sendRedirect("SalSelect.jsp");

%>	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SalInsert.jsp</title>
</head>
<body>

</body>
</html>