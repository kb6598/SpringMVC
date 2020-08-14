<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>BillipBoard</title>
</head>
<style>
body {
	background-image: url("/resources/imgs/background2.jpg");
	background-repeat: repeat-x;
	background-size: cover;
}

#nav {
	width: 100%;
	height: 100%;
	position: relative;
}

#nav .box {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	text-align: center;
}

.btn1 {
	background-color: transparent;
	border: 0px;
	color: white;
	font-size: 40px;
	text-align: center;
	text-decoration: none;
}

.btn2 {
	background-color: #e7e7e7;
	color: black;
	border: none;
	padding: 12px 40px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 30px;
	margin: 4px 2px;
	cursor: pointer;
}

a {
	background-color: transparent;
	border: 0px;
	color: white;
	font-size: 40px;
	text-align: center;
	text-decoration: none;
}
</style>
<form action="list" method="get">
	<body>
		<div class="container">
			<div id="nav">
				<div class="box">
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
					<br /> <br />
					<button type="submit" class="btn2">게시판</button>
				</div>
			</div>
		</div>
	</body>
</form>
</html>
