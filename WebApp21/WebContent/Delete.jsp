<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.test.BoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// Delete.jsp
	// 데이터 수신 → num 
	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	Connection conn = DBConn.getConnection();
	
	BoardDAO dao = new BoardDAO(conn);
	
	try
	{	
		dao.deleteData(num);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	response.sendRedirect("List.jsp?pageNum=" + pageNum);
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