<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckBox.jsp</title>
</head>
<body>

<div>
	<h1>JSP 데이터 송수신 실습</h1>
	<hr>
	<p>CheckBox.jsp ● → CheckBox_ok.jsp </p>
</div>

<div>
	<form action="CheckBox_ok.jsp" method="post">
		이름 <input type="text" name="name"><br>
		
		메모 <br>
		<textarea rows="5" cols="30" name="memo"></textarea>
		<br><br>
		
		이상형 <br>
		<label><input type="checkbox" name="checkGroup" value="아이유" >아이유</label>
		<label><input type="checkbox" name="checkGroup" value="에일리">에일리</label>
		<label><input type="checkbox" name="checkGroup" value="수지">수지</label>
		<br>
		<label><input type="checkbox" name="checkGroup" value="강동원">강동원</label>
		<label><input type="checkbox" name="checkGroup" value="차은우">차은우</label>
		<label><input type="checkbox" name="checkGroup" value="공유">공유</label>
		<br>
		
		<input type="submit" value="전송" class="btn"
		style="width: 200px;">
		
	</form>
</div>

</body>
</html>