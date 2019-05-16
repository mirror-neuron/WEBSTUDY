<%@page import="com.test.DeptDTO"%>
<%@page import="com.test.DeptDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String deptNo = request.getParameter("deptNo");
	String dName = request.getParameter("dName");
	String loc = request.getParameter("loc");
	
	DeptDAO dao = new DeptDAO();
	
	try
	{
		dao.connection();
		
		DeptDTO dept = new DeptDTO();
		
		dept.setDeptNo(deptNo);
		dept.setdName(dName);
		dept.setLoc(loc);
		
		dao.modify(dept);
		
	} catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
			
		} catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	response.sendRedirect("DeptSelect.jsp");
%>