<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>글수정</title>
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

.txt3 {
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

.btn {
	float: right;
}

.com_btn {
	background-color: #006400;
	color: white;
	outline: none;
	font-size: 20px;
	padding-left: 5px;
	padding-right: 5px;
	border: 0 solid black;
}

.title
{
	background-color: transparent;
	border: 0px;
	color: black;
	font-size: 3em;
	text-align: center;
	text-decoration: none;
	font-weight: bold;
}
</style>
</style>
<body>
	<div class="container">
		<div class = "title">
		글 수 정 페 이 지
		</div>
		<br />
		<form action="modify" method="post">
			<body>
				<p>
					<label>글번호</label> 
					<input type="text" name="bno" value="${boardVO.bno}" readonly="readonly" class="txt1">
				</p>
				<p>
					<label>제목</label>
					<input type="text" name="title" value="${boardVO.title}" class="txt3">
				</p>
				<p>
					<label>작성자</label> 
					<input type="text" name="writer" size="15" value="${boardVO.writer}" readonly="readonly" class="txt1">
				</p>
				<label>내용</label>
				<div class="wrap">
					<textarea name=content>${boardVO.content}</textarea>
					<br>
				</div>
				<div class="btn">
				<button type="submit" class = "com_btn">완료</button>
				</div>
	</div>
</body>
</form>
</html>