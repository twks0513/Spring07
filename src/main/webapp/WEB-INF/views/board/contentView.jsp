<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#reptable{width: 100%}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

function deletechk(){
	alert('삭제가 완료되었습니다!')
	location.href='delete?file=${dto.image_file_name}&write_no=${dto.write_no}'
}
function slideClick(){
	$("#first").slideDown("slow");
	$("#modal_wrap").show();
}
function slide_hide(){
	$("#title").val("");
	$("#content").val("");
	
	$("#first").hide();
	$("#modal_wrap").hide();
	
}
function rep(){
	let form = {}
	let arr = $("#frm").serializeArray();
	for(i=0; i<arr.length;i++){
		form[arr[i].name] = arr[i].value
	}
	$.ajax({
		url : "addReply", type : "post",
		data : JSON.stringify(form),
		contentType : "application/json;charset=utf-8",
		success : function(){
			alert("답글이 달렸습니다");			
			slide_hide();
			replyData();
		}
	})
}

function deleteRep(){
	$.ajax({
		url : "deleteRep?write_no=${dto.write_no}&title="+$("#repTitle").val(), type : "get",
		contentType: "application/json;charset=utf-8",
		success : function(){
			alert("답글이 삭제되었습니다.");
			location.reload();
		},
		error : function(){
			alert("삭제 실패!");
			location.reload();
		}
	})
}

function replyData(){
	$.ajax({
		//url : "replyData?write_no=${dto.write_no}"
		//컨트롤러 매개변수 int write_no 받으면 된다.
		url : "replyData/"+${dto.write_no}, type : "get",
		dataType : "json",
		success : function(rep){
			let html=""
			for(i=0;i<rep.length;i++){
				let loginUser = '${sessionScope.loginUser}'
				let date = new Date(rep[i].write_date)
				let wd = date.getFullYear()+"/";
				wd+=(date.getMonth()+1)+"/";
				wd+=(date.getDate())+" ";
				wd+=(date.getHours())+":";
				wd+=(date.getMinutes())+":";
				wd+=(date.getSeconds());

				
				html +="<div align='left'><table border='1' id='reptable'><tr><th>아이디</th><td>"+rep[i].id+"</td></tr>"
				html +="<tr><th>작성일 </th><td>"+wd+"</td></tr>"
				html +="<tr><th>제목</th><td>"+rep[i].title+"</td></tr>"
				html +="<tr><th>내용</th><td>"+rep[i].content+"</td></tr>"
				if(loginUser==rep[i].id){					
					html +="<tr><th colspan='2'><button type='button' title='"+rep[i].title+"' value='"+rep[i].title+"' onclick='deleteRep()''>답글삭제</button></th></tr></table></div>"
				}
				//답글삭제 해야함
								
			}
			$("#reply").html(html)
		}
	})
}
replyData()
</script>
<style type="text/css">
	#modal_wrap{position: fixed; z-index: 9;margin: auto; display:none;
	 top:0; left: 0; right: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.4)
	}
	#first{position: fixed; z-index: 10;margin: auto; display:none;
	 top:30px; left: 0; right: 0; width: 350px; height: 450px; background-color: white;
	}
</style>
</head>
<body>
	<%-- <div id="modal_wrap">
		<div id="first">
			<div style="width: 250px; margin: auto; padding-top: 20px;">
				<form id="frm">
					<input type="hidden" name="write_no" value="${dto.write_no }">
					<b>답글 작성 페이지</b><hr>
					<b>작성자 : </b>${sessionScope.loginUser }<hr>
					<b>제목</b><br>
					<input type="text" id="title" name="title" size="30"><hr>
					<b>내용</b><br>
					<textarea rows="5" cols="30" name="content" id="content"></textarea>
					<hr>
					<button type="button" onclick="rep()">답글달기</button>
					<button type="button" onclick="slide_hide()">취소</button>
				</form>
			</div>
		</div>
	</div> --%>
	<%@include file="/WEB-INF/views/default/header.jsp" %>
	<div align="center">
	<form id="frm">
		<table border="1">
			<tr>
				<th>글번호</th> <td>${dto.write_no }</td><th>작성자</th><td>${dto.id }</td>
			</tr>
			<tr>
				<th>제목</th><th>${dto.title }</th> <th>등록일자</th> <th>${dto.savedate }</th>			
			</tr>
			<tr>
				<th colspan="4">내용</th>
			</tr>
			<tr>
				<td colspan="4" height="100px">${dto.content }</td>
			</tr>
			<tr>
				<th colspan="4"> 
					<c:if test="${dto.image_file_name =='nan'}">등록된 이미지가 없습니다.</c:if> 
					<c:if test="${dto.image_file_name !='nan'}">
						<img alt="등록된 이미지가 없습니다" src="download?file=${dto.image_file_name }" width="100px" height="100px">
					</c:if> 
				</th>
			</tr>
			<tr>
				<th colspan="4">
					<c:if test="${sessionScope.loginUser == dto.id }">
						<button type="button" onclick="location.href='modifyForm?title=${dto.title}&write_no=${dto.write_no }'">수정하기</button> <button type="button" onclick="deletechk()">삭제하기</button>
					</c:if>	
			</tr>
			<tr>
				<th colspan="4">답글달기</th>
			</tr>
			<tr>
			<td colspan="4">
			<input type="hidden" name="write_no" value="${dto.write_no }">
			<b>제목</b><br><input type="text" id="title" name="title" size="57" ><br><b>답글</b><br><textarea rows="3" cols="55" name="content" id="content"></textarea><br>
					<button type="button" onclick="rep()">답글달기</button> <button type="button" onclick="location.href='/root/board/boardAllList'">리스트로 돌아가기</button>
				</td>					
			</tr>						
			<tr>
				<th colspan="4">답글 목록</th>
			</tr>
			<tr>
				<td colspan="4">
					<div id="reply"></div>
				</td>
			</tr>
		</table>
	</form>
	</div>
	<%@include file="/WEB-INF/views/default/footer.jsp" %>
	
</body>
</html>