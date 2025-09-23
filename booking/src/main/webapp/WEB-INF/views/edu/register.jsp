<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<style type="text/css">
h2 {
	text-align: center;
	margin-bottom: 40px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th {
	text-align: left;
	padding: 15px;
	background: #f8f8f8;
	width: 20%;
	vertical-align: top;
}

td {
	padding: 15px;
}

input[type="text"], input[type="password"], input[type="email"], select
	{
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
}

.phone-inputs {
	display: flex;
	gap: 10px;
}

.phone-inputs input {
	flex: 1;
}

.address-box {
	display: flex;
	gap: 10px;
}

.btn-black, .btn-white {
	padding: 12px 20px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

.btn-black {
	background-color: black;
	color: white;
}

.btn-white {
	background-color: white;
	border: 1px solid #ccc;
}

.btn-submit {
	display: flex;
	justify-content: center;
	gap: 10px;
	margin-top: 30px;
}

.required {
	color: red;
}

.small-text {
	font-size: 12px;
	color: gray;
}
</style>
</head>
<body>
	<%@include file="/edu/header.jsp"%>

	<div class="container">
		<h2>회원 가입</h2>
		<!-- 파일을 첨부하기 위해  enctype="multipart/form-data"을 지정 -->
		<form action="/member/register_action" method="post"
			name="registerForm" id="rrrr" enctype="multipart/form-data">

			<div class="input-group mb-3">
    			<input type="file" class="form-control" name="file" accept="image/*">
			</div>

			<div class="input-group mb-3 mt-4">
				<input type="text" class="form-control" placeholder="아이디"
					id="user_id" name="user_id" data-field="user_id">
				<button class="btn btn-outline-secondary" type="button"
					id="checkIdBtn">중복체크</button>
				<div class="valid-feedback"></div>
				<div class="invalid-feedback"></div>
			</div>

			<div class="input-group mb-3">
				<input type="password" class="form-control is-invalied"
					placeholder="비밀번호" name="password" data-field="password">
				<div class="invalid-feedback"></div>
			</div>
			<div class="input-group mb-3">
				<input type="text" class="form-control" placeholder="비밀번호 확인"
					aria-label="Recipient's username" aria-describedby="button-addon2"
					data-field="pwcheck">
				<div class="invalid-feedback"></div>
			</div>
			<div class="input-group mb-3">
				<input type="text" class="form-control" placeholder="이름"
					aria-label="Recipient's username" aria-describedby="button-addon2"
					name="username">
			</div>
			<div class="input-group mb-3">
				<input type="text" class="form-control" placeholder="email"
					aria-label="Recipient's username" aria-describedby="button-addon2"
					name="email">
			</div>
			<div class="input-group mb-3">
				<input type="text" class="form-control" placeholder="전화번호"
					aria-label="Recipient's username" aria-describedby="button-addon2"
					name="phone_number">
			</div>

			<div class="input-group mb-3 justify-content-md-center">
				<!-- 저장버튼을 클릭 하면 /member/register_action -> 컨트롤러에서 데이터 수집 -->
				<button id="saveBtn" type="submit" class="btn btn-primary">저장</button>
				<button type="reset" class="btn btn-outline-secondary">초기화</button>
			</div>
		</form>
	</div>

	<%@include file="/edu/footer.jsp"%>
</body>
</html>