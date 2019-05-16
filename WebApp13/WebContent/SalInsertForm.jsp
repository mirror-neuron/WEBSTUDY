<%@page import="com.test.SalDTO"%>
<%@page import="com.test.SalDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 데이터 수신
	String grade = request.getParameter("grade");
	
	SalDAO dao = new SalDAO();
	
	try
	{
		dao.connection();
		
		SalDTO sal = dao.search(grade);
		grade = sal.getGrade();

	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
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
<title>SalInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MainScore.css">

<script type="text/javascript">


	function SalSubmit() 
	{
		var SalForm = document.getElementById("SalForm");
		
		var losal = document.getElementById("losal");
		var hisal = document.getElementById("hisal");
		
		var losalMsg = document.getElementById("losalMsg");
		var hisalMsg = document.getElementById("hisalMsg");
		
		losalMsg.style.display = "none";
		hisalMsg.style.display = "none";
	
		if (losal.value=="" || isNaN(losal.value) || Number(losal.value)<0 || Number(losal.value)> Number(Hisal.value))
		{
			losalMsg.style.display = "inline";
			losal.focus();
			return;
		}
		
		if (hisal.value=="" || isNaN(hisal.value) || Number(hisal.value)<0 || Number(hisal.value) < Number(losal.value))
		{
			hisalMsg.style.display = "inline";
			hisal.focus();
			return;
		}
		
		SalForm.submit();
	}
	
	function SalReset()
	{

		var SalForm = document.getElementById("SalForm");
		
		var losal = document.getElementById("losal");
		var hisal = document.getElementById("hisal");
		
		var losalMsg = document.getElementById("losalMsg");
		var hisalMsg = document.getElementById("hisalMsg");
		
		losalMsg.style.display = "none";
		hisalMsg.style.display = "none";
	
		// form 을 직접 지정하여 reset 액션 수행
		SalForm.reset();
		losal.focus();
	}
	
</script>

</head>
<body>


<!-- http://localhost:8090/WebApp13/SalInsertForm.jsp -->
<div>
	<h1>급여 등급 관리 및 입력 페이지</h1>
	<hr>
</div>


<div>
	<a href="MemberScoreSelect.jsp"><button type="button">회원 성적 관리</button></a>
	<br><br>
</div>

<br>

<div>
	<!-- 급여 등급 입력 폼 구성  -->	
	<form action="SalInsert.jsp?grade=<%=grade%>" method="post" id="SalForm">
		<table class= "table">
			<tr>
				<th>등급</th>
				<td>
					<!-- 1 -->
					<%=grade %>
				</td>
				<td></td>
			</tr>
			<tr>
				<th>최저급여</th>
				<td>
					<input type="text" id="losal" name="losal" class="txtSal">
				</td>
				<td>
					<span class="errMsg" id="losalMsg">
						0 이상, 최고급여 이하의 급여를 입력해야 합니다.
					</span>
				</td>
			</tr>
				<tr>
				<th>최고급여</th>
				<td>
					<input type="text" id="hisal" name="hisal" class="txtSal">
				</td>
				<td>
					<span class="errMsg" id="hisalMsg">
						0 이상, 최저급여 이상의 급여를 입력해야 합니다.
					</span>
				</td>
			</tr>
		</table>
		<br>
		<a href="javascript:SalSubmit()"><button type="button">입력하기</button></a>
		<a href="javascript:SalReset()"><button type="button">취소하기</button></a>
		<a href="SalSelect.jsp"><button type="button">목록으로</button></a>
	</form>
</div>


</body>
</html>