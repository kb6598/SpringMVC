<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>Home</title>
</head>
<form action = "list" method="get">
<body>

<button type = "submit">게시판 가기</button>
<h1>
	Hello world!  
</h1>

<input type="button" value ="회원가입 " onClick="location.href='./member/memberJoinForm.do'">
<c:if test="${ member == null }">
	<input type="button" value ="로그인" onClick="location.href='./member/login_form.do'">
</c:if>
<c:if test="${ member != null }">
	<a href="./member/mypage.do">마이페이지(${member.id})</a>
	<input type="button" value = "로그아웃" onClick="location.href='./member/logout.do'">
</c:if>
<P>  The time on the server is ${serverTime}. </P>
</body>
</form>
</html>
