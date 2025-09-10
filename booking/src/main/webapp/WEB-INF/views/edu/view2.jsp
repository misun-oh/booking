<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ROOM INFO</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<style>
#cont_cont { margin-top: 50px; }
.course-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; }
.course-item { border: 1px solid #ddd; padding: 10px; border-radius: 8px; text-align: center; background: #fff; }
.course-item img { width: 100%; height: 200px; object-fit: cover; border-radius: 6px; }
.course-title { font-size: 16px; margin: 10px 0; }
.course-price { font-size: 14px; color: #333; }
</style>
</head>
<body>
<%@ include file="/edu/header.jsp"%>
<div class="container" id="cont_cont">

    <!-- 📌 카테고리 타이틀 -->
    <h2>${category.name}</h2>

    <!-- 📌 서브 카테고리 메뉴 -->
    <div id="subCatList" class="mb-3">
        <c:forEach var="sub" items="${subCategoryList}">
            <a href="list.jsp?id=${sub.category_id}" class="btn btn-sm btn-outline-secondary">${sub.name}</a>
        </c:forEach>
    </div>

    <!-- 📌 코스 목록 (4×3 그리드) -->
    <div class="course-grid">
        <c:forEach var="course" items="${courseList}">
            <div class="course-item">
                <a href="courseDetail.jsp?id=${course.course_id}">
                    <img src="<c:out value='${empty course.img ? "https://placehold.co/300x200?text=No+Image" 
                        : (course.img.startsWith("/uploads") ? course.img : "/uploads/courses/" += course.img)}'/>"
                        alt="${course.title}"
                        onerror="this.src='https://placehold.co/300x200?text=No+Image';" />
                    <h4 class="course-title">${course.title}</h4>
                    <p class="course-price"><fmt:formatNumber value="${course.price}" type="number"/> 원</p>
                </a>
            </div>
        </c:forEach>
    </div>

    <!-- 📌 페이지네이션 -->
    <nav aria-label="코스 페이지" class="mt-4">
        <ul class="pagination justify-content-center">
            <c:if test="${pageDto.isPrev}">
                <li class="page-item">
                    <a class="page-link" href="list.jsp?id=${param.id}&pageNo=${pageDto.startNo - 1}">이전</a>
                </li>
            </c:if>

            <c:forEach var="num" begin="${pageDto.startNo}" end="${pageDto.endNo}">
                <li class="page-item ${pageDto.pageNo == num ? 'active' : ''}">
                    <a class="page-link" href="list.jsp?id=${param.id}&pageNo=${num}">${num}</a>
                </li>
            </c:forEach>

            <c:if test="${pageDto.isNext}">
                <li class="page-item">
                    <a class="page-link" href="list.jsp?id=${param.id}&pageNo=${pageDto.endNo + 1}">다음</a>
                </li>
            </c:if>
        </ul>
    </nav>
</div>
<%@ include file="/edu/footer.jsp"%>
</body>
</html>
