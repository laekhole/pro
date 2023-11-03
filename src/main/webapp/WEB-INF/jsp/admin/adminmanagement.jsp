<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <%@ include file="/WEB-INF/jsp/include/admintop.jsp"%>
<!-- Chart Start -->
<div class="container-fluid mt-3">
  <div class="row">
      <div class="col-md-10">
          <div class="member-management-box">
              <div class="d-flex justify-content-between align-items-center">
                  <h4>회원관리</h4>
              </div>
          </div>
      </div>
         <!-- 검색 & 필터 & 버튼 -->
           <!-- 고객센터 검색 -->
		<div class="management-container">
			<div class="management-actions">
				<div class="management-search">
					<form id="searchForm" class="management-search" action="" method="get">
						<select class="management-select" name="type1" id="managementCategory">
							<option value="TopField" >전체</option>
							<option value="name">회원이름</option>
							<option value="group_id">단체이름</option>
						</select> 
						 <input type="text" name="searchWord" id="inquiryInput" class="search-input" placeholder="검색...">
						<button type="submit" class="search-btn">검색</button>
					</form>
				</div>
			</div>
		</div>


		<!-- 쪽지 전송 & 일괄 제재 버튼 -->
<!-- <div class="mt-2 d-flex justify-content-end">
  <button class="btn btn-primary active-button" id="messageButton">쪽지 전송</button>
  <button class="btn btn-primary" id="sanctionButton">일괄 제재</button>
</div> -->


          <!-- 테이블 -->
          <div class="mt-4 center-right-container">
              <div class="mb-3 d-flex align-items-center">
                  <label for="member-type-filter" class="form-label me-2" style="display:none">회원/단체 구분</label>
                  <button class="btn btn-primary me-2">개인</button>
                  <button class="btn btn-secondary">단체</button>
              </div>
              <div class="mt-2 d-flex justify-content-end">
                <!-- 쪽지 전송 & 일괄 제재 버튼 -->
                <button class="btn btn-primary active-button" id="messageButton">쪽지 전송</button>
                <button class="btn btn-primary" id="sanctionButton">일괄 제재</button>
        
                <!-- 정렬 드롭다운 -->
                <div class="dropdown">
                    <button class="btn btn-primary active-button dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        정렬
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="#">이름 순</a>
                        <a class="dropdown-item" href="#">등록 순</a>
                    </div>
                </div>
            </div>
            </div>

      </div>
          
              <style>
                  #member-table th:first-child, 
                  #member-table td:first-child {
                      border-left: none;
                  }
              
                  #member-table th:last-child, 
                  #member-table td:last-child {
                      border-right: none;
                  }
              </style>
              
<!-- 회원 리스트 출력 -->
		<div class="container mt-4">
		    <table class="table">
		        <thead>
		            <tr>
		                <th scope="col">번호</th>
		                <th scope="col">아이디</th>
		                <th scope="col">이름</th>
		                <th scope="col">성별</th>
		                <th scope="col">연락처</th>
		                <th scope="col">봉사시간</th>
		                <th scope="col">온도</th>
		                <th scope="col">무단불참</th>
		                <th scope="col">상태</th>
		                <th scope="col">비고</th>
		            </tr>
		        </thead>
		        <tbody>
		            <c:forEach var="member" items="${list}" varStatus="status">
		                <tr>
		                    <td>${member.memSeq}</td>
		                    <td>${member.memId}</td> <!-- 이메일을 memId라고 가정 -->
		                    <td>${member.name}</td>
		                    <td>${member.gender}</td> 
		                    <td>${member.phone}</td> 
							<td>${member.volunteerTime.volunAddtime}</td> <!-- 봉사시간 -->
        					<td>${member.volunteerTime.volunHeat}</td> <!-- 온도 -->
        					<td>${member.volunteerTime.volunNoshow}</td> <!-- 노쇼 횟수 -->
		                    <td>${member.benYn == 'N' ? '활성' : '비활성'}</td> <!-- delYn이 'N'이면 활성, 아니면 비활성으로 표시 -->
		                    
		                    <td>비고</td>
		                </tr>
		            </c:forEach>
		        </tbody>
		    </table>
		</div>
              
          
          <!-- 페이지네이션 -->
          <div class="d-flex justify-content-center mt-4">
              <button class="btn btn-light">
                  <i class="bi bi-arrow-left"></i>
              </button>                
              <button class="btn btn-light">1</button>
              <button class="btn btn-light">2</button>
              <button class="btn btn-light">3</button>
              <button class="btn btn-light">4</button>
              <button class="btn btn-light">10</button>
              <button class="btn btn-light">
                  <i class="bi bi-arrow-right"></i>
              </button>
              
          </div>
      </div>
 <%@ include file="/WEB-INF/jsp/include/adminbottom.jsp"%>

