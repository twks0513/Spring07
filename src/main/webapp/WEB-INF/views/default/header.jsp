<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
			uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" 
		value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	* { margin: 0; }
	.wrap { width: 1000px; margin: auto; }
	.header { width: 1000px; }
	.navdiv { width: 100%; background-color: olive; }
	nav { background-color: olive; width: 1000px;}
	nav ul { list-style: none; display: flex;
			justify-content: end; }
	nav ul li { padding: 10px; }
	
	nav ul li a { text-decoration:none; color:white; }
	nav ul li a:hover{
	color: orange; border-bottom: 2px solid black;
	transition : all 0.25s; padding-bottom: 3px;
	}
	.title{ text-shadow: 10px 10px 15px black; 
		font-size: 70pt;
		text-align: center;
		margin-top: 0; 
		padding-bottom: 20px;
		color: burlywood;
		font-family: Gabriola;
	}
	.content { margin-top: 50px; }
</style>
<script type="text/javascript">
	function logout(){
		alert('로그아웃 되었습니다')
	}
	function needLogin(){
		alert('로그인 후 이용 가능합니다')
	}
</script>

</head>
<body>
	<div class="wrap">
		<div class="header">
			<h1 class="title">CARE LAB</h1>
		</div>
	</div>
	<div class="navdiv">
		<div class="wrap">
			<nav>
				<ul>
					<li> <a href="${contextPath }/member/index">HOME</a> </li>
					<c:choose>
						<c:when test="${sessionScope.loginUser == null }">
							<li> <a href="${contextPath }/member/login" onclick="needLogin()">회원 정보</a> </li>
							<li> <a href="${contextPath }/member/login">LOGIN</a> </li>
						</c:when>
						<c:when test="${sessionScope.loginUser != null}">
							<li> <a href="${contextPath }/member/memberInfo">회원 정보</a> </li>
							<li> <a href="${contextPath }/member/logout" onclick="logout()">LOGOUT</a> </li>
						</c:when>
					</c:choose>
					
					
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>










