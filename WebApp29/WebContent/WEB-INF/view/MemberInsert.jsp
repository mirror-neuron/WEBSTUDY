<%@page import="java.util.ArrayList"%>
<%@page import="com.test.mvc.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%	
    request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String id[] = request.getParameterValues("id");
	String pw[] = request.getParameterValues("pw");
	String name[] = request.getParameterValues("name");
	String tel[] = request.getParameterValues("tel");
	String email[] = request.getParameterValues("email");
	
	List<MemberDTO> lists = new ArrayList<MemberDTO>();
	
	MemberDTO dto = null;
	
	for(int i=0; i<id.length; i++)
	{
		dto = new MemberDTO(id[i], pw[i], name[i], tel[i], email[i]);
		lists.add(dto);
		
	}

	request.setAttribute("lists", lists);
%>

<jsp:forward page="MemberList.jsp"></jsp:forward>