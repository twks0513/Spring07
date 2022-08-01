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
		}else if(regiForm.addr1.value==null||regiForm.addr1.value==""){
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
						<td colspan="2"><input type="text" name="addr" id="addr1" readonly="readonly" onclick="daumPost()" placeholder="우편번호"><button type="button" onclick="daumPost()">우편번호찾기</button></td>
					</tr>
					<tr>
						<td colspan="2"><input type="text" name="addr" id="addr2" readonly="readonly" placeholder="주 소"><br>
						<input type="text" name="addr" id="addr3" placeholder="상 세 주 소" style="width: 257px;"></td>
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