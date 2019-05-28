package com.test.mvc;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberInsertModel
{

	public String process(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException
	{
		String result = "";
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		
		MemberDAO dao = new MemberDAO();
		
		try
		{
			dao.connection();
			
			int idCheck = dao.idCheck(id);
			int emailCheck = dao.emailCheck(email);
			
			if(idCheck>0)
			{
				request.setAttribute("idCheck", idCheck);
				result = "WEB-INF/view/MemberInsertForm.jsp";
			}
			else if(emailCheck>0)
			{
				request.setAttribute("emailCheck", emailCheck);
				result = "WEB-INF/view/MemberInsertForm.jsp";
			}
			else
			{
				MemberDTO dto = new MemberDTO ();
				
				dto.setId(id);
				dto.setPw(pw);
				dto.setName(name);
				dto.setTel(tel);
				dto.setEmail(email);
				
				dao.add(dto);
				
				result = "WEB-INF/view/MemberInsert.jsp";
			}
			
		} catch (ClassNotFoundException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;

	}
	
}