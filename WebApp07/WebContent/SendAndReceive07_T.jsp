<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// ② 자기 자신 페이지로부터 데이터 수신 후 처리하는 부분(월을 바꿔도 년은 그대로여야 하므로 그 반대의 경우도 마찬가지)
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");
	
	// ① Canlendar 객체 생성
	//java.util.Calendar cal = Calendar.getInstance();
	// ↑ 이렇게 작성시 import 구문 없이도 객체를 생성하여 사용할 수 있음
	Calendar cal = Calendar.getInstance();
	
	//현재 년 월 일 수신
	int nowYear = cal.get(Calendar.YEAR);			//--2019	
	int nowMonth = cal.get(Calendar.MONTH)+1;		//--5
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);	//--13
	
	//최초의 페이지인경우 selectYear = nowYear 최초가 아닌경우 selectYear=sYear
	// ③ 표시할 달력의 년, 월 구성 → 페이지 최초 요정을 감안한 코드
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	// ④ 확인한 날짜로 년도 select option 구성 --------------------
	//<option value="2009">2009</option>
	//<option value="2010">2010</option>
	//<option value="2011">2011</option>
	//					:
	//<option value="2019" selected="selected">2019</option>
	//					:
	//<option value="2027">2027</option>
	//<option value="2028">2028</option>
	//<option value="2029">2029</option>

		
	// 페이지 최초 요청이 아닐 경우 → 수신한 데이터로 표시할 달력의 년, 월 구성
	if(sYear != null || sMonth != null)
	{s
		selectYear =  Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);
	}
	
	//옵션 만들기
	String yOptions = "";
	for (int year=(selectYear-10); year<=(selectYear+10); year++)
	{
		// 상황1. 페이지 최초 요청 → sYear 는 null, 현재 년도와 옵션 값이 같을 때
		// 상황2. 페이지 최초 요청 아닐 때
		// 상황3. 나머지
		if (sYear==null && year==nowYear)
		{
			yOptions += "<option value='"+year+"' selected='selected'>"+year+"</option>";
		}
		else if(sYear!=null && Integer.parseInt(sYear)==year)
		{
			yOptions += "<option value='"+year+"' selected='selected'>"+year+"</option>";
		}
		else
		{
			yOptions += "<option value='"+year+"'>"+year+"</option>";
		}			
		
	}
	
	String mOptions = "";
	
	for (int month=1; month<=12; month++)
	{
		// 상황1. 페이지 최초 요청 → sYear 는 null, 현재 년도와 옵션 값이 같을 때
		// 상황2. 페이지 최초 요청 아닐 때
		// 상황3. 나머지
		if(sMonth==null && month==nowMonth)
			mOptions += "<option value='"+month+"' selected='selected'>"+month+"</option>";
		else if(sMonth!=null && Integer.parseInt(sMonth)==month)
		{
			mOptions += "<option value='"+month+"' selected='selected'>"+month+"</option>";
		}
		else
		{
			mOptions += "<option value='"+month+"'>"+month+"</options>";
		}
		
	}
	// -------------------- ④ 확인한 날짜로 년도 select option 구성
	
	// ⑤ 그려야 할 달력의 1일이 무슨 요일인지 확인하기 위한 연산 ( 만년달력 )
	
	int[] months = {31,28,31,30,31,30,31,31,30,31,30,31};
	
	if (selectYear%4==0 && selectYear%100!=0 || selectYear%400==0)
	{
		months[1] = 29;
	}
	
	//총 날 수 누적 변수
	int nalsu;
	
	//요일 항목 배열 구성
	String[] weekName= {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	
	//현재 년도 - 입력받은년도의 이전 년도까지의 날 수 계산
	nalsu= (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;
	
	// 현재 월 → 입력받은 월의 이전 월까지의 날 수 추가
	for(int i=0; i<selectMonth-1 ; i++)
	{
		nalsu += months[i];
	}
	nalsu++;	//+1
	
	int week = nalsu%7;						//-- 요일 변수
	int lastDay = months[selectMonth-1];	//-- 마지막 날짜 변수
	
	// ⑥ 달력 그리기 ----------------------------------------------
	
	String calStr = "";
	
	calStr += "<table border='1'>";
	calStr += "<tr>";
	
	//달력 타이틀 그리기 (일월화수목금토)
	for(int i=0 ; i<weekName.length ; i++)
	{
		if(i==0)
			calStr += "<th style='color:red;'>" + weekName[i] + "</th>";
		else if(i==6)
			calStr += "<th style='color: blue;'>" + weekName[i] + "</th>";
		else
			calStr += "<th>" + weekName[i]+ "</th>";
				
	}
	calStr += "</tr>";
	
	// 날짜 찍기 시작
 	calStr += "<tr>";
	
	//빈 칸 공백 td발생
	for (int i=1 ; i<=week ; i++)
	{
		calStr += "<td></td>";
	}
	
	//날짜 td 발생
	for (int i=1; i<=lastDay ; i++)
	{
		week++;	// week%7==0이 토요일이 될 수 있도록 
		
		//calStr += "<td>"+ i +"<td>";
		
		if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==0)
			calStr += "<td class='nowSat'>" + i + "</td>";	//클래스 속성 지정하여 색깔 처리 할 수 있도록
		else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==1)
			calStr += "<td class='nowSun'>" + i + "</td>";
		else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay)
			calStr += "<td class='now'>" + i + "</td>";
		else if(week%7==0)	//일반 토요일
			calStr += "<td class='sat'>" + i + "</td>";
		else if(week%7==1)
			calStr += "<td class='sun'>" + i + "</td>";
		else
			calStr += "<td>" + i + "</td>";	
			
		if(week%7==0)	//개행
			calStr +="</tr><tr>";
	}
	
	//빈 칸 공백 td발생
	for (int i=0; i<=week ; i++, week++)
	{
		if(week%7==0)
			break;
			
		calStr += "<td></td>";
	}
	
	if(week%7!=0)
		calStr += "</tr>";
		
	
	calStr += "</table>";

	// ⑥ ---------------------------------------------- 달력 그리기
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">


<style type="text/css">
	td { text-align : right;}
	/* ⑥ */
	td.nowSat {background-color : aqua; font-weight: bold; color: blue;}	
	td.nowSun {background-color : aqua; font-weight: bold; color: red;}	
	td.now {background-color : aqua; font-weight: bold;}	
	td.sat {color: blue;}	
	td.sun {color: red;}	
</style>

<script type="text/javascript">
	
	/* ⑦ */
	function formCalendar(obj)
	{
		obj.submit();
	}

</script>

</head>
<body>

<!-- 
	○ 데이터 송수신 실습 07
		- 달력을 출력하는 JSP 페이지를 구성한다
		- 년도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다
		- 단, submit 버튼 없이 이벤트 처리를 한다
		- 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다
		- 년도 구성은 현재 년도 기준 10년, 이후 10년으로 구성한다
		- 월은 1월부터 12월까지로 구성한다
		
		[	2019 ▼	] 년 [  5 ▼ ] 월
		------------------------------
		------------------------------
		
		- 년도 select box나 월 select box의 내용 변화 시
		  해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다
		  
		- 사용자 최초 요청 주소는
		  『http://localhost:8090/WebApp07/SendAndReceive07.jsp』로 한다
		  
	○ SendAndReceive07.jsp
 -->

<div>
	<h1>데이터 송수신 실습07</h1>
	<hr>
</div>

<div>
	<h2>달력 출력하기</h2>
</div>

<div>
	<!-- form의 action 속성 값 생략 → 데이터와 수신처는 자기 자신 -->
	<form action="" method="post">
		<select id="year" name="year" onchange="formCalendar(this.form)">	<!-- ⑦onchange -->
			<%=yOptions %>
		</select> 년
		<select id="month" name="month" onchange="formCalendar(this.form)"> <!-- ⑦onchange -->
			<%=mOptions %>
		</select> 월
	</form>
</div>

<div>
	<!-- 달력을 그리게 될 지점 -->
	<br>
	<%=calStr %>

</div>
	
</body>
</html>