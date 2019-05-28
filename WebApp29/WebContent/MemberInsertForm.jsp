<%@ page contentType="text/html; charset=UTF-8" %>
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
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main">
<script type="text/javascript">
	function memberSubmit()
	{
		// 테스트
		//alert("정상 호출 !!");
		
		var memberForm = document.getElementById("memberForm");
		
		var id = document.getElementById("id");
		var idMsg = document.getElementById("idMsg");
		
		idMsg.style.display = "none";
		
		if (id.value == "")
		{
			idMsg.style.display = "inline";
			id.focus();
			return;
		}
		
		// form 을 직접 지정하여 submit 액션 수행
		memberForm.submit();
	}
	
	function memberReset()
	{
		var memberForm = document.getElementById("memberForm");
		var id = document.getElementById("id");
		var idMsg = document.getElementById("idMsg");
		
		idMsg.style.display = "none";
		
		// form 을 직접 지정하여 reset 액션 수행
		memberForm.reset();
		
		id.focus();
	}
</script>
</head>
<body>

<div>
	<h1>회원 입력 페이지</h1>
	<h2>MemberInsertForm.jsp</h2>
	<hr>
</div>

<div>
	<form action="MemberInsert.jsp" method="post" id="memberForm"> 
		<table class="table">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="id" id="id">
				</td>
				<td>
					<span class="errMsg" id="idMsg">아이디를 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pw"></td>
				<td></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"></td>
				<td></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="tel"></td>
				<td></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="email"></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2"><button type="submit" class="btn" style="width: 100%; font-size: 16pt;">입력하기</button></td>
			</tr>
		</table>
		<br>
		<a href="javascript:memberSubmit()"><button type="button">입력하기</button></a>
		<a href="javascript:memberReset()"><button type="button">취소하기</button></a>
		<a href="MemberSelect.jsp"><button type="button">목록으로</button></a>
	</form>
</div>

</body>
</html>