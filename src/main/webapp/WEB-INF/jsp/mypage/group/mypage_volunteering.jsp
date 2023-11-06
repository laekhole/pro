<%@ include file="/WEB-INF/jsp/include/top.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/page/group.css" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<div class="d-flex" id="wrapper">
      <!-- Sidebar-->
      <div>
            <div class="list-group list-group-flush">
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">마이 페이지</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">신청 글 작성</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">신청 목록/ 승인 및 거절</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">진행 중인 봉사</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">봉사활동 후기글</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">캘린더 관리</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">개인 정보 및 프로필 수정</a>
         </div>
      </div>
      <!-- Page content wrapper-->
      <div style="width:80%;">

         <div class="kanban-board">
            <div class="column" id="details-map-column">
			    <h2 style="color: black; font-size: 25px; font-weight: bold;">봉사활동 정보</h2>
			    <div id="volunteer-details">
			        <!-- 봉사활동 정보 표시 -->
			        <h1 style="color: black; font-size: 30px; font-weight: bold; margin-top:50px;">봉사활동 A</h1>
			        <p><strong>글번호:</strong>${list[0].recruitSeq}</p>
			        <p><strong>봉사기간: </strong>${list[0].volunStartDate} ~ ${list[0].volunEndDate}</p>
			        <p><strong>봉사지역: </strong>${list[0].volunRegion1}${list[0].volunRegion2}</p>
			        <p><strong>봉사장소: </strong>${list[0].volunAddr}</p>
			        <p><strong>봉사대상: </strong>${list[0].volunTarget}</p>
			        <p><strong>모집인원: </strong> 3명 / ${list[0].memCount}명</p>
			        <p><strong>봉사단체: </strong>${list[0].groupName}</p>
			    </div>
			</div>

    
    

            <div class="column" id="attendees-column">
                <h2 style="color: black; font-size: 25px; font-weight: bold;">봉사자 목록</h2>
                <div class="volunteer-attendees" style="margin-top:50px;">
					<table>
					    <tr>
					        <th>회원번호</th>
					        <th>이름</th>
					        <th>출석여부</th>
					    </tr>
					
					    <c:forEach items="${list}" var="volunteer">
					        <tr>
					            <th>${volunteer.memSeq}</th>
					            <th>${volunteer.name}</th>
					            <th>${volunteer.timein}</th>
					        </tr>
					    </c:forEach>
					</table>

                </div>
            </div>
            
        </div>

            

      </div>
   </div>