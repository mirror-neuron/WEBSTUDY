<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	ScoreDAO dao = null;
	
	String scoreCount = "<span id='scoreCount'>전체 인원 수 : ";
	
	try
	{
		dao = new ScoreDAO();
		
		scoreCount += dao.count() + "명</span>";
		
		str.append("<table class='table'>");
		str.append("<tr><th>번호</th><th>이름</th><th>국어점수</th><th>영어점수</th><th>수학점수</th>"
		         + "<th>총점</th><th>평균</th></tr>");
		
		for(ScoreDTO score : dao.lists())
		{
			str.append("<tr>");
			str.append("<td class='record'>" + score.getSid() + "</td>");
			str.append("<td class='record'>" + score.getName() + "</td>");
			str.append("<td class='record'>" + score.getKor() + "</td>");
		}
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}

	Connection conn = DBConn.getConnection();
	
	String sql = "SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, ROUND(((KOR+ENG+MAT)/3.0),1) AS AVG FROM TBL_SCORE";
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	input { width: 200px;}
	button { width: 200px; height: 50px; font-weight: bold; }
	.errMsg { font-size: small; color:red; display: none;}
	th { background-color: gray; color: white; }
	#numTitle { width: 50px; }
	#nameTitle { width: }
</style>

<script type="text/javascript">
	
	function formCheck()
	{
		var uNam = document.getElementById("name");
		var nMsg = document.getElementById("nameMsg");
		var nKor = document.getElementById("nameKor");
		var nEng = document.getElementById("nameEng");
		var nMat = document.getElementById("nameMat");
		
		var korStr = document.getElementById("kor");
		var engStr = document.getElementById("eng");
		var matStr = document.getElementById("mat");
		
		var kor = Number(korStr.value);
		var eng = Number(engStr.value);
		var mat = Number(matStr.value);
		
		nMsg.style.display = "none";
		nKor.style.display = "none";
		nEng.style.display = "none";
		nMat.style.display = "none";
		
		if (uName.value == "")
		{
			nMsg.style.display = "none";
			uName.focus();
			return false;
		}
		if (korStr.value == "" || isNaN(korStr.value) || kor<0 || kor>100)
		{
			nKor.style.display = "none";
			korStr.focus();
			return false;
		}
		if (engStr.value == "" || isNaN(engStr.value) || eng<0 || eng>100)
		{
			nEng.style.display = "none";
			engStr.focus();
			return false;
		}
		if (matStr.value == "" || isNaN(matStr.value) || mat<0 || mat>100)
		{
			nMat.style.display = "none";
			matStr.focus();
			return false;
		}
		
		return true;
		
	}
	
</script>

</head>
<body>

<div>
	<h1>큰 주제</h1>
	<hr>
</div>

<div>
	<p>작은주제</p>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>	
					<input type="text" id="name" name="name">
					<span class="errMsg" id="nameMsg">이름을 입력해주세요.</span>
 				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="kor" name="kor">
					<span class="errMsg" id="korMsg">0 ~ 100 사이의 점수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="eng" name="eng">
					<span class="errMsg" id="engMsg">0 ~ 100 사이의 점수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="mat" name="mat">
					<span class="errMsg" id="matMsg">0 ~ 100 사이의 점수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" id="btnAdd" class="btn">성적 추가</button>
				</td>
			</tr>
		</table>
	</form>
	<br><br>
	
	<div>
		<%=str %>
	</div>
</div>

</body>
</html>