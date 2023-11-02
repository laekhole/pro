<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/jsp/include/top.jsp"%>

<div class="section search-result-wrap">
	<div class="container">
		<div class="sidebar-box search-form-wrap mb-4">
			<form action="/review/list" class="sidebar-search-form" id="searchForm">
				<select name="type1" class="form-select">
					<option value="title">제목</option>
					<option value="writeId">작성자</option>
					<option value="content">내용</option>
				</select>
					<input class="form-control me-sm-2" name="searchWord" type="search" value="${search.searchWord }" >
					<button class="btn btn-secondary my-2 my-sm-0" type="submit" id="search">검색</button>

			</form>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="heading">Category: 시설봉사</div>
			</div>
		</div>
		<div class="row posts-entry">
			<div class="col-lg-8">
			 <c:forEach var="review" items="${list }">
			 	<div class="blog-entry d-flex blog-entry-search-item">
					<a href="#" class="img-link me-4">
						<img src="/template/images/img_1_sq.jpg" alt="Image" class="img-fluid">
					</a>
					<div>
						<span class="date">${review.modDate }  <span style="float:right;">조회수 : ${review.viewCount }</span></span>
						<h2 class="mt-1"><a href="#">${review.reviewTitle }</a></h2>
						<div class="review-text-area">
							<span>${review.reviewContent }<span>
						</div>
						<a href="#" class="btn btn-sm btn-outline-primary mt-3">Read More</a>
						<div class="love-list">
							<i class="bi bi-hand-thumbs-up-fill recommend-list"></i>
							<span>${review.recomCount }</span>
						</div>
					</div>
				</div>
			 </c:forEach>
			 <c:if test="${empty list }">
			 	<div class="blog-entry d-flex blog-entry-search-item">
			 		<h2>검색 결과가 존재 하지 않습니다.</h2>
			 	</div>
			 </c:if>
				<%@ include file="/WEB-INF/jsp/common/inc-paging.jsp"%>
			</div>
			
			<div class="col-lg-4 sidebar"><!-- END sidebar-box -->
				<div class="sidebar-box">
					<h3 class="heading">인기 후기글</h3>
					<div class="post-entry-sidebar">
						<ul>
						<c:forEach var="popular" items="${polist }">
							<li>
								<a href="">
									<img src="/template/images/img_1_sq.jpg" alt="Image placeholder" class="me-4 rounded">
									<div class="text">
										<h4>${popular.reviewTitle }</h4>
										<div class="post-meta">
											<span class="mr-2">${popular.modDate } </span>
										</div>
									</div>
								</a>
							</li>
						</c:forEach>
							
						</ul>
					</div>
				</div>
				<!-- END sidebar-box -->

				<div class="sidebar-box">
					<h3 class="heading">Categories</h3>
					<ul class="categories">
						<li><a href="#">시설봉사 <span>(12)</span></a></li>
						<li><a href="#">전문봉사 <span>(22)</span></a></li>
						<li><a href="#">지역사회봉사 <span>(37)</span></a></li>
						<li><a href="#">금,물품봉사 <span>(37)</span></a></li>
						<li><a href="#">해외봉사 <span>(42)</span></a></li>
						<li><a href="#">기타봉사 <span>(5)</span></a></li>
						<li><a href="#">재가봉사 <span>(14)</span></a></li>
						<li><a href="#">헌혈 <span>(124)</span></a></li>
					</ul>
				</div>
				
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	const searchType = "${search.type1}";
	const searchTypeSelect = $("select[name='type1']");
	if (!searchType) {
	    searchTypeSelect.val("title");
	  } else {
	    searchTypeSelect.val(searchType);
	  }
});
$("#search").on("click", function() {
	$("#searchForm").submit();
	
})
</script>

<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>   	
	