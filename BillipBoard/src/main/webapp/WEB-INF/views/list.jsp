<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<meta charset="UTF-8">
<title>게시판 목록</title>
</head>
<style>
body {
	background-image: url("/resources/imgs/background2.jpg");
	background-repeat: repeat-x;
	background-size: cover;
}

table
{
	background-color: white;
	opacity: 0.95;
}

</style>
<body>
	<div class = "container">
	<center><h1><span class="label label-default">게시판</span></h1></center>
	<br />
	<table class ="table table-hover">

		<tr>

			<td width="77">

				<p align="center">글번호</p>

			</td>

			<td width="327">

				<p align="center">제목</p>

			</td>

			<td width="197">

				<p align="center">작성자</p>

			</td>

			<td width="155">

				<p align="center">작성일</p>

			</td>

			<td width="90">

				<p align="center">조회수</p>

			</td>

		</tr>

		<c:forEach items="${list}" var="boardVO">
			<tr>
				<td>${boardVO.bno}</td>

				<td><a
					href='/read${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${boardVO.bno}'>

						${boardVO.title} </a></td>

				<td>${boardVO.writer}</td>

				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
						value="${boardVO.regdate}" /></td>

				<td><span class="badge bg-red">${boardVO.viewcnt }</span></td>

			</tr>

		</c:forEach>

	</table>
	<hr />
	<button id="newBtn" class="btn btn-default pull-right">글쓰기</button>
	
	<div class="text-center">
		<ul class="pagination">
	<c:if test="${pageMaker.prev}">

		<a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">«</a>

	</c:if>

	<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }"
		var="idx">
		<li
		<c:out value="${pageMaker.cri.page == idx?'':''}" />>

		<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
		</li>
	</c:forEach>

	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">

		<a href="list${pageMaker.makeSearch(pageMaker.endPage +1) }"> » </a>
	</c:if>
		</ul>
	</div>
	<br>
	
	<div class="search row">
		<div class="col-xs-2 col-sm-2">
			<select name="searchType" class="form-control">

				<option value="n"
					<c:out value="${cri.searchType == null?'selected':''}"/>>

					---</option>

				<option value="t"
					<c:out value="${cri.searchType eq 't'?'selected':''}"/>>제목</option>

				<option value="c"
					<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>내용</option>

				<option value="w"
					<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>작성자</option>

				<option value="tc"
					<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>

					제목+ 내용</option>

				<option value="cw"
					<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>내용
					+ 작성자</option>

				<option value="tcw"
					<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>

					제목 + 내용 + 작성자</option>

			</select> 
			</div>
			
			<div class="col-xs-10 col-sm-10">
				<div class="input-group">
					<input type="text" name='keyword' id="keywordInput" value='${cri.keyword }' class="form-control">
					<span class="input-group-btn">
					<button type="button" id='searchBtn' class="btn btn-default">검색</button>
					</span>
				</div>
			</div>
		</div>
	
	<script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

	<script type="text/javascript">

		$(document).ready(
			function() {
				$('#searchBtn').on(

					"click",

					function(event) {
						str = "list"
						+ '${pageMaker.makeQuery(1)}'
						+ "&searchType="
						+ $("select option:selected").val()
						+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
						console.log(str);
			self.location = str;
					});
				$('#newBtn').on("click", function(evt) {
					self.location = "regist";
				});
			});
	</script>
	</div>
</body>
</html>