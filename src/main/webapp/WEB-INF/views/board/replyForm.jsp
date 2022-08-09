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
  function reply_chk(){
	  alert('게시글 작성을 완료하였습니다!')
	  replyform.submit()
  }
</script>
</head>
<body>
	<%@include file="/WEB-INF/views/default/header.jsp" %>	
	<div align="center">
		<form action="reply" id="replyform" method="post" enctype="multipart/form-data">
			<table border="1">
				<tr>
					<th>작성자</th><th><input type="text" name="id" readonly="readonly" value="${sessionScope.loginUser }"></th>
				</tr>
				<tr>
					<th>제목</th><th><input type="text" value="${dto.title }"></th>
				</tr>
				<tr>
					<th colspan="2">내용</th>
				</tr>
				<tr>
					<th colspan="2">
						<textarea rows="30" cols="20"></textarea>
					</th>
				</tr>
				<tr>
					<th colspan="2">이미지파일 첨부</th>
				</tr>
				<tr>
					<th colspan="2"><input type="file" id="file" name="file" onchange="readURL(this)"><img id="preview" alt="선택된 이미지가 없습니다." src="download?file=${dto.image_file_name }" width="100px" height="100px"></th>
				</tr>
				<tr>
					<th colspan="2"><button type="button" onclick="reply_chk()">답글달기</button> <button type="button" onclick="location.href='/root/board/boardAllList'">목록보기</button></th>
				</tr>
			</table>
		</form>
	</div>
	<%@include file="/WEB-INF/views/default/footer.jsp" %>
</body>
</html>