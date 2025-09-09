<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>내멋대로 HoTeL | 로그인</title>
<style>
:root {
	--brand-black: #111;
	--brand-ink: #222;
	--brand-accent: #e08a3a;
	--brand-cream: #fbf5ec;
	--line: #e6e6e6;
	--radius: 16px;
}

* {
	box-sizing: border-box
}

html, body {
	height: 100%
}

body {
	margin: 0;
	font-family: system-ui, -apple-system, Segoe UI, Roboto, "Noto Sans KR",
		Helvetica, Arial, "Apple SD Gothic Neo", "맑은 고딕", "Malgun Gothic",
		sans-serif;
	color: var(--brand-ink);
	background: #fff;
}

.wrap {
	min-height: 100dvh;
	display: grid;
	place-items: center;
	padding: 24px;
}

.stack {
	display: flex;
	flex-direction: column;
	gap: 14px
}

.brand {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 8px;
	margin-bottom: 8px;
	text-align: center;
}

.brand small {
	color: #8a8a8a;
	font-size: 16px;
	letter-spacing: .2px;
}

.brand h1 {
	margin: 0;
	font-size: 48px;
	letter-spacing: 2px;
	color: #2b2b2b;
	font-weight: 800;
}
/* 브랜드 이미지 스타일 */
.brand-img {
	width: 350px; /* 가로 크기 */
	height: 350px; /* 세로 크기 */
	object-fit: cover; /* 이미지 비율 유지하며 잘라내기 */
	display: block;
}

.card {
	width: min(92vw, 420px);
	margin-top: 10px;
}

.pill {
	background: var(--brand-black);
	color: #fff;
	border-radius: 999px;
	text-align: center;
	padding: 14px 18px;
	font-weight: 700;
	letter-spacing: .5px;
	margin-bottom: 12px;
}

.field {
	display: flex;
	flex-direction: column;
	gap: 6px;
	margin: 8px 0 2px;
}

.label {
	font-size: 13px;
	color: #9a9a9a;
	padding-left: 4px;
}

.input {
	width: 100%;
	border: 1px solid var(--line);
	background: #fff;
	border-radius: 12px;
	padding: 14px 14px;
	font-size: 15px;
	outline: none;
	transition: border-color .15s, box-shadow .15s;
}

.input::placeholder {
	color: #c0c0c0
}

.input:focus {
	border-color: #bbb;
	box-shadow: 0 0 0 4px rgba(0, 0, 0, .04);
}

.btn {
	width: 100%;
	border: none;
	border-radius: 12px;
	padding: 14px 16px;
	background: var(--brand-black);
	color: #fff;
	font-weight: 800;
	letter-spacing: .6px;
	cursor: pointer;
	margin-top: 12px;
	transition: transform .06s ease, opacity .2s ease;
}

.btn:active {
	transform: translateY(1px)
}

.links {
	display: flex;
	justify-content: center;
	gap: 14px;
	font-size: 13px;
	margin-top: 10px;
	color: #6d6d6d;
}

.links a {
	color: inherit;
	text-decoration: none;
	position: relative;
	padding: 2px 0;
}

.links a:hover {
	color: #000;
	text-decoration: underline
}
/* 브랜드 아이콘 */
.logo {
	width: min(30vw, 220px);
	height: auto;
	display: block;
	margin-inline: auto;
}
/* 작은 화면 여백 */
@media ( max-width :360px) {
	.brand h1 {
		font-size: 40px
	}
	.pill {
		padding: 12px 14px
	}
}
</style>
</head>
<body>
	<main class="wrap">
		<div class="stack">
			<div class="brand">
				<!-- 추가된 이미지 -->
				<a href="/main"><img src="/res/img/hotel_logo500.jpg"
					alt="호텔 로고" class="brand-img" /></a>
				<!--<small>Hotel as I like</small>
        <h1>HOTEL</h1>-->
			</div>

			<section class="card">
				<div class="pill">아이디 / 패스워드</div>

				<form action="/main" method="post" autocomplete="on">
					<div class="field">
						<label class="label" for="loginId">아이디</label> <input
							class="input" id="loginId" name="loginId" type="text"
							placeholder="아이디" required />
					</div>

					<div class="field">
						<label class="label" for="loginPw">패스워드</label> <input
							class="input" id="loginPw" name="loginPw" type="password"
							placeholder="패스워드" required />
					</div>

					<button class="btn" type="submit">로그인</button>
				</form>

				<div class="links" aria-label="보조 링크">
					<a href="">아이디찾기</a> <span>|</span> <a href="#">비밀번호찾기</a> <span>|</span>
					<a href="/register">회원가입</a>
				</div>
			</section>
		</div>
	</main>
</body>
</html>
