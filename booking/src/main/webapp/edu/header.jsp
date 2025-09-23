<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>내맘대로 E.D.U</title>
  <script src="https://kit.fontawesome.com/08035877d1.js" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
  <script src="/res/js/script.js"></script>

  <style>
    body {
      margin: 0;
      font-family: 'Helvetica', 'Arial', sans-serif;
      color: #333;
      background-color: #fff;
    }

    header {
    
      padding: 30px 100px;
      background: #fff;
      border-bottom: 1px solid #eee;
    }

    .logo {
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 10px;
      font-size: 1.5rem;
      margin-bottom: 20px;
    }

    .logo img {
      width: 350px;
    }

    .user-menu {
      position: absolute;
      top: 20px;
      right: 220px;
      display: flex;
      justify-content: flex-end;
      gap: 10px;
      font-size: 0.7rem;
    }

    a {
      color: #222;
      text-decoration: none;
    }
    
    nav {
	  text-align: center; /* nav 안쪽 중앙 정렬 */
	}
	    
    .main-menu {
	    list-style: none;
	    padding: 0;
	    margin: 0;
	}
	
	.main-menu > li {
	    display: inline-block;
	    position: relative;
	    margin-right: 20px;
	}
	
	.sub-menu {
	    display: none;  /* 기본 숨김 */
	    position: absolute;
	    list-style: none;
	    min-width: 150px;   /* 최소 너비 */
	    max-width: 250px;   /* 필요시 최대 너비 */
	    padding: 10px;      /* 내부 여백 */
	    background: #f5f5f5;
	    border: 1px solid #ddd;
	    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
	}
	
	.main-menu > li:hover .sub-menu {
	    display: block; /* 마우스 오버 시 표시 */
	}
	
	.sub-menu > li {
	    padding: 12px 15px;   /* 항목 크기 */
	    font-size: 14px;      /* 글자 크기 */
	    line-height: 1.5;     /* 줄 간격 */
	    cursor: pointer;
	}
	.sub-menu > li:hover {
	    background: orange;     /* 마우스 오버 효과 */
	}
  </style>
</head>
<body>
<header>
${loginMember }
  <!-- 헤더 -->
  <div class="user-menu">
  <c:if test="${loginMember ne null}">
  	${loginMember.username  }님 환영합니다.
  	
      <a href="/edulogout">로그아웃</a>
      <a href="/mypage1">마이페이지</a>
	  <!-- 권한체크 -->
	  <c:if test='${loginMember.hasRole("ADMIN") || loginMember.hasRole("PARTNER")}'>
	      <a href="/input">강의 영상 등록</a>
	      <a href="/input2">강사 등록</a>
	  </c:if>
  </c:if>
  <c:if test="${loginMember eq null}">
      <a href="/login">로그인</a>
      <a href="/register">회원가입</a>
  </c:if>
  	  <a href="/input">강의 영상 등록</a>
      <a href="/input2">강사 등록</a>
      <a href="/wr_notice">공지 등록</a>
      <a href="/test2">관리자 홈</a>
  </div>

  
    <div class="logo">
       <a href="/main"><img src="/res/imgs/logo2.jpg" alt="로고" /></a>
    </div>
  
  
  <nav>
	  <ul class="main-menu">
	    <c:forEach var="main" items="${categoryList}">
	      <c:if test="${main.parent_id == null}">
	        <li>
	          <a href="/intructorlist?cateId=${main.category_id}">${main.name}</a>
	          <ul class="sub-menu">
	            <c:forEach var="sub" items="${categoryList}">
	              <c:if test="${sub.parent_id eq main.category_id}">
	             
	                <li>
	                  <a href="/intructorlist?cateId=${sub.category_id}">${sub.name}</a>
	                </li>
	              </c:if>
	            </c:forEach>
	          </ul>
	        </li>
	      </c:if>
	    </c:forEach>
	  </ul>
	</nav>
	</header>
</body>
</html>
