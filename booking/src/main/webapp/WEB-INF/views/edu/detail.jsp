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
  
 
    .container2 {
      max-width: 1500px;
      margin: 40px auto;
      gap: 40px;
    }
	
	.video2 {
	  display: grid;
	  grid-template-columns: repeat(4, 1fr); /* 4개씩 1줄 */
	  gap: 20px;
	}
	
	.video3 {
	  width: 100%;
	  height: 200px;
	  
	}
	.buy-btn.subscribe {
	  background-color: #cc0000; /* 유튜브 빨간색 */
	  color: white;
	  font-weight: bold;
	  cursor: pointer;
	  transition: background-color 0.3s ease;
	}
	
	.buy-btn.subscribe:hover {
	  background-color: #b30000;
	}
	.buy-btn.subscribed {
	  background-color: #ccc;
	  color: #666;
	  cursor: default;
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
      <button class="buy-btn subscribe" onclick="subscribe(${instructor.instructor_id}, this)">구독하기</button>
    </div>

    <!-- 숨겨진 영상 영역 -->
    
  </div>

</div>

   
    <script type="text/javascript">
	  var isLogein = ${isLogein ? 'true' : 'false'} === true;
	  	
	      console.log("JSP: isLogein 값 ->", isLogein);
	    	function subscribe(instructor_id, btnElement) {
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
	    				console.log("서버 응답:", data);  // ✅ 응답 구조 확인
			            alert(data.msg);
			            if(data.success) {
			            	if (btnElement) {
			                    btnElement.textContent = "구독 완료";
			                    btnElement.disabled = true;
			                    btnElement.classList.remove("subscribe");
			                    btnElement.classList.add("subscribed"); // 선택: CSS 스타일 추가
			                  }
			            	
			                if(data.redirect) {
			                	setTimeout(() => {
			                		
			                    window.location.href = data.redirect;
			                	}, 1000000);
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
	    		      window.location.href = "/login";
	    		}
			}
	    	window.subscribe = subscribe;
    </script>
  

</div>
<c:if test="${not empty list}">
    <%@ include file="Lecturelist.jsp" %>
</c:if>
<!-- 강의 영상 리스트 영역 -->
<div id="vc" class="container2">
 
  <h2 style="margin-bottom:20px;">강의 영상 리스트</h2>
  <div class="video2">
<c:forEach var="lesson" items="${list}">
 	<div class="video3">
	  	<video width="100%" height="200" controls>
	        <source src="/download/${lesson.file_id }/0" type="video/mp4">	        
	    </video>
   	</div>
</c:forEach>    	

  </div>
</div>
<!-- 강의 영상 끝 -->

<%@ include file="/edu/footer.jsp" %>

</body>
</html>