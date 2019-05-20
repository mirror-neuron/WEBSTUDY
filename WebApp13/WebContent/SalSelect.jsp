<%@page import="com.test.SalDTO"%>
<%@page import="com.test.SalDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   StringBuffer str = new StringBuffer();
   SalDAO dao = new SalDAO();
   
   try
   {
      
      // 데이터베이스 연결
      dao.connection();
      
      str.append("<table class='table table-bordered'>");
      str.append("<tr>");
      str.append("<th style='width: 10%; text-align: center;'>분류</th>");
      str.append("<th style='width: 10%; text-align: center;'>최저급여</th>");
      str.append("<th style='width: 10%; text-align: center;'>최고급여</th>");
      str.append("<th style='width: 10%; text-align: center;'>등급관리</th>");
      str.append("</tr>");
      
      for(SalDTO sal : dao.lists())
      {
         str.append("<tr>");
         str.append("<td style='margin: auto; text-align: center;'>" + sal.getGrade() + "</td>");
         str.append("<td style='margin: auto; text-align: center;'>" + sal.getLosal() + "</td>");
         str.append("<td style='margin: auto; text-align: center;'>" + sal.getHisal() + "</td>");
         str.append("<td>");
         
         str.append("<p style='text-align: center;'>");
         str.append("<a href='SalUpdateForm.jsp?grade=" + sal.getGrade() + "'>");
         str.append("<button type='button'  class='btn btn-primary btn-sm active'>");
         str.append("수정");
         str.append("</button>");
         str.append("</a>");
         
         str.append("<a href='javascript:salDelete(" + sal.getGrade() + ")'>");      
         str.append("<button type='button' class='btn btn-default btn-sm active'>");
         str.append("삭제");
         str.append("</button>");
         str.append("</a>");
         
         str.append("<a href='javascript:salCheck(" + sal.getGrade() + sal.getLosal() + sal.getHisal() + ")'>");      
         str.append("<button type='button' class='btn btn-primary btn-sm active'>");
         str.append("조회");
         str.append("</button>");
         str.append("</a>");
         
         str.append("</p>");
         
         str.append("</td>");
         
         str.append("</tr>");
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
         // 데이터베이스 연결 종료
         dao.close();
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
<title>SalSelect.jsp</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

<script type="text/javascript">

   function salDelete(grade)
   {
      //alert(grade);
      
      var res = confirm("분류 : " + grade + "\n이 급여 등급 정보를 삭제하시겠습니까?");
      
      alert(res);
      
      
      
      if (res)
         window.location.href="SalDelete.jsp?grade=" + grade;
   }
   
   function salCheck(grade)
   {
	  //alert(grade);
	  
	  var res = confirm("번호 : " + grade + "\n이 등급의 급여 범위는\n" + losal + " ~ " + hisal + "입니다.");
	  
	  alert(res);
   }

</script>

</head>
<body>

<!-- http://211.238.142.153:8090/WebApp13/Salselect.jsp -->
<div class="container">
   <h1>급여 등급 관리 및 출력 페이지</h1>
   <hr>
</div>

<div class="container">
   <a href="SalInsertForm.jsp?"><button type="button" class="btn btn-primary btn-lg active">급여 등급 추가</button></a>
   <a href="EmpSelect.jsp"><button type="button" class="btn btn-primary btn-lg active">처음으로</button></a>
</div>

<br>

<div class="container">
   <!-- 리스트 출력 -->
   <%=str %>
</div>


</body>
</html>