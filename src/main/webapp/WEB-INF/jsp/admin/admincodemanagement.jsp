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
				<option value="content">코드이름</option>
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
			<div class="col" style="width: 70%;">
				<div class="card h-100">
					<div class="card-body">
						<h5 class="card-title">코드 관리</h5>
						그룹 코드 : 
							<select class="management-select" id="selectBoxCode">
								<option>0001</option>
								<option>0002</option>
								<option>0003</option>
							</select>
						<ul class="list-group" style="margin-top:20px; max-height:570px; overflow-y: auto;">
							
							<li class="list-group-item d-flex justify-content-between align-items-center" >
							
							
								<table class="table" >
								<thead>
									<tr>
										<th>그룹 코드</th>
										<th>코드 번호</th>
										<th>코드 이름</th>
										<th style="width: 25%;">코드 설명</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody id="codeList">
									<tr>
										<td>0001</td>
										<td>0001</td>
										<td>테스트</td>
										<td>설명</td>
										<td>
										<div>
											<button class="btn btn-sm btn-primary me-2">수정</button>
											<button class="btn btn-sm btn-danger">삭제</button>
										</div>
										</td>
									</tr>
								</tbody>
								</table>
							</li>
							
						</ul>
					</div>
				</div>
			</div>
			<div class="col" style="width: 30%;">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">코드 추가 / 수정</h5>
						<ul class="list-group">
							<!-- 리스트 아이템 -->
							<li class="list-group-item d-flex justify-content-between align-items-center">
								<span>그룹 코드 : 
									<input type="text">
								</span>
							</li>
							<li class="list-group-item d-flex justify-content-between align-items-center">
								<span>코드 번호 : 
									<input type="text">
								</span>
							</li>
							<li class="list-group-item d-flex justify-content-between align-items-center">
								<span>코드 이름 : 
									<input type="text">
								</span>
							</li>
							<li class="list-group-item d-flex justify-content-between align-items-center">
								<span>코드 설명 : 
									<input type="text">
								</span>
							</li>
							<!-- 리스트 아이템 -->
						</ul>
					</div>
					<div class="card-footer mt-auto">
						<button class="btn btn-primary">추가/수정</button>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>

<%@ include file="/WEB-INF/jsp/include/adminbottom.jsp"%>

