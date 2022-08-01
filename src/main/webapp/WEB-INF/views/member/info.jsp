<%@page import="com.care.root.member.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.lang.String.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function updatechk(){
		if(updateForm.pw.value==null||updateForm.pw.value==""){
			alert('비밀번호는 필수 정보입니다')
			updateForm.pw.focus()
		}else if(updateForm.addr1.value==null||updateForm.addr1.value==""){
			alert('주소는 필수 정보입니다')
		}else{
			updateForm.submit()
		}
	}
</script>
</head>
<body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function daumPost(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
           console.log(data.zonecode) 
           console.log(data.userSelectedType)           
           console.log(data.jibunAddress) 
           console.log(data.roadAddress)
           
           document.getElementById("addr1").value = data.zonecode
           if(data.userSelectedType== 'R'){
        	   var addr = data.roadAddress
           }else{
        	   var addr = data.jibunAddress        	   
           }
           document.getElementById("addr2").value = addr
           document.getElementById("addr3").focus()
        }
    }).open();
}


</script>
	<%@include file="/WEB-INF/views/default/header.jsp" %>
	<div align="center">
		<h1>${dto.id }님의 정보</h1><br>
		<form action="update?id=${param.id }pw=${param.pw}addr=${param.addr}" method="get" name="updateForm">
			<table border="1">
				<tr>
					<td>아이디</td><td><input type="text" name="id" readonly="readonly" value="${dto.id }"></td>
				</tr>
				<tr>
					<td>비밀번호</td><td><input type="password" name="pw"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" name="addr" id="addr1" readonly="readonly" value="${dto.addr.split(',')[0] }" onclick="daumPost()" placeholder="우편번호"><button type="button" onclick="daumPost()">우편번호찾기</button></td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" name="addr" id="addr2" readonly="readonly" value="${dto.addr.split(',')[1] }" placeholder="주 소"><br>
					<input type="text" name="addr" id="addr3" placeholder="상 세 주 소" style="width: 257px;"></td>
				</tr>
			</table>
		</form>
 		<c:choose>
			<c:when test="${sessionScope.loginUser == param.id}">
			<button onclick="location.href='delete?id=${dto.id }'">회원탈퇴</button> <button onclick="updatechk()">정보수정</button>				
			</c:when>
			<c:otherwise>
			<button disabled="disabled" onclick="location.href='delete?id=${dto.id }'">회원탈퇴</button> <button disabled="disabled" onclick="updatechk()">정보수정</button>							
			</c:otherwise>
		</c:choose> 
	</div>
	<%@include file="/WEB-INF/views/default/footer.jsp" %>
</body>
</html>