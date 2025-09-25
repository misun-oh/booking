<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<style>
/* ★ 추가된 부분 : Gmarket Sans 웹폰트 불러오기 */
@font-face {
  font-family: 'GmarketSans';
  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff');
  font-weight: 300;
  font-style: normal;
}
@font-face {
  font-family: 'GmarketSans';
  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
  font-weight: 500;
  font-style: normal;
}
@font-face {
  font-family: 'GmarketSans';
  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
  font-weight: 700;
  font-style: normal;
}




.footer {
  background:#f9f9f9;
  color:#333;
  font-size:14px;
  padding:20px 220px;
  line-height:1.6;
  font-family: 'GmarketSans', sans-serif;   /* ★ 추가된 부분 : 폰트 적용 */
}

/* 상단: 회사 정보 + SNS */
.footer-top {
  display:flex;
  justify-content:space-between;
  align-items:flex-start;
  flex-wrap:wrap;
  gap:20px;
}

.footer-logo {
  font-size:22px;
  margin:0 0 10px;
  font-weight:700;
}
.footer-logo span {
  font-weight:300;
  margin-left:4px;
}

.footer-info p {
  margin:2px 0;
  font-weight:300;
  font-size:14px;
}

.footer-sns a {
  display:inline-block;
  margin-left:10px;
}
.footer-sns img {
  width:45px;
  height:45px;
  object-fit:contain;
}

/* 구분선 */
.footer hr {
  border:none;
  border-top:1px solid #ddd;
  margin:16px 0;
}

/* 하단: 카피라이트 + 메뉴 */
.footer-bottom {
  display:flex;
  justify-content:space-between;
  align-items:center;
  flex-wrap:wrap;
  gap:10px;
}

.footer-copy {
  font-size:13px;
  color:#555;
}
.footer-copy strong {
  font-weight:700;
  margin-right:4px;
}

.footer-nav a {
  margin-left:16px;
  font-size:13px;
  text-decoration:none;
  color:#555;
}
.footer-nav a:hover {
  text-decoration:underline;
  color:#000;
}
</style>
<body>


<footer class="footer">
  <div class="footer-top">
    <!-- 왼쪽: 회사명 + 회사정보 -->
    <div class="footer-info">
      <h2 class="footer-logo">내맘대로 <span>E.D.U</span></h2>
      <p>주식회사 드림러닝</p>
      <p>주소 : 경기 성남시 수정구 수정로 167 (태평동)</p>
      <p>대표 : President LEE</p>
      <p>전화 : 031-662-8282</p>
      <p>핸드폰 : 010-222-3333</p>
      <p><em>Contact for more information.</em></p>
    </div>

    <!-- 오른쪽: SNS 아이콘 -->
    <div class="footer-sns">
      <a href="#"><img src="/res/imgs/insta.jpg" alt="Instagram"></a>
      <a href="#"><img src="/res/imgs/facebook.jpg" alt="Facebook"></a>
      <a href="#"><img src="/res/imgs/youtube.jpg" alt="YouTube"></a>
      <a href="#"><img src="/res/imgs/kakao.jpg" alt="Talk"></a>
    </div>
  </div>

  <hr />

  <!-- 하단 링크 -->
  <div class="footer-bottom">
    <div class="footer-copy">
      <strong>내맘대로 E.D.U</strong> Video Education Platform
    </div>
    <nav class="footer-nav">
      <a href="#">HOME</a>
      <a href="#">사이트소개</a>
      <a href="#">개인정보취급방침</a>
      <a href="#">이용안내</a>
    </nav>
  </div>
</footer>



</body>
</html>