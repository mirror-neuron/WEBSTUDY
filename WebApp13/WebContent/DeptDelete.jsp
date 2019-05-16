<%@page import="com.test.DeptDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	String deptNo = request.getParameter("deptNo");

	DeptDAO dao = new DeptDAO();
	
	String strAddr = "";
	
	try
	{
		dao.connection();
		
		int checkCount = dao.refCount(deptNo);
		
		if (checkCount == 0)
		{
			dao.remove(deptNo);
			strAddr = "DeptSelect.jsp";
		}
		else
		{
			strAddr = "Notice.jsp";
		}
		
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
	
	response.sendRedirect(strAddr);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>