<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/jsp/include/admintop.jsp"%>

 <!--  코드 관리 바디 시작  -->
<div class="management-container">
	<div class="management-actions">
		<div class="management-search">
			<select class="management-select" id="managementCategory">
				<option value="title">그룹코드</option>
				<option value="author">코드번호</option>
				<option value="content">소분류</option>
			</select> <input type="text" id="inquiryInput" class="search-input"
				placeholder="검색...">
			<button class="search-btn">검색</button>
		</div>
	</div>
</div>


<!-- Content Start -->
<div class="container">
	<div class="row-cols-1">
		<div class="row row-cols-1 row-cols-md-3 g-4" style="height: 570px;">
			<!-- 대분류 카드 -->
			<div class="col">
				<div class="card h-100">
					<div class="card-body">
						<h5 class="card-title">그룹코드 카테고리</h5>
						<ul class="list-group">
							<!-- 리스트 아이템 -->
							<li
								class="list-group-item d-flex justify-content-between align-items-center">
								리스트 아이템 1
								<div>
									<button class="btn btn-sm btn-primary me-2">수정</button>
									<button class="btn btn-sm btn-danger">삭제</button>
								</div>
							</li>
							<!-- 리스트 아이템 -->
							<li
								class="list-group-item d-flex justify-content-between align-items-center">
								리스트 아이템 2
								<div>
									<button class="btn btn-sm btn-primary me-2">수정</button>
									<button class="btn btn-sm btn-danger">삭제</button>
								</div>
							</li>
						</ul>
					</div>
					<div class="card-footer mt-auto">
						<button class="btn btn-primary">그룹코드 추가</button>
					</div>
				</div>
			</div>

			<!-- 중분류 카드 -->
			<div class="col">
				<div class="card h-100">
					<div class="card-body">
						<h5 class="card-title">코드번호 카테고리</h5>
						<ul class="list-group">
							<!-- 리스트 아이템 -->
							<li
								class="list-group-item d-flex justify-content-between align-items-center">
								리스트 아이템 1
								<div>
									<button class="btn btn-sm btn-primary me-2">수정</button>
									<button class="btn btn-sm btn-danger">삭제</button>
								</div>
							</li>
							<!-- 리스트 아이템 -->
							<li
								class="list-group-item d-flex justify-content-between align-items-center">
								리스트 아이템 2
								<div>
									<button class="btn btn-sm btn-primary me-2">수정</button>
									<button class="btn btn-sm btn-danger">삭제</button>
								</div>
							</li>
						</ul>
					</div>
					<div class="card-footer mt-auto">
						<button class="btn btn-primary">코드번호 추가</button>
					</div>
				</div>
			</div>

			<!-- 소분류 카드 -->
			<div class="col">
				<div class="card h-100">
					<div class="card-body">
						<h5 class="card-title">소분류 카테고리</h5>
						<ul class="list-group">
							<!-- 리스트 아이템 -->
							<li
								class="list-group-item d-flex justify-content-between align-items-center">
								리스트 아이템 1
								<div>
									<button class="btn btn-sm btn-primary me-2">수정</button>
									<button class="btn btn-sm btn-danger">삭제</button>
								</div>
							</li>
							<!-- 리스트 아이템 -->
							<li
								class="list-group-item d-flex justify-content-between align-items-center">
								리스트 아이템 2
								<div>
									<button class="btn btn-sm btn-primary me-2">수정</button>
									<button class="btn btn-sm btn-danger">삭제</button>
								</div>
							</li>
						</ul>
					</div>
					<div class="card-footer mt-auto">
						<button class="btn btn-primary">소분류 추가</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>

<%@ include file="/WEB-INF/jsp/include/adminbottom.jsp"%>

