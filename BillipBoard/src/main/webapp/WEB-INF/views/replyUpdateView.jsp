<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

.update_btn
{
	background-color: #0078FF;
	color: white;
	outline: none;
	font-size: 20px;
	padding-left: 5px;
	padding-right: 5px;
	border: 0 solid black;
}

.cancel_btn
{
	background-color: #B90000;
	color: white;
	outline: none;
	font-size: 20px;
	padding-left: 5px;
	padding-right: 5px;
	border: 0 solid black;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='updateForm']");

		$(".cancel_btn").on("click", function() {
			location.href = "/read?bno=${replyUpdate.bno}";
		})

	})
</script>
<body>
	<div class="container">
		<div class="box">
			<div id="root">
				<header>
					<h1>댓글 수정</h1>
				</header>
				<hr />

				<hr />

				<section id="container">
					<form name="updateForm" role="form" method="post"
						action="/replyUpdate">
						<input type="hidden" name="bno" value="${replyUpdate.bno}" readonly="readonly" /> 
						<input type="hidden" id="rno" name="rno" value="${replyUpdate.rno}" /> 
						<input type="hidden" id="page" name="page" value="${cri.page}"> 
						<input type="hidden" id="perPageNum" name="perPageNum" value="${cri.perPageNum}">
						<input type="hidden" id="searchType" name="searchType" value="${cri.searchType}"> 
						<input type="hidden" id="keyword" name="keyword" value="${cri.keyword}">
						<table>
							<tbody>
								<tr>
									<td>
										<label for="content">댓글 내용</label>
										<input type="text" id="content" name="content" value="${replyUpdate.content}" size="70"/>
									</td>
								</tr>
							</tbody>
						</table>
						<br />
						<div>
							<button type="submit" class="update_btn">저장</button>
							<button type="button" class="cancel_btn">취소</button>
						</div>
					</form>
				</section>
				<hr />
			</div>
		</div>
	</div>
</body>
</html>