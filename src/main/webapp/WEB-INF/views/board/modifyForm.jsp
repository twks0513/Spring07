<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
function readURL(input) {
    var file = input.files[0] //파일에 대한 정보
    console.log(file)
    if (file != '') {
       var reader = new FileReader();
       reader.readAsDataURL(file); //파일의 정보를 토대로 파일을 읽고 
       reader.onload = function (e) { // 파일 로드한 값을 표현한다
        //e : 이벤트 안에 result값이 파일의 정보를 가지고 있다.
        console.log(e.target.result)
         $('#preview').attr('src', e.target.result);
        }
    }
}  
function modifychk(){
	alert('수정이 완료되었습니다!')
	modifyform.submit()
}
function deletechk(){
	alert('삭제가 완료되었습니다!')
	location.href='delete?file=${dto.image_file_name}&write_no=${dto.write_no}'
}
</script>
</head>
<body>
	<%@include file="/WEB-INF/views/default/header.jsp" %>
	<div align="center">
		<form action="modify" id="modifyform" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<th>글번호</th> <td><input type="text" readonly="readonly" name="write_no" value="${dto.write_no }"></td><th>작성자</th><td><input type="text" readonly="readonly" name="id" value="${dto.id }"></td>
			</tr>
			<tr>
				<th>제목</th><th><input type="text" name="title" value="${dto.title }"></th> <th>등록일자</th> <th><input type="text" readonly="readonly" name="savedate" value="${dto.savedate }"></th>			
			</tr>
			<tr>
				<th>내용</th><td><textarea rows="30" name="content" cols="20" >${dto.content }</textarea> </td>
				<th colspan="2"> <c:if test="${dto.image_file_name =='nan'}"> <img id="preview" alt="등록된 이미지가 없습니다" src="download?file=${dto.image_file_name }" width="100px" height="100px"> </c:if>
				<c:if test="${dto.image_file_name !='nan'}"><img id="preview" src="download?file=${dto.image_file_name }" width="100px" height="100px"></c:if><br>
				<input type="file" name="file" onchange="readURL(this)">
				<input type="hidden" value="${dto.image_file_name }" name="origin">
				</th>
			</tr>
			<tr>
				<th colspan="4">
					<c:if test="${sessionScope.loginUser == dto.id }">
						<button type="button" onclick="modifychk()">수정하기</button> <button type="button" onclick="deletechk()">삭제하기</button>
					</c:if>				
				<button type="button" onclick="location.href='replyForm'">답글달기</button> <button type="button" onclick="location.href='/root/board/boardAllList'">리스트로 돌아가기</button> </th>
			</tr>
		</table>
		</form>
	</div>
	<%@include file="/WEB-INF/views/default/footer.jsp" %>
</body>
</html>