package com.test.mvc;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberListModel
{

	public String select(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, SQLException
	{
		String result = "";
		
		request.setCharacterEncoding("UTF-8");
		
		MemberDAO dao = new MemberDAO();
		
		try
		{
			dao.connection();
			
			request.setAttribute("lists", dao.lists());
			
		} catch (ClassNotFoundException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		  
	    result = "WEB-INF/view/MemberList.jsp";
		
		return result;
	}

}