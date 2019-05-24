<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%	
    request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/main.css">
</head>
<body>
<!-- 
○ 실습 문제

   - Servlet 문제 → JSTL / EL 활용

     ·JSTL Core 를 활용하여 다음과 같은 기능을 포함하는 페이지를 구현한다.
     ·다섯 명의 회원 이름과 전화번호와 주소를 입력받아
       객체를 구성하고 그렇게 구성된 객체의 속성을 반복적으로 출력하는 기능을 갖는다.

   - MemberInsertForm.jsp 	→ 회원 정보 입력 페이지(5명 몽땅)
   - MemberDTO.java		→ 사용자 정의 자료형 클래스(1명의 회원 속성)
     com.test.core.MemberDTO
   - MemberInsert.jsp		→ 수신된 데이터로 컬렉션 구성
   - MemberList.jsp		→ 명단 출력 페이지
 -->

<div>
	<h1>회원 명단 출력</h1>
	<hr>
</div>

<div>
	<form action="MemberInsert.jsp" method="post">
		<%-- <table class="table">
			<tr>
				<th>이름</th>
				<td>
				<c:set var="i" value="1"></c:set>
				<c:forEach var="a" begin="1" end="5" step="1">
					<input type="text" name="name${i }">
					<c:set var="i" value="${i+1 }"></c:set>
				</c:forEach>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
				<c:set var="i" value="1"></c:set>
				<c:forEach var="a" begin="1" end="5" step="1">
					<input type="text" name="tel${i }">
					<c:set var="i" value="${i+1 }"></c:set>
				</c:forEach>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
				<c:set var="i" value="1"></c:set>
				<c:forEach var="a" begin="1" end="5" step="1">
					<input type="text" name="addr${i }">
					<c:set var="i" value="${i+1 }"></c:set>
				</c:forEach>
				</td>
			</tr>
		</table> --%>
	
	
		<c:forEach var="member" begin="1" end="5" step="1">
			이　　름 : <input type="text" class="txt" name="name"><br>
			전화번호 : <input type="text" class="txt" name="tel"><br>
			주　　소 : <input type="text" class="txt" name="addr"><br><br>
		</c:forEach> 
		
		<button type="submit" class="btn" style="width: 200px; font-size: 16pt;">입력</button>
	</form>
	
</div>

</body>
</html>