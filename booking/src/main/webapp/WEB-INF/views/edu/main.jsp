<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>내맘대로 EDU</title>

<style>

/* 헤더 맨 위에 그리기*/
	header {
	  position: relative;  /* 필요시 fixed도 가능 */
	  z-index: 1000;       /* 배너보다 높은 값 */
	}



    .grid-container {
        display: grid;
        grid-template-columns: repeat(4, 1fr); /* 4 columns */
        gap: 20px;
        padding: 20px;
    }
    

        

    .item {
        border: 1px solid #ccc;
        padding: 15px;
        text-align: center;
        border-radius: 8px;
        transition: box-shadow 0.3s;
        white-space: nowrap;        /* 줄바꿈 방지 */
		overflow: hidden;           /* 넘치는 부분 숨김 */
		text-overflow: ellipsis;    /* ... 표시 */
    }

    .item:hover {
        box-shadow: 0 0 10px rgba(0,0,0,0.2);
    }

    .item img {
        width: 400px;
        height: 400px;
        object-fit: cover;
        border-radius: 4px;
    }
    


    .item h3 {
        margin: 5px;
    }

    .item p {
        font-size: 14px;
        color: #555;
    }
    
	.container2 {
	max-width: 1800px;
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
	  height: 270px;
	  
	}

</style>
</head>
<body>

<%@ include file="/edu/header.jsp"%>

<div class="container-fluid">

    
    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
		<div class="carousel-indicators">
		  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
		  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
		  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
		  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="4" aria-label="Slide 5"></button>
		</div>
		<div class="carousel-inner">
		  <div class="carousel-item active">
		    <img src="res/imgs/banner1.jpg" class="d-block w-100" alt="...">
		    <div class="carousel-caption d-none d-md-block">
		      <h1 style="font-size: 45px; font-weight: 900; opacity: 0.5;">내맘대로</h1>
		      <p style="font-size: 25px; font-weight: 200; opacity: 0.7;">교육은 내망대로 ...</p>
		    </div>
		  </div>
		  <div class="carousel-item">
		    <img src="/res/imgs/banner3.jpg" class="d-block w-100" alt="...">
		    <div class="carousel-caption d-none d-md-block">
		      <h1 style="font-size: 45px; font-weight: 900; opacity: 0.5;">내맘대로</h1>
		      <p style="font-size: 25px; font-weight: 200; opacity: 0.7;">AI 교육은 내맘대로 ...</p>
		    </div>
		  </div>
		  <div class="carousel-item">
		    <img src="/res/imgs/banner4.jpg" class="d-block w-100" alt="...">
		    <div class="carousel-caption d-none d-md-block">
		      <h1 style="font-size: 45px; font-weight: 900; opacity: 0.5;">내맘대로</h1>
		      <p style="font-size: 25px; font-weight: 200; opacity: 0.7;">취미는 내맘대로 ...</p>
		    </div>
		  </div>
		   <div class="carousel-item">
		    <img src="/res/imgs/banner5.jpg" class="d-block w-100" alt="...">
		    <div class="carousel-caption d-none d-md-block">
		      <h1 style="font-size: 45px; font-weight: 900; opacity: 0.5;">내맘대로</h1>
		      <p style="font-size: 25px; font-weight: 200; opacity: 0.7;">운동은 내맘대로 ...</p>
		    </div>
		  </div>
		  <div class="carousel-item">
		    <img src="/res/imgs/banner6.jpg" class="d-block w-100" alt="...">
		    <div class="carousel-caption d-none d-md-block">
		      <h1 style="font-size: 45px; font-weight: 900; opacity: 0.5;">내맘대로</h1>
		      <p style="font-size: 25px; font-weight: 200; opacity: 0.7;">요리는 내맘대로 ...</p>
		    </div>
		  </div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
		  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		  <span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
		  <span class="carousel-control-next-icon" aria-hidden="true"></span>
		  <span class="visually-hidden">Next</span>
		</button>
	</div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<br>
<br>

<%-- 원하는 instructor_id만 출력하기 위해 choose/if 사용 --%>
<h1 style="text-align: center;">- 추천 강사 리스트 -</h1>
<div class="grid-container">

    <c:forEach var="instructor" items="${list}">
        <c:if test="${instructor.instructor_id == 15
        or instructor.instructor_id == 16
        or instructor.instructor_id == 26
        or instructor.instructor_id == 25}">
	    	<a href="/intructor/detail?id=${instructor.instructor_id }" style="text-decoration: none; color: inherit;">
		        <div class="item">
		            <img src="/download/${instructor.file_id}/${instructor.attach_idx}" alt="${instructor.name} 이미지">
		            <h3>${instructor.name}</h3>
		            <p>${instructor.word}</p>
		            <p>${instructor.price} 원</p>
		        </div>
        	</a>
        </c:if>
    </c:forEach>
</div>


<div class="container2">
<h1 style="text-align: center;">- 추천 강좌 리스트 -</h1>
	<div class="video2">
	    <c:forEach var="lesson" items="${list2}">
	        <c:if test="${lesson.file_id == 40
	        or lesson.file_id == 50
	        or lesson.file_id == 44
	        or lesson.file_id == 45}">
		    	
		      <div class="video3">   
           	  	<video width="100%" height="270" controls>
			        <source src="/download/${lesson.file_id }/0" type="video/mp4">	        
			    </video>
					    
	            <h4>${lesson.lesson_name}</h4>
	            <p style="font-size: 12px;">${lesson.lesson_explan}</p>
	          </div>
	
	        </c:if>
	    </c:forEach>
    </div>
</div>
<br>
<br>
<br>
<%@ include file="/edu/footer.jsp"%>

</body>
</html>
