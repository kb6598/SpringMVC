<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시판</title>
</head>
<style>
body {
	background-image: url("/resources/imgs/background2.jpg");
	background-repeat: repeat-x;
	background-size: cover;
}

.box
{
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 900px;
	height: 300px;
	background-color: white;
	opacity: 0.95;
	text-align: center;
}

</style>
<script type="text/javascript">
	$(document).ready(
			function() {
				var formObj = $("form[name='updateForm']");

				$(".cancel_btn").on(
						"click",
						function() {
							location.href = "/read?bno=${replyDelete.bno}"
									+ "&page=${cri.page}"
									+ "&perPageNum=${cri.perPageNum}"
									+ "&searchType=${cri.searchType}"
									+ "&keyword=${cri.keyword}";
						})

			})
</script>
<body>
	<div class="container">
		<div class="box">
			<div id="root">
				<header>
					<h1>댓글 삭제</h1>
				</header>
				<hr />

				<hr />

				<section id="container">
					<form name="updateForm" role="form" method="post"
						action="/replyDelete">
						<input type="hidden" name="bno" value="${replyDelete.bno}"
							readonly="readonly" /> <input type="hidden" id="rno" name="rno"
							value="${replyDelete.rno}" /> <input type="hidden" id="page"
							name="page" value="${cri.page}"> <input type="hidden"
							id="perPageNum" name="perPageNum" value="${cri.perPageNum}">
						<input type="hidden" id="searchType" name="searchType"
							value="${cri.searchType}"> <input type="hidden"
							id="keyword" name="keyword" value="${cri.keyword}">

						<div>
							<p>삭제 하시겠습니까?</p>
							<button type="submit" class="delete_btn">예 삭제합니다.</button>
							<button type="button" class="cancel_btn">아니오. 삭제하지 않습니다.</button>
						</div>
					</form>
				</section>
				<hr />
			</div>
		</div>
	</div>
</body>
</html>