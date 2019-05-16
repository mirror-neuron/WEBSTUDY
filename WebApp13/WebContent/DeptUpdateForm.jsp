<%@page import="com.test.DeptDTO"%>
<%@page import="com.test.DeptDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	String deptNo = request.getParameter("deptNo");
	String dName = "";
	String loc = "";
	
	DeptDAO dao = new DeptDAO();
	
	try
	{
		dao.connection();
		
		DeptDTO dept = dao.searchDept(deptNo);
		dName = dept.getdName();
		loc = dept.getLoc();
		
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
<title>DeptUpdateFotm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">

<script type="text/javascript">

	function deptSubmit()
	{
		var deptForm = document.getElementById("deptForm");
		
		var dName = document.getElementById("dName");
		var loc = document.getElementById("loc");
		var nameMsg = document.getElementById("nameMsg");
		var locMsg = document.getElementById("locMsg");
		
		nameMsg.style.display = "none";
		locMsg.style.display = "none";
		
		if (dName.value == "")
		{
			nameMsg.style.display = "inline";
			dName.focus();
			return;
		}
		
		if (loc.value == "")
		{
			locMsg.style.display = "inline";
			loc.focus();
			return;
		}
		
		deptForm.submit();
	}
	
	function deptReset()
	{
		var deptForm = document.getElementById("deptForm");
		var dName = document.getElementById("dName");
		var nameMsg = document.getElementById("nameMsg");
		var locMsg = document.getElementById("locMsg");
		
		nameMsg.style.display = "none";
		locMsg.style.display = "none";
		
		deptForm.reset();
		
		dName.focus();
	}

</script>
</head>
<body>

<div>
	<h1>부서 명단 관리 및 수정 페이지</h1>
	<hr>
</div>

<div>
	<a href="DeptSelect.jsp"><button type="button">부서 명단 관리</button></a>
	<br><br>
</div>

<div>
	<form action="DeptUpdate.jsp?deptNo=<%=deptNo%>" method="post" id="deptForm">
		<table class="table">
			<tr>
				<th>부서이름(*)</th>
				<td>
					<input type="text" id="dName" name="dName" value="<%=dName%>">
				</td>
				<td>
					<span class="errMsg" id="nameMsg">부서이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>지역명(*)</th>
				<td>
					<input type="text" id="loc" name="loc" value="<%=loc%>">
				</td>
				<td>
					<span class="errMsg" id="locMsg">지역명을 입력해야 합니다.</span>
				</td>
			</tr>
		</table>
		<br>
		<a href="javascript:deptSubmit()"><button type="button">수정하기</button></a>	
		<a href="javascript:deptReset()"><button type="button">취소하기</button></a>
		<a href="DeptSelect.jsp"><button type="button">목록으로</button></a>
	</form>
</div>

</body>
</html>