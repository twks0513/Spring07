<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function deletechk(){
	alert('삭제가 완료되었습니다!')
	location.href='delete?file=${dto.image_file_name}&write_no=${dto.write_no}'
}
</script>
</head>
<body>
	<%@include file="/WEB-INF/views/default/header.jsp" %>
	<div align="center">
		<table border="1">
			<tr>
				<th>글번호</th> <td>${dto.write_no }</td><th>작성자</th><td>${dto.id }</td>
			</tr>
			<tr>
				<th>제목</th><th>${dto.title }</th> <th>등록일자</th> <th>${dto.savedate }</th>			
			</tr>
			<tr>
				<th>내용</th><td>${dto.content }</td><th colspan="2"> <c:if test="${dto.image_file_name =='nan'}">등록된 이미지가 없습니다.</c:if> <c:if test="${dto.image_file_name !='nan'}"><img alt="등록된 이미지가 없습니다" src="download?file=${dto.image_file_name }" width="100px" height="100px"></c:if> </th>
			</tr>
			<tr>
				<th colspan="4">
					<c:if test="${sessionScope.loginUser == dto.id }">
						<button type="button" onclick="location.href='modifyForm?title=${dto.title}&write_no=${dto.write_no }'">수정하기</button> <button type="button" onclick="deletechk()">삭제하기</button>
					</c:if>				
				<button type="button" onclick="location.href='replyForm?title=${dto.title}&write_no=${dto.write_no }'">답글달기</button> <button type="button" onclick="location.href='/root/board/boardAllList'">리스트로 돌아가기</button> </th>
			</tr>
		</table>
	</div>
	<%@include file="/WEB-INF/views/default/footer.jsp" %>
	
</body>
</html>