<%@page import="com.test.SalDTO"%>
<%@page import="com.test.SalDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 데이터 수신
	String losal = request.getParameter("losal");
	String hisal = request.getParameter("hisal");
	
	SalDAO dao = new SalDAO();
	
	try
	{
		dao.connection();
		
		SalDTO sal = new SalDTO();
		sal.setLosal(Integer.parseInt(losal));
		sal.setHisal(Integer.parseInt(hisal));
		
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
	
	response.sendRedirect("SalSelect.jsp");

%>