<%@page import="com.test.DeptDAO"%>
<%@page import="com.test.DeptDTO"%>
<%@page import="com.test.EmpDTO"%>
<%@page import="com.test.EmpDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   StringBuffer str = new StringBuffer();
  
   EmpDAO dao = new EmpDAO();
   
   DeptDAO daoD = new DeptDAO();
   
   
   String deptV = request.getParameter("dept");
   String deptF = request.getParameter("dept");
   
   String empCount="";
 

   if (deptV==null)
   {
      deptV="0";
   }
   try
   {
      System.out.println(deptV);
      
      dao.connection();
      daoD.connection();
      
      if(deptV.equals("0"))
      {
         empCount ="<span id='empCount'>전체 인원 수 : ";
         empCount += dao.countAll()+ "명</span>"; 
      }
      else
      {
         empCount ="<span id='empCount'>부서 인원 수 : ";
         empCount += dao.count(deptF)+ "명</span>"; 
      }
      
    
      
      str.append("<table  class='table table-bordered'>");
      str.append("<tr>");
      str.append("<th style = 'width: 50px; text-align: center; text-valign: middle;'>번호</th>");
      str.append("<th style = 'width: 100px; text-align: center;'>이름</th>");
      str.append("<th style = 'width: 150px; text-align: center;'>직업</th>");
      str.append("<th style = 'width: 100px; text-align: center;'>매니저</th>");
      str.append("<th style = 'width: 200px; text-align: center;'>입사일</th>");
      str.append("<th style = 'width: 150px; text-align: center;'>급여</th>");
      str.append("<th style = 'width: 150px; text-align: center;'>부서");
                                           
      
      str.append("<select id = 'dept' name = 'dept' onchange='deptchange()'>");
      str.append("<option value='0'>All</option>");
      /* DeptDTO dept : daoD.lists() */
      for (DeptDTO deptD : daoD.lists())
      {
         if (deptV.equals(deptD.getDeptNo()))
         {
            str.append("<option value='" + deptD.getDeptNo() + "' selected = 'selected''>"+ deptD.getdName() +"</option>");
            
         
         
         }
         else 
         {
            str.append("<option value='" + deptD.getDeptNo() + "'>"+ deptD.getdName() +"</option>");
         }
      }
      str.append("</select>");
      str.append("</th>");
      str.append("<th style = 'width: 130px; text-align: center;'>급여등급</th>");
      str.append("<th style = 'width: 100px; text-align: center;'>보너스</th>");
      str.append("<th style = 'width: 200px; text-align: center;'>사원관리</th>");
      
      str.append("</tr>");
      
      if (deptV==null || deptV.equals("0"))
      {
         for (EmpDTO emp : dao.listsAll())
         {
            str.append("<tr>");
            str.append("<td style='text-align: center'>" + emp.getEmpno() + "</td>");
            str.append("<td>" + emp.getEname() + "</td>");
            str.append("<td>" + emp.getJob() + "</td>");
            str.append("<td style='text-align: center'>" + emp.getMgr() + "</td>");
            str.append("<td>" + emp.getHiredate() + "</td>");
            str.append("<td>" + emp.getSal() + "</td>");
            str.append("<td>" + emp.getDeptno() + "</td>");
            str.append("<td style='text-align: center'>" + emp.getGrade() + "</td>");
            str.append("<td>" + emp.getComm() + "</td>");
            str.append("<td>");
         
         str.append("<p style='text-align: center;'>");
         str.append("<a href='EmpUpdateForm.jsp?Empno="+emp.getEmpno()+"'>");      
         str.append("<button type='button' class='btn btn-primary btn-sm active'>수정</button>");
         str.append("</a>");
         str.append("<a href='javascript:EmpDelete("+ emp.getEmpno()+", \"" +emp.getEname() + "\")'>");
         str.append("<button type='button'  class='btn btn-default btn-sm active'>삭제</button>");
         str.append("</a>");
         str.append("</p>");
         
         str.append("</td>" );
            str.append("</tr>");
         }
      }
      else
      {
         for (EmpDTO emp : dao.listsAll2(deptV))
            
         {
            str.append("<tr>");
            str.append("<td>" + emp.getEmpno() + "</td>");
            str.append("<td>" + emp.getEname() + "</td>");
            str.append("<td>" + emp.getJob() + "</td>");
            str.append("<td>" + emp.getMgr() + "</td>");
            str.append("<td>" + emp.getHiredate() + "</td>");
            str.append("<td>" + emp.getSal() + "</td>");
            str.append("<td>" + emp.getDeptno() + "</td>");
            str.append("<td>" + emp.getGrade() + "</td>");
            str.append("<td>" + emp.getComm() + "</td>");
            str.append("<td>");
         
         str.append("<p style='text-align: center;'>");
         str.append("<a href='EmpUpdateForm.jsp?Empno="+emp.getEmpno()+"'>");      
         str.append("<button type='button'  class='btn btn-primary btn-sm active'>수정</button>");
         str.append("</a>");
         str.append("<a href='javascript:EmpDelete("+ emp.getEmpno()+", \"" +emp.getEname() + "\")'>");
         str.append("<button type='button' class='btn btn-default btn-sm active'>삭제</button>");
         str.append("</a>");
         str.append("</p>");
         
         str.append("</td>" );
            str.append("</tr>");
         }
         
      }
      

      
      str.append("</table>");
      
      
      
   }
   catch(Exception e)
   {
      System.out.println(e.toString());
   }
   finally
   {
      try
      {
         
      }
      catch(Exception e)
      {
         System.out.println(e.toString());
      }
      
   }
   

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EmpSelect.jsp</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript">

   function deptchange()
   {
      EmpForm.submit();
   }
   
   
   function EmpDelete(empno,ename)
   {
      var res = confirm("사원번호 : "+empno + ", 이름 : "+ename+"\n이 사원의 정보를 삭제하시겠습니까?");
      
      if(res)
         window.location.href="EmpDelete.jsp?empno="+empno;
   
   }

</script>
</head>
<body>
<div>
</div>

<div class="container" style="background-color: white;">
   <h1>주)보라 사원 관리 프로그램 </h1>
   <hr>
</div>
<div  class="container">
	<br>
   <a href="EmpInsertForm.jsp"><button type="button" class="btn btn-primary btn-lg active">신규 사원 등록</button></a>
   <a href="DeptSelect.jsp"><button type="button" class="btn btn-primary btn-lg active">부서 관리</button></a>
   <a href="SalSelect.jsp"><button type="button" class="btn btn-primary btn-lg active">급여 등급 관리</button></a>
   <br><br>
</div>

<div  class="container">
   <form action = "EmpSelect.jsp?dept=<%=deptV %>" id = "EmpForm">
     <%=empCount %>
     <br><br>
      <%=str %>
   </form>
</div>
</body>
</html>