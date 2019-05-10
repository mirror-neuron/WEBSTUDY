<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 데이터 수신(SendAndReceive07.jsp →SendAndReceive07.jsp)
	int year = Integer.parseInt(request.getParameter("year"));
	int month = Integer.parseInt(request.getParameter("month"));
	
	
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">
	
	function formChange()
	{
		var String year = document.getElementById("userYear");
		var String month = document.getElementById("userMonth");
	}
	
</script>

</head>
<body>

<!--  
	○ 데이터 송수신 실습 07
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	   - 년도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	   - 단, submit 버튼 없이 이벤트 처리를 한다.
	   - 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다.
	   - 년도 구성은 현재 년도 기준 이전 10년, 이후 10년으로 구성한다.
	   - 월은 1월 부터 12월 까지로 구성한다.
	   
	   [  2019 ▼ ]년 [  5 ▼ ]월
	   
	   -------------------------- 
	   --------------------------
	   
	   - 년도 select box 나 월 select box 의 내용 변화 시
	     해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다.
	   
	   - 사용자 최초 요청 주소는
	     『http://localhost:8090/WebApp07/SendAndReceive07.jsp』로 한다.
	   
	   ○ SendAndReceive07.jsp
-->


<div>
	<h1>데이터 송수신 실습 07</h1>
	<hr>
</div>

<div>
	<form method="post">
		<select id="year" name="year" onchange="formChange()">
			<option value="2019">2019</option>	
			<option value="2018">2018</option>
			<option value="2017">2017</option>
			<option value="2016">2016</option>
			<option value="2015">2015</option>
			<option value="2014">2014</option>
			<option value="2013">2013</option>
			<option value="2012">2012</option>
			<option value="2011">2011</option>
			<option value="2010">2010</option>
		</select>
		<select id="month" name="month" onchange="formChange()">
			<option value="12">12</option>
			<option value="11">11</option>
			<option value="10">10</option>
			<option value="9">9</option>
			<option value="8">8</option>
			<option value="7">7</option>
			<option value="6">6</option>
			<option value="5">5</option>
			<option value="4">4</option>
			<option value="3">3</option>
			<option value="2">2</option>
			<option value="1">1</option>
		</select>
	</form>
</div>

<div>
	<h2>달력 출력 : <%=temp1 %><%=temp2 %></h2>
	
</div>


</body>
</html>