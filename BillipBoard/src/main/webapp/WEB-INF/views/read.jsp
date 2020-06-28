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
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>글읽기</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		
		$(".replyWriteBtn").on("click", function(){
			  var formObj = $("form[name='replyForm']");
			  formObj.attr("action", "/replyWrite");
			  formObj.submit();
			});

		$(".replyUpdateBtn").on("click", function(){
			location.href = "/replyUpdateView?bno=${read.bno}"
							+ "&page=${cri.page}"
							+ "&perPageNum=${cri.perPageNum}"
							+ "&searchType=${cri.searchType}"
							+ "&keyword=${cri.keyword}"
							+ "&rno="+$(this).attr("data-rno");
		});
				
		//댓글 삭제 View
		$(".replyDeleteBtn").on("click", function(){
			location.href = "/replyDeleteView?bno=${read.bno}"
				+ "&page=${cri.page}"
				+ "&perPageNum=${cri.perPageNum}"
				+ "&searchType=${cri.searchType}"
				+ "&keyword=${cri.keyword}"
				+ "&rno="+$(this).attr("data-rno");
		});
	})
</script>
<body>
	<p>
		<label>글번호</label> <input type="text" name="bno"
			value="${boardVO.bno}" readonly="readonly">
	</p>
	<p>
		<label>제목</label> <input type="text" name="title"
			style="background-color: #B0E0E6;" value="${boardVO.title}"
			readonly="readonly">
	</p>
	<p>
		<label>작성자</label> <input type="text" name="writer" size="15"
			value="${boardVO.writer}" readonly="readonly">
	<p>
		<label>내용</label>
		<textarea name=content rows="10" cols="70"
			style="background-color: #B0E0E6;" readonly="readonly">${boardVO.content}</textarea>
		<br>
		<button type="submit" formaction="modify" formmethod="get">수정</button>
		<button type="submit" formaction="remove" formmethod="post">삭제</button>
		<button type="submit" formaction="list" formmethod="get">목록</button>
	<div id="reply">
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
					  <button type="button" class="replyUpdateBtn" data-rno="${replyList.rno}">수정</button>
					  <button type="button" class="replyDeleteBtn" data-rno="${replyList.rno}">삭제</button>
					</div>
				</li>
			</c:forEach>
		</ol>
	</div>
	<form name="replyForm" method="post">
		<input type="hidden" id="bno" name="bno" value="${read.bno}" /> 
		<input type="hidden" id="page" name="page" value="${cri.page}"/> 
		<input type="hidden" id="perPageNum" name="perPageNum" value="${cri.perPageNum}"/>
		<input type="hidden" id="searchType" name="searchType" value="${cri.searchType}"/>
		<input type="hidden" id="keyword" name="keyword" value="${cri.searchType}"/>
		<div>
			<label for="writer">댓글 작성자</label>
			<input type="text" id="writer" name="writer" /> 
			<br /> 
			<label for="content">댓글 내용</label>
			<input
				type="text" id="content" name="content" />
		</div>
		<div>
			<button type="button" class="replyWriteBtn">작성</button>
		</div>
	</form>
</body>

</html>