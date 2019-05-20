<%@page import="com.test.DeptDTO"%>
<%@page import="com.test.DeptDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	StringBuffer str = new StringBuffer();

	DeptDAO dao = new DeptDAO();
	
	try
	{
		dao.connection();
		
		str.append("<table class='table table-bordered'>");
		str.append("<tr>");
		str.append("<th style='width: 70px;'>부서번호</th>");
		str.append("<th style='width: 100px;'>부서이름</th>");
		str.append("<th style='width: 150px;'>지역명</th>");
		str.append("<th style='width: 200px;'>부서관리</th>");
		str.append("</tr>");
		
		for(DeptDTO dept : dao.lists())
		{
			str.append("<tr>");
			str.append("<td >" + dept.getDeptNo() + "</td>");
			str.append("<td>" + dept.getdName() + "</td>");
			str.append("<td>" + dept.getLoc() + "</td>");
			
			str.append("<td>");
			str.append("<a href='DeptUpdateForm.jsp?deptNo=" + dept.getDeptNo() + "'>");
			str.append("<button type='button' class='btn btn-primary btn-sm active'>수정</button>");
			str.append("</a>");
			
			str.append("<a href='javascript: deptDelete(" + dept.getDeptNo() + ", \"" + dept.getdName() + "\")'>");
			str.append("<button type='button' class='btn btn-default btn-sm active'>삭제</button>");
			str.append("</a>");
			
			str.append("</td>");
			str.append("</tr>");
		}
		
		str.append("</table>");
		
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
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeptSelect.jsp</title>

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

<script type="text/javascript">

	function deptDelete(deptNo, dName)
	{
		var res = confirm("부서번호 : " + deptNo + ", 부서이름 : " + dName + "\n이 부서의 정보를 삭제하시겠습니까?");
		
		if (res)
			window.location.href = "DeptDelete.jsp?deptNo=" + deptNo;
	}
	
</script>

</head>
<body>

<div class="container">
	<h1>부서 관리 및 출력 페이지</h1>
	<hr>
</div>

<div class="container">
	<a href="DeptInsertForm.jsp"><button type="button" class="btn btn-primary btn-lg active">신규 부서 등록</button></a>
	<a href="EmpSelect.jsp"><button type="button" class="btn btn-primary btn-lg active">처음으로</button></a>
	<br><br>
</div>

<div class="container">
	<!-- 리스트 출력 -->
	<%=str %>
</div>

</body>
</html>