<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>글쓰기</title>
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
	width: 32.7%;
	height: 60%;
	background-color: white;
	opacity: 0.95;
	padding: 10px;
}

label {
	color: white;
	background-color: #78A9ED;
	font-size: 18px;
	padding-left: 8px;
	padding-right: 8px;
	padding-top: 5px;
}

.txt1 {
	border: 0 solid black;
	background-color: rgba(255, 255, 255, 0);
	outline: none;
}

textarea
{
	resize: none;
}

.btn
{
	float: right;
}

.reg_btn
{
	background-color: #006400;
	color: white;
	outline: none;
	font-size: 20px;
	padding-left: 5px;
	padding-right: 5px;
	border: 0 solid black;
}
</style>
<form method="post">
	<body>
		<div class="container">
			<div class="box">
					<p>
						<label>제목</label> 
						<input type="text" name="title">
					</p>
					<p>
						<label>작성자</label> 
						<input type="text" name="writer" size="15" value="${member.id}" readonly="true" class="txt1">
					</p>
					<label>내용</label>
					<p>
						<textarea rows="15" cols="65" name="content"></textarea>
					<p>
					<div class="btn">
						<button type="submit" class="reg_btn">등록</button>
					</div>
			</div>
		</div>
</form>
</body>
</html>