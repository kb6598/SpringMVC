<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<title>BillipBoard</title>
</head>
<style>
body {
	background-image: url("/resources/imgs/background2.jpg");
	background-repeat: repeat-x;
	background-size: cover;
}

#nav {
	height: auto;
	float: right;
	padding: 10px;
}

.btn1 {
	background-color: transparent;
	border: 0px;
	color: white;
	font-size: 16px;
	text-align: center;
	text-decoration: none;
}
</style>
<form action="list" method="get">
	<body>
	<div id = "nav">
		<c:if test="${ member == null }">
			<input type="button" value="회원가입 " class="btn1"
			onClick="location.href='./member/memberJoinForm.do'">
			<input type="button" value="로그인" class="btn1"
				onClick="location.href='./member/login_form.do'">
		</c:if>
		<c:if test="${ member != null }">
			<a href="./member/mypage.do">마이페이지(${member.id})</a>
			<input type="button" value="로그아웃" class="btn1"
				onClick="location.href='./member/logout.do'">
		</c:if>
	</div>
		<P>The time on the server is ${serverTime}.</P>
		<button type="submit">게시판 가기</button>
	</body>
</form>
</html>
