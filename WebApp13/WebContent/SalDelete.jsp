<%@page import="com.test.SalDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// SalDelete.jsp
	// 데이터 수신 → grade
	String grade = request.getParameter("grade");

	// SalDAO 인스턴스 생성
	SalDAO dao = new SalDAO();
	
	try
	{
		dao.connection();
		
		dao.remove(grade);
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
	
	// 변경된 URL을 다시 요청할 수 있도록 안내
	response.sendRedirect("SalSelect.jsp");	
	
%>
