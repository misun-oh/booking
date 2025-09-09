<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 조회 페이지</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 30px;
}

.form-container {
	max-width: 1100px;
	margin: 0 auto;
	position: relative;
	padding-bottom: 25px;
}

.form-group {
	margin-bottom: 15px;
}

.banner {
	padding-bottom: 20px; /* 하단 패딩 적용 */
}

.banner img {
	width: 100%; /* 화면 너비에 맞게 */
	max-width: 1920px; /* 최대 크기 제한 */
	height: auto; /* 세로 비율 자동 조절 */
	max-height: 250px; /* 세로 최대치 설정 */
	display: block; /* 가운데 정렬 효과 */
	margin: 0 auto; /* 좌우 여백 자동 */
	object-fit: cover; /* 잘리는 경우에도 꽉 차게 */
}

label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

input[type="text"], input[type="email"], input[type="password"],
	textarea {
	width: 100%;
	padding: 8px;
	border-radius: 5px;
	border: 1px solid #ccc;
}

textarea {
	height: 200px;
	resize: none;
}

.button-group {
	text-align: right; /* 버튼을 우측 정렬 */
	margin-top: 20px;
}

button {
	padding: 10px 20px;
	background-color: #4CAF50;
	border: none;
	border-radius: 5px;
	color: white;
	font-size: 16px;
	cursor: pointer;
	margin-left: 10px;
}

button:hover {
	opacity: 0.9;
}

.btn-edit {
	background-color: #007BFF;
}

.btn-edit:hover {
	background-color: #0069d9;
}

.flex-row {
	display: flex;
	gap: 10px; /* 입력창 사이 여백 */
}

.flex-row input {
	width: 100%;
	padding: 8px;
	border-radius: 5px;
	border: 1px solid #ccc;
}

.btn-back {
	background-color: #6c757d;
}

.btn-back:hover {
	background-color: #5a6268;
}
</style>
</head>
<body>
	<%@ include file="/booking/header.jsp"%>

	<!-- 예약 확인 배너 -->
	<div class="banner">
		<img src="res/img/reser.jpg" alt="예약 확인 배너">
	</div>

	<div class="form-container">


		<center>
			<h2
				style="font-size: 28px; font-weight: bold; color: #022703; margin-bottom: 15px;">예약
				확인</h2>
		</center>
		<center>
			<p
				style="font-size: 12px; font-weight: bold; color: #5c5c5c; margin-bottom: 15px;">
				최소 하나 이상의 정보를 입력한 후 예약확인 버튼을 클릭해 주세요. ⓒ 2025 내맘대로 HOTEL</p>
		</center>


		<form action="/re_data" method="get">
			<div class="form-group flex-row">
				<div style="flex: 1;">
					<label for="number">예약 번호를 넣어 주세요.</label> <input type="number"
						id="number" name="reid" value="${reid}">
				</div>
				<div class="button-group" style="align-self: flex-end;">
					<button type="submit">예약 확인</button>
				</div>
			</div>
		</form>

		<center>
			<h2>예약 정보 확인</h2>
		</center>

		<c:choose>
			<c:when test="${reservation != null}">
				<table
					style="width: 60%; margin: 20px auto; border-collapse: collapse; font-size: 16px;">
					<tr>
						<th
							style="background: #d9f2d9; text-align: left; padding: 8px; border: 1px solid #ccc;">예약번호</th>
						<td
							style="text-align: right; padding: 8px; border: 1px solid #ccc;">${reservation.reid}</td>
					</tr>
					<tr>
						<th
							style="background: #d9f2d9; text-align: left; padding: 8px; border: 1px solid #ccc;">이름</th>
						<td
							style="text-align: right; padding: 8px; border: 1px solid #ccc;">${reservation.name}</td>
					</tr>
					<tr>
						<th
							style="background: #d9f2d9; text-align: left; padding: 8px; border: 1px solid #ccc;">전화</th>
						<td
							style="text-align: right; padding: 8px; border: 1px solid #ccc;">${reservation.phone}</td>
					</tr>
					<tr>
						<th
							style="background: #d9f2d9; text-align: left; padding: 8px; border: 1px solid #ccc;">체크인</th>
						<td
							style="text-align: right; padding: 8px; border: 1px solid #ccc;">${reservation.checkin}</td>
					</tr>
					<tr>
						<th
							style="background: #d9f2d9; text-align: left; padding: 8px; border: 1px solid #ccc;">체크아웃</th>
						<td
							style="text-align: right; padding: 8px; border: 1px solid #ccc;">${reservation.checkout}</td>
					</tr>
					<tr>
						<th
							style="background: #d9f2d9; text-align: left; padding: 8px; border: 1px solid #ccc;">숙박일수</th>
						<td
							style="text-align: right; padding: 8px; border: 1px solid #ccc;">${reservation.nights}
							일</td>
					</tr>
					<tr>
						<th
							style="background: #d9f2d9; text-align: left; padding: 8px; border: 1px solid #ccc;">총금액</th>
						<td
							style="text-align: right; padding: 8px; border: 1px solid #ccc;">${reservation.price}
							원</td>
					</tr>
				</table>
			</c:when>
			<c:otherwise>
				<p style="text-align: center; color: red; font-weight: bold;">
					조회 결과가 없습니다.</p>
			</c:otherwise>
		</c:choose>


	</div>

	<%@ include file="/booking/footer.jsp"%>
</body>
</html>
