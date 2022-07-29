<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/default/header.jsp" %>
	<div align="center">
		<h1>${dto.id }님의 정보</h1><br>
		<h3>아이디 : ${dto.id }</h3><br>
		<h3>비밀번호 : ${dto.pw }</h3><br>
		<h3>주소 : ${dto.addr }</h3><br>
	</div>
	<%@include file="/WEB-INF/views/default/footer.jsp" %>
</body>
</html>