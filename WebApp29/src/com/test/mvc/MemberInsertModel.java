package com.test.mvc;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberInsertModel
{

	public String process(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException
	{
		String result = "";
		
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("id");
		String userPw = request.getParameter("pw");
		String userName = request.getParameter("name");
		String userTel = request.getParameter("tel");
		String userEmail = request.getParameter("email");
		
		request.setAttribute("id", userId);
		request.setAttribute("pw", userPw);
		request.setAttribute("name", userName);
		request.setAttribute("tel", userTel);
		request.setAttribute("email", userEmail);
		
		result = "WEB-INF/MemberInsert.jsp";
		
		return result;
	}

}
