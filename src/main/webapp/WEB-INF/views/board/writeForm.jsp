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
  function write_chk(){
	  alert('게시글 작성을 완료하였습니다!')
	  writeform.submit()
  }
</script>
</head>
<body>
	<%@include file="/WEB-INF/views/default/header.jsp" %>
	<div align="center">
		<h1>글쓰기</h1>
			<form action="write" id="writeform" method="post" enctype="multipart/form-data">
			<table border="1">
				<tr>
					<th colspan="2">작성자</th>
				</tr>
				<tr>
					<th colspan="2"><input type="text" id="id" name="id" readonly="readonly" value="${sessionScope.loginUser }"></th>
				</tr>
				<tr>
					<th colspan="2">제목</th>
				</tr>
				<tr>
					<th><input type="text" id="title" name="title"></th>
				</tr>
				<tr>
					<th colspan="2">내용</th>
				</tr>
				<tr>
					<th colspan="2"><textarea id="content" name="content" cols="30" rows="20"></textarea></th>
				</tr>
				<tr>
					<th colspan="2">이미지파일 첨부</th>
				</tr>
				<tr>
					<th colspan="2"><input type="file" id="file" name="file" onchange="readURL(this)"><img id="preview" alt="선택된 이미지가 없습니다." src="" width="100px" height="100px"></th>
				</tr>
				<tr>
					<th colspan="2"><button type="button" onclick="write_chk()">글쓰기</button> <button type="button" onclick="location.href='/root/board/boardAllList'">목록보기</button></th>
				</tr>
			</table>							
			</form>
	</div>
	<%@include file="/WEB-INF/views/default/footer.jsp" %>
	
</body>
</html>