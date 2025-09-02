<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- 페이징 처리를 위한 공통폼 -->
<!-- 검색양식 -->
<p>
	<form class="row g-3" name="searchForm">
		<input type="hidden" name="pageNo" value="${pageDto.pageNo }"><br>
		<div class="row g-3 justify-content-between">
		    <div class="col-auto">
		      <label for="inputPassword6" class="col-form-label">총 건수느@@ : ${pageDto.totalItems }</label>
		    </div>
		    <div class="col-auto">
			    <!-- 한페이지당 보여줄 게시물의수 -->
				<select name="amount" class="form-select">
					<option ${pageDto.amount eq "5" ? "selected" : ""  } value="10">5건</option>
					<option ${pageDto.amount eq "10" ? "selected" : ""  } value="20">10건</option>
					<option ${pageDto.amount eq "20" ? "selected" : ""  } value="50">20건</option>
					<option ${pageDto.amount eq "100" ? "selected" : ""  } value="100">100건</option>
				</select>
		    </div>
    	</div>
    </form>
</p>
