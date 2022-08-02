<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#loginbtn{padding: 12px;}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/default/header.jsp" %>
	<div align="center">
	<h1>로그인 페이지입니다</h1>
		<form action="user_check" method="post">
			<table>
				<tr>
					<td><input type="text" name="id" placeholder="아이디"></td><td rowspan="2"><input type="submit" id="loginbtn" value="로그인"></td>
				</tr>
				<tr>
					<td><input type="text" name="pw" placeholder="비밀번호"></td>
				</tr>
				<tr>
					<td><input type="checkbox" name="AutoLogin">자동 로그인 </td><td><a href="register">회원가입</a></td>
				</tr>
			</table>
		</form>
	</div>
	<%@include file="/WEB-INF/views/default/footer.jsp" %>
</body>
</html>