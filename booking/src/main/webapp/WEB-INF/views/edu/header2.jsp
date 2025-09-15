<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
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
    padding: 0;
    margin: 0;
    background: #f5f5f5;
}

.main-menu > li:hover .sub-menu {
    display: block; /* 마우스 오버 시 표시 */
}

.sub-menu > li {
    padding: 5px 10px;
}
</style>

</head>
<body>


<nav>
  <ul class="main-menu">
    <c:forEach var="main" items="${categoryList}">
      <c:if test="${main.parent_id == null}">
        <li>
          <a href="/intructorlist?cateId=${main.id}">${main.name}</a>
          <ul class="sub-menu">
            <c:forEach var="sub" items="${categoryList}">
              <c:if test="${sub.parent_id eq main.id}">
                <li>
                  <a href="/intructorlist?cateId=${sub.id}">${sub.name}</a>
                </li>
              </c:if>
            </c:forEach>
          </ul>
        </li>
      </c:if>
    </c:forEach>
  </ul>
</nav>

</body>
</html>