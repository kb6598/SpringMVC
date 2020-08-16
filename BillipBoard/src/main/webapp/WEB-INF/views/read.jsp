<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>글읽기</title>
</head>
<style>
body {
	background-image: url("/resources/imgs/background2.jpg");
	background-repeat: repeat-x;
	background-size: cover;
}

label {
	color: white;
	background-color: #78A9ED;
	font-size: 18px;
	padding-left: 8px;
	padding-right: 8px;
	padding-top: 5px;
}

.container {
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -400px;
	margin-left: -400px;
	width: 800px;
	height: 800px;
	background-color: rgba(255, 255, 255, 0.8);
}

.box1 {
	width: 100%;
	height: 45%;
	margin-top: 10px;
	font-size: 18px;
}

.box2 {
	width: 100%;
	height: 40%;
	font-size: 14px;
}

.txt1 {
	border: 0 solid black;
	background-color: rgba(255, 255, 255, 0);
	outline: none;
}

.txt3
{
	background-color: rgba(255, 255, 255, 0.0);
}

.wrap {
	width: 100%;
}

.wrap textarea {
	width: 100%;
	resize: none;
	overflow-y: hidden; /* prevents scroll bar flash */
	padding: 1.1em; /* prevents text jump on Enter keypress */
	padding-bottom: 0.2em;
	line-height: 1.6;
	background-color: rgba(255, 255, 255, 0);
	outline: none;
}

.btn_group
{
	float: right;
}

.mod_btn {
	background-color: #0078FF;
	color: white;
	outline: none;
	font-size: 14px;
	padding-left: 5px;
	padding-right: 5px;
	border: 0 solid black;
}

.del_btn {
	background-color: #B90000;
	color: white;
	outline: none;
	font-size: 14px;
	padding-left: 5px;
	padding-right: 5px;
	border: 0 solid black;
}

.replyUpdateBtn
{
	background-color: #0078FF;
	color: white;
	outline: none;
	font-size: 14px;
	padding-left: 5px;
	padding-right: 5px;
	border: 0 solid black;
}

.replyDeleteBtn
{
	background-color: #B90000;
	color: white;
	outline: none;
	font-size: 14px;
	padding-left: 5px;
	padding-right: 5px;
	border: 0 solid black;
}

.replyWriteBtn
{
	background-color: #006400;
	color: white;
	outline: none;
	font-size: 14px;
	padding-left: 5px;
	padding-right: 5px;
	border: 0 solid black;
}
</style>
<script type="text/javascript">
	$(document).ready(
			function() {

				$(".replyWriteBtn").on("click", function() {
					var formObj = $("form[name='replyForm']");
					formObj.attr("action", "/replyWrite");
					formObj.submit();
				});

				$(".replyUpdateBtn").on(
						"click",
						function() {
							location.href = "/replyUpdateView?bno=${read.bno}"
									+ "&page=${cri.page}"
									+ "&perPageNum=${cri.perPageNum}"
									+ "&searchType=${cri.searchType}"
									+ "&keyword=${cri.keyword}" + "&rno="
									+ $(this).attr("data-rno");
						});

				//댓글 삭제 View
				$(".replyDeleteBtn").on(
						"click",
						function() {
							location.href = "/replyDeleteView?bno=${read.bno}"
									+ "&page=${cri.page}"
									+ "&perPageNum=${cri.perPageNum}"
									+ "&searchType=${cri.searchType}"
									+ "&keyword=${cri.keyword}" + "&rno="
									+ $(this).attr("data-rno");
						});
			})
			

	$(document).ready(function() {
		$('.wrap').on('keyup', 'textarea', function(e) {
			$(this).css('height', 'auto');
			$(this).height(this.scrollHeight);
		});
		$('.wrap').find('textarea').keyup();
	});
</script>
<body>
	<div class="container">
		<div class="box1">
			<form role="form" method="post" autocomplete="off">
				<p>
					<label>글번호</label> <input type="text" name="bno" class="txt1"
						value="${boardVO.bno}" readonly="readonly">
				</p>
			</form>
			<p>
				<label>제목</label> <input type="text" name="title" class="txt1"
					value="${boardVO.title}" readonly="readonly">
			</p>
			<p>
				<label>작성자</label> <input type="text" name="writer" size="15"
					class="txt1" value="${boardVO.writer}" readonly="readonly">
			<p>
				<label>내용</label>
			<p>
			<div class="wrap">
				<textarea name=content readonly="readonly">${boardVO.content}</textarea>
			</div>
			<!--  
		<button type="submit" formaction="modify" formmethod="get">수정</button>
		<button type="submit" formaction="remove" formmethod="post">삭제</button>
		<button type="submit" formaction="list" formmethod="get">목록</button>
		-->
			<p>
			<div class="btn_group">
				<c:if test="${ member.id == boardVO.writer }">
					<button id="modity_btn" class="mod_btn">수정</button>
					<button id="delete_btn" class="del_btn">삭제</button>
				</c:if>
			</div>
			</p>
		</div>
		<script>
			// 폼을 변수에 저장
			var formObj = $("form[role='form']");

			// 수정 버튼 클릭
			$("#modity_btn").click(function() {

				formObj.attr("action", "/modify");
				formObj.attr("method", "get");
				formObj.submit();

			});

			// 삭제 버튼 클릭
			$("#delete_btn").click(function() {

				formObj.attr("action", "/remove");
				formObj.attr("method", "post");
				formObj.submit();

			});
		</script>
		<div class="box2">
			<div id="reply">
				<label>댓글</label>
				<ol class="replyList">
					<c:forEach items="${replyList}" var="replyList">
						<li>
							<p>
								작성자 : ${replyList.writer}<br /> 작성 날짜 :
								<fmt:formatDate pattern="yyyy-MM-dd HH:mm"
									value="${replyList.regdate}" />
							</p>

							<p>${replyList.content}</p>
							<div>
								<c:if test="${ member.id == replyList.writer }">
									<button type="button" class="replyUpdateBtn"
										data-rno="${replyList.rno}" >수정</button>
									<button type="button" class="replyDeleteBtn"
										data-rno="${replyList.rno}" >삭제</button>
								</c:if>
							</div>
						</li>
					</c:forEach>
				</ol>
			</div>
			<form name="replyForm" method="post">
				<input type="hidden" id="bno" name="bno" value="${boardVO.bno}" />
				<input type="hidden" id="page" name="page" value="${cri.page}" /> 
				<input type="hidden" id="perPageNum" name="perPageNum" value="${cri.perPageNum}" /> 
				<input type="hidden" id="searchType" name="searchType" value="${cri.searchType}" /> 
				<input type="hidden" id="keyword" name="keyword" value="${cri.searchType}" />
				<div>
					<label for="writer">댓글 작성자</label> 
					<input type="text" id="writer" class="txt1" name="writer" value="${member.id}" readonly="true" />
					<br /> 
					<label for="content">댓글 내용</label> 
					<input type="text" id="content" name="content" size="70" class="txt3"/>
					<button type="button" class="replyWriteBtn">작성</button>
				</div>
			</form>
		</div>
	</div>
</body>

</html>