<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert('${sessionScope.loginUser }님 환영합니다')
</script>
</head>
<body>
	<%@include file="/WEB-INF/views/default/header.jsp" %>
	<div align="center">
	session : ${sessionScope.loginUser }	
	<h1>로그인 성공</h1>
	</div>
	<%@include file="/WEB-INF/views/default/footer.jsp" %>
</body>
</html>