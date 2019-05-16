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
		
		str.append("<table class='table'>");
		str.append("<tr>");
		str.append("<th class='numTh'>등급</th>");
		str.append("<th class='nameTh'>최저급여</th>");
		str.append("<th class='nameTh'>최고급여</th>");
		str.append("<th></th>");
		str.append("</tr>");
		
		for(SalDTO sal : dao.lists())
		{
			str.append("<tr>");
			str.append("<td>" + sal.getGrade() + "</td>");
			str.append("<td>" + sal.getLosal() + "</td>");
			str.append("<td>" + sal.getHisal() + "</td>");
			
			if(sal.getLosal()==-1 && sal.getHisal()==-1)
			{
				str.append("<td>");
				
				str.append("<a href='SalInsertForm.jsp?grade=" + sal.getGrade() + "'>");
				str.append("<button type='button' class='btn01'>");
				str.append("입력");
				str.append("</button>");
				str.append("</a>");
				
				str.append("<button type='button' class='btn02'>");
				str.append("수정");
				str.append("</button>");
				str.append("<button type='button' class='btn02'>");
				str.append("삭제");
				str.append("</button>");
				
				str.append("</td>");
			}
			else
			{
				str.append("<td>");
				
				str.append("<td>");
				
				str.append("<button type='button' class='btn02'>");
				str.append("입력");
				str.append("</button>");
				
				str.append("<a href='SalUpdateForm.jsp?grade=" + sal.getGrade() + "'>");
				str.append("<button type='button' class='btn01'>");
				str.append("수정");
				str.append("</button>");
				str.append("</a>");
				
				str.append("<a href='javascript:salDelete(" + sal.getGrade() + ")'>");		
				str.append("<button type='button' class='btn01'>");
				str.append("삭제");
				str.append("</button>");
				str.append("</a>");
				
				str.append("</td>");
			}
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
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">

<script type="text/javascript">

	function salDelete(grade)
	{
		//alert(grade);
		
		var res = confirm("등급 : " + grade + "\n이 급여 등급 정보를 삭제하시겠습니까?");
		
		if (res)
			window.location.href="SalDelete.jsp?grade=" + grade;
	}

</script>

</head>
<body>

<!-- http://211.238.142.153:8090/WebApp13/Salselect.jsp -->
<div>
	<h1>급여 등급 관리 및 출력 페이지</h1>
	<hr>
</div>

<div>
	<a href="SalSelect.jsp"><button type="button">급여 등급 관리</button></a>
</div>

<br>

<div>
	<!-- 리스트 출력 -->
	<%=str %>
</div>


</body>
</html>