<%@page import="com.test.DeptDAO"%>
<%@page import="com.test.DeptDTO"%>
<%@page import="com.test.EmpDTO"%>
<%@page import="com.test.EmpDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String empno = request.getParameter("empno");
	String name = "";
	String hiredate = "";
	String deptno = "";
	String jobMgr = "";
	
	EmpDAO dao = new EmpDAO();
	DeptDAO deptdao = new DeptDAO();

	try
	{
		dao.connection();
		
		EmpDTO emp = dao.searchEmp(empno);
		name = emp.getEname();
		hiredate = emp.getHiredate();
		deptno = emp.getDeptno();
		
		

		
		
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
<title>EmpUpdateForm.jsp</title>
<script type="text/javascript">

	function empSubmit()
	{
		var empForm = document.getElementById("empForm");
		
		var name = document.getElementById("name");
		var dept = document.getElementById("dept");
		
		
		var nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display = "none";
		
		if (name.value == "")
		{
			nameMsg.style.display = "inline";
			name.focus();
			return;
		}
		
		empForm.submit();
		
	}
	
	function empReset()
	{
		var empForm = document.getElementById("empForm");
		var name = document.getElementById("name");
		var nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display = "none";
		
		empForm.reset();
		name.focus();
		
	}


</script>

</head>
<body>
<!-- http://localhost:8090/WebApp13/EmpUpdateForm.jsp -->
<div>
	<h1>회원 수정 페이지</h1>
	<hr>
</div>

<div>
	<a href="EmpSelect.jsp"><button type="button">회원 목록 페이지로</button></a>
</div>
<br>
<div>
	<!-- 회원 정보 수정 폼 구성 -->
	<form action="EmpUpdate.jsp?Empno=<%=empno%>" method="post" id="empForm">
		<table class="table">
			<tr>
            <th>이름</th>
            <td colspan="2">
               <input type="text" id="name" name="name" value="<%=name%>">
            </td>
            <td>
               <span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
            </td>
         </tr>
         <tr>
            <th>입사일</th>
            <td><%-- <%=dateStr %> --%></td>
            <td>
            </td>
         </tr>
         <tr>
            <th>부서</th>
            <td>
               <select id="dept" name="dept">
                  <%
                   for (DeptDTO deptD : deptdao.lists())
                     {
                	   if(deptD.getDeptNo() == deptno)
                	   {
                     		%> <option value="<%=deptD.getdName()%>" selected="selected"><%=deptD.getdName()%></option> <% 
                	   }
                	   else
                	   {
                            %> <option value="<%=deptD.getdName()%>"><%=deptD.getdName()%></option>
                	<% }
                     }
                  %>
                  <!-- <option value="ACCOUNTING">ACCOUNTING</option>
                  <option value="RESEARCH">RESEARCH</option>
                  <option value="SALES">SALES</option>
                  <option value="OPERATIONS">OPERATIONS</option> -->
               </select>
            </td>
         </tr>
          <tr>
            <th>직업</th>
            <td>
               <select id="mgr" name="mgr">
                  <option value='0'>==직업 선택==</option>
                  <option value="CLERK">CLERK</option>
                  <option value="SALESMAN">SALESMAN</option>
                  <option value="ANALYST">ANALYST</option>
                  <option value="MANAGER">MANAGER</option>
               </select>
            </td>
            
         </tr>
         <tr>
            <th>매니저</th>
            <td colspan="2"><%=jobMgr %></td>
            <td>
            </td>
         </tr>
         <tr>
            <th>입사일</th>
            <td></td>
            <td>
            </td>
         </tr>
         <tr>
            <th>급여</th>
            <td ></td>
            <td>
            </td>
         </tr>
         <tr>
            <th>수당</th>
            <td></td>
            <td>
            </td>
         </tr>
		</table>
		<br>
		<a herf="javascript:empSubmit()"><button type="button">수정하기</button></a>
		<a herf="javascript:empReset()"><button type="button">취소하기</button></a>
		<a herf="EmpSelect.jsp"><button type="button">돌아가기</button></a>
	</form>
</div>
</body>
</html>