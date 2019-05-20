<%@page import="com.test.EmpDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   //EmpDelete.jsp 
   
   //데이터 수신(EmpSelect.jsp 로 부터 )
   String empno = request.getParameter("empno");
   
   //EmpDAO 인스턴스 생성
   EmpDAO dao = new EmpDAO();
   try
   {
      dao.connection();   
      
      dao.remove(empno);
      
   }
   catch(Exception e)
   {
      System.out.print(e.toString());
   }
   finally
   {
      try
      {
         dao.close();   
      }
      catch(Exception e)
      {
         System.out.print(e.toString());
      }
   }
   
   //변경된 URL을 다시 요청
   response.sendRedirect("EmpSelect.jsp");

%>