<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- <script type="text/javascript">
       google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Work',     11],
          ['Eat',      2],
          ['Commute',  2],
          ['Watch TV', 2],
          ['Sleep',    7]
        ]);

        var options = {
          title: 'My Daily Activities'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
</script> -->
</head>
<body>
	<%@include file="/WEB-INF/views/default/header.jsp" %>
	<div align="center">
		<h1>게시판</h1>
		<table border="1">
			<tr>
				<th>번호</th><th>id</th><th>제목</th><th>날짜</th><th>조회수</th><th>image_file_name</th>
			</tr>
			<c:if test="${list.size()==0 }">
				<tr>
					<th colspan="6">등록된 글이 없습니다.</th>
				</tr>
			</c:if>
			<c:if test="${list.size()!=0 }">
				<c:forEach var="dto" items="${list }">				
					<tr>
						<th>${dto.write_no }</th><th>${dto.id }</th><th><a href="contentView?title=${dto.title }&write_no=${dto.write_no}">${dto.title }</a></th><th>${dto.savedate }</th><th>${dto.hit }</th><th>${dto.image_file_name }</th>
					</tr>
				</c:forEach>
			</c:if>
			<tr>
				<td colspan="6">
					<div align="left">
						<c:forEach var="num" begin="1" end="${repeat }">
							<a href="boardAllList?num=${num }">${num } </a>&nbsp
						</c:forEach>
					</div>
				</td>
			</tr>
			<tr>				
				<td colspan="6"><a href="writeForm">글쓰기</a></td>								
			</tr>			
		</table>
	</div>
	<div id="piechart" align="center" style="width: 900px; height: 500px;"></div>
	
	<%@include file="/WEB-INF/views/default/footer.jsp" %>
</body>
</html>