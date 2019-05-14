<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	// 결과 값 변수
	String str = "";
	
	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비 (select)
	String sql = "SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, ROUND(((KOR+ENG+MAT)/3.0),1) AS AVG FROM TBL_SCORE";
	
	// 작업 객체 생성 및 준비된 쿼리문 수행
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	// 결과 ResultSet 에 대한 처리 → 반복문 구성
	str += "<table><tr><th id='numTitle'>번호</th><th id='nameTitle'>이름</th><th id='korTitle'>국어점수</th><th id='engTitle'>영어점수</th>"
			+ "<th id='matTitle'>수학점수</th><th id='totTitle'>총점</th><th id='avgTitle'>평균</th></tr>";
	while(rs.next())
	{
		str += "<tr>";
		str += "<td>" + rs.getString("SID") + "</td>";
		str += "<td>" + rs.getString("NAME") + "</td>";
		str += "<td>" + rs.getString("KOR") + "</td>";
		str += "<td>" + rs.getString("ENG") + "</td>";
		str += "<td>" + rs.getString("MAT") + "</td>";
		str += "<td>" + rs.getString("TOT") + "</td>";
		str += "<td>" + rs.getString("AVG") + "</td>";
		str += "</tr>";
	}
	str += "</table>";
	
	rs.close();
	stmt.close();
	DBConn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	input { width: 200px; }
	button { width: 200px; height: 50px; font-weight: bold; }
	.errMsg { font-size: small; color:red; display: none;}
	th { background-color: gray; color: white; }
	#numTitle { width: 50px; }
	#nameTitle { width: 100px; }
	#telTitle { width: 160px; }
</style>

<script type="text/javascript">
	
	function formCheck()
	{
		var uName = document.getElementById("name");
		var nMsg = document.getElementById("nameMsg");
		var nKor = document.getElementById("korMsg");
		var nEng = document.getElementById("engMsg");
		var nMat = document.getElementById("matMsg");
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
		
		if(uName.value == "")
		{
			nMsg.style.display = "inline";
			uName.focus();
			return false;
		}
		
		if (korStr.value == "" || isNaN(korStr.value) || kor<0 || kor>100)
		{
			nKor.style.display = "inline";
			korStr.focus();
			return false;
		}
		
		if (engStr.value == "" || isNaN(engStr.value) || eng<0 || eng>100)
		{
			nEng.style.display = "inline";
			engStr.focus();
			return false;
		}
		
		if (matStr.value == "" || isNaN(matStr.value) || mat<0 || mat>100)
		{
			nMat.style.display = "inline";
			matStr.focus();
			return false;
		} 
		
		/* if(korStr != null)
		{
			
			var kor = Number(korStr.value);
			if(kor<0 || kor>100)
			{
				alert("0 ~ 100 사이의 국어점수를 입력하세요");
				return false;
			}
		}
		
		if(engStr != null)
		{
			var eng = Number(engStr.value);
			if(eng<0 || eng>100)
			{
				alert("0 ~ 100 사이의 영어점수를 입력하세요");
				return false;
			}
		}
		
		if(matStr != null)
		{
			var mat = Number(matStr.value);
			if(mat<0 || mat>100)
			{
				alert("0 ~ 100 사이의 수학점수를 입력하세요");
				return false;
			}
		}  */
		
		return true;
	}
</script>

</head>
<body>

<div>
	<h1>데이터베이스 연결 및 데이터 처리</h1>
	<hr>
</div>

<div>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="name" name="name">
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="kor" name="kor"">
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