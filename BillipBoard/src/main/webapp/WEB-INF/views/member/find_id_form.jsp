<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>아이디 찾기</title>
</head>
<style>
body {
	background-image: url("/resources/imgs/background2.jpg");
	background-repeat: repeat-x;
	background-size: cover;
}

.find_id {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 500px;
	height: 285px;
	background-color: white;
	opacity: 0.95;
}
</style>
<body>
	<div class="container">
		<div class="find_id">
			<div class="w3-content w3-container w3-margin-top">
				<div class="w3-container w3-card-4">
					<form action="../member/find_id.do" method="post">
						<div class="w3-center w3-large w3-margin-top">
							<h3>아이디 찾기</h3>
						</div>
						<div>
							<p>
								<label>이메일</label> <input class="w3-input" type="text"
									id="email" name="email" required>
							</p>
							<p class="w3-center">
								<button type="submit" id=findBtn
									class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">찾기</button>
								<button type="button" onclick="history.go(-1);"
									class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">취소</button>
							</p>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>