<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function regichk(){
		if(regiForm.id.value==null||regiForm.id.value==""){
			alert('아이디는 필수 정보입니다')
			regiForm.id.focus()
		}else if(regiForm.pw.value==null||regiForm.pw.value==""){
			alert('비밀번호는 필수 정보입니다')
			regiForm.pw.focus()
		}else if(regiForm.addr.value==null||regiForm.addr.value==""){
			alert('주소는 필수 정보입니다')
			regiForm.addr.focus()
		}else{
			alert('회원가입에 성공했습니다!')
			regiForm.submit()
		}
	}
</script>
</head>
<body>
	<%@include file="/WEB-INF/views/default/header.jsp" %>
		<div align="center">
			<h1>회원가입</h1>
			<form action="regist" id="regiForm" method="post">
				<table border="1">
					<tr>
						<td><input type="text" name="id" placeholder="아이디"></td>
					</tr>
					<tr>
						<td><input type="text" name="pw" placeholder="비밀번호"></td>
					</tr>
					<tr>
						<td><input type="text" name="addr" placeholder="주소"></td>
					</tr>
					<tr>
						<td><hr></td>
					</tr>
					<tr>
						<td><button type="button" onclick="regichk()">회원가입</button></td>
					</tr>
				</table>
			</form>
		</div>
	<%@include file="/WEB-INF/views/default/footer.jsp" %>
</body>
</html>