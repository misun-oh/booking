<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${instructor.name} | 강사 상세보기</title>
<style>
  body {
    font-family: 'Noto Sans KR', sans-serif;
    margin: 0;
    padding: 0;
    background: #fff;
    color: #333;
  }

  .container {
    display: flex;
    max-width: 1200px;
    margin: 40px auto;
    gap: 40px;
  }

  /* 좌측 이미지 */
  .product-image {
    flex: 1;
    border-radius: 8px;
    background: #fafafa;
    padding: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
  }
  .product-image img {
    max-width: 100%;
    border-radius: 6px;
  }

  /* 우측 정보 */
  .product-info {
    flex: 1;
    display: flex;
    flex-direction: column;
    gap: 15px;
  }

  .title {
    font-size: 22px;
    font-weight: bold;
  }

  .price {
    font-size: 26px;
    font-weight: bold;
    color: #000;
  }

  .label {
    font-weight: bold;
    margin-right: 10px;
  }

  .detail-box {
    font-size: 15px;
    line-height: 1.6;
    color: #555;
  }

  .order-box {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-top: 20px;
  }
  .buy-btn {
    flex: 1;
    padding: 14px;
    background: #222;
    color: #fff;
    font-size: 16px;
    font-weight: bold;
    border: none;
    cursor: pointer;
    border-radius: 6px;
    text-align: center;
  }
  .buy-btn:hover {
    background: #000;
  }

  .hidden {
    display: none;
  }

  /* 구분선 */
  .divider {
    border-top: 1px solid #eee;
    margin: 20px 0;
  }

</style>
</head>
<body>

<%@ include file="/edu/header.jsp" %>

<div class="container">

  <!-- 강사 이미지 -->
  <div class="product-image">
    <img src="/download/${instructor.file_id}/${instructor.attach_idx}" 
         alt="${instructor.name} 강사 이미지">
  </div>

  <!-- 강사 정보 -->
  <div class="product-info">
    <div class="title">${instructor.name} 강사</div>
    <div class="price">${instructor.word}</div>

    <div class="detail-box">
      <c:if test="${not empty instructor.price}">
        <div><span class="label">수강료:</span> ${instructor.price} 원</div>
      </c:if>
      <div><span class="label">분야 :</span> ${instructor.categoryName}</div>
      <div><span class="label">단계 :</span> ${instructor.level.label}</div>
    </div>

    <div class="divider"></div>

    <div class="order-box">
      <button class="buy-btn" onclick="subscribe(${instructor.instructor_id})">구독하기</button>
    </div>

    <!-- 숨겨진 영상 영역 -->
    <div id="video-section" class="hidden" style="margin-top: 20px;">
      <h3>강의 영상</h3>
      <video width="640" height="360" controls>
        <source src="/video/sample.mp4" type="video/mp4">
        해당 브라우저는 video 태그를 지원하지 않습니다.
      </video>
    </div>
  </div>

</div>

   
    <script type="text/javascript">
	  var isLogein = ${isLogein};
	      console.log("JSP: isLogein 값 ->", isLogein);
	    	function subscribe(instructor_id) {
	    		 console.log("버튼 클릭 시 isLogein:", isLogein);
	    		if(isLogein){
	    			
	    			fetch('/subscribe', {
	    				method: 'POST',
	    				headers: {
	    					'Content-Type': 'application/x-www-form-urlencoded'
	    				},
	    				body: 'instructor_id=' + encodeURIComponent(instructor_id),
	    				credentials: 'include'
	    			})
	    			.then(response => response.json())
	    			.then(data => {
			            alert(data.msg);
			            if(data.success) {
			                document.getElementById("video-section").classList.remove("hidden");
			                if(data.redirect) {
			                    window.location.href = data.redirect;
			                }
			            } else {
			                if(data.redirect) {
			                    window.location.href = data.redirect;
			                }
			            }
			        })
	    			
	    			.catch(error => {
	    				console.error('구독 요총 중 오류:', error);
	    				alert("구독 중 오류가 발생했습니다.")
	    			})
	    		}else{
	    			 alert("로그인이 필요합니다. 로그인 페이지로 이동합니다.");
	    		      window.location.href = "/login1";
	    		}
			}
    </script>
  </div>

</div>

<%@ include file="/edu/footer.jsp" %>

</body>
</html>