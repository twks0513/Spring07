<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
	alert('${sessionScope.loginUser }님 환영합니다')
	
		var time = 5				
		var Timer = setInterval(count,1000);
		function count(){
			console.log(time)
			document.getElementById("time").textContent = time;
			time--;
			if(time < 0){
				location.href='index'
			}
		}	
	
	</script>
</head>
<body onload="count()">
	<%@include file="/WEB-INF/views/default/header.jsp" %>
	<div align="center">	
	<h1>로그인 성공</h1>
	<span id="time"></span>초 후 index페이지로 이동합니다
	</div>
	<%@include file="/WEB-INF/views/default/footer.jsp" %>
</body>
</html>