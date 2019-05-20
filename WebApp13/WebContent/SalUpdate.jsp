<%@page import="com.test.SalDTO"%>
<%@page import="com.test.SalDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// SalUpdate.jsp
	
	// 데이터 수신 - grade
	String grade = request.getParameter("grade");
	int losal = Integer.parseInt(request.getParameter("losal"));
	int hisal = Integer.parseInt(request.getParameter("hisal"));
	
	SalDAO dao = new SalDAO();
	
	try
	{
		dao.connection();
		
		SalDTO sal = new SalDTO();
		sal.setGrade(grade);
		sal.setLosal(losal);
		sal.setHisal(hisal);
		
		dao.modify(sal);
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
	
	// 변경된 URL 로 다시 요청할 수 있도록 안내
	response.sendRedirect("SalSelect.jsp");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SalUpdate.jsp</title>
</head>
<body>

</body>
</html>