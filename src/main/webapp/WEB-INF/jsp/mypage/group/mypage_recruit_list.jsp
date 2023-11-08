<%@ include file="/WEB-INF/jsp/include/top.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/page/group.css" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


   <div class="d-flex" id="wrapper">
      <!-- Sidebar-->
      
      <div class="col-md-2 col-lg-3 col-xl-2 border-end bg-white" id="sidebar-wrapper" style="
       margin-bottom: 50px;
       border-bottom: 1px solid #dee2e6;">
       
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
      
      <div style="width:100%">
      
         <div class="kanban-board">
            <div class="column" id="waiting-column" style="min-height:700px; margin-bottom:50px;">
                <h2 style="color: black;
                font-size: 25px;
                font-weight: bold;">신청 대기 목록</h2>
                
                
                <div class="card" style="min-height: 643px;">
                    <table style="font-size:13px;">
                        <tr>
                         <th>신청번호</th>
                            <th>봉사글번호</th>
                            <th>회원번호</th>
                            <th>이름</th>
                            <th>상태</th>
                        </tr>
                        
                        <c:forEach var="state" items="${state}">
                        <div id="stateList">
	                        <tr id="statestateList">
	                            <td class="volunProceedSeq">${state.volunProceedSeq}</td>
	                            <td id="recruitSeq">${state.recruitSeq}</td>
	                            <td id="memSeq">${state.memSeq}</td>
	                            <td id="name">${state.name}</td>                                           
	                            <td id="statestate">
	                                <div class="button-container">
	                                   <input type="hidden" value="${state.state}" id="state">
	                                   <button onclick="moveToAccepted(this)" >승인</button>
	                                   <button onclick="openRejectDialog(this)" >거절</button>
	                                </div>
	                            </td>
	                        </tr>
                        </div>
                        </c:forEach>
                        
                    </table>
                </div>
            </div>
            
         <!-- 신청 확정 내역 -->

            <div class="column" id="accepted-column" style="margin-bottom:50px;">
            
                <!-- 승인 내역 카드 -->
                <h2 style="color: black; font-size: 25px; font-weight: bold;">승인 목록</h2>
                <div class="card" style="min-height:300px;">
                    <table style="font-size:13px;">
                        
                        <tr>
                           	<th>신청번호</th>
                            <th>봉사글번호</th>
                            <th>회원번호</th>
                            <th>이름</th>
                            <th>상태</th>
                        </tr>
                        
                        <c:forEach var="approve" items="${approve}">
                        <tr id="approveList">
                            <td class="approveVolunProceedSeq">${approve.volunProceedSeq}</td>
                            <td id="approveRecruitSeq">${approve.recruitSeq}</td>
                            <td id="approveMemSeq">${approve.memSeq}</td>
                            <td id="approveName">${approve.name}</td>                                           
                            <td id="approveState">${approve.state}</td>
                        </tr>
                        </c:forEach>
                     	
                    </table>
                </div>
                
                <!-- 거절 내역 카드 -->
                <h2 style="color: black; font-size: 25px; font-weight: bold;">거절 목록</h2>
                <div class="card" style="min-height:300px;">
                    <table style="font-size:13px;">
                        
                        <tr>
                           <th>신청번호</th>
                            <th>봉사글번호</th>
                            <th>회원번호</th>
                            <th>이름</th>
                            <th>상태</th>
                        </tr>
                        
                        <c:forEach var="reject" items="${reject}">
                        <tr>
                            <td>${reject.volunProceedSeq}</td>
                            <td>${reject.recruitSeq}</td>
                            <td>${reject.memSeq}</td>
                            <td>${reject.name}</td>                                           
                            <td >${reject.state}</td>
                        </tr>
                        </c:forEach>
                     	
                    </table>
                </div>
                
            </div>

        
        </div>
    
        <div id="rejectDialog" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeRejectDialog()">&times;</span>
                <h2>거절 사유 입력</h2>
                <textarea id="rejectionReason" rows="4" cols="50"></textarea>
                <button onclick="sendRejectionReason()">전송</button>
            </div>
        </div>
      
      </div>
      

      </div>

<script>
function moveToAccepted(button) {
    button.disabled = true;

    const state = $(button).closest("tr").find("#state").val();
    const volunProceedSeq = $(button).closest("tr").find(".volunProceedSeq").text();

    const param = {
        state: state,
        volunProceedSeq: volunProceedSeq,
    };

    fetch("<c:url value='/manager/approve'/>", {
        method: "POST",
        headers: {
            "Content-Type": "application/json; charset=UTF-8",
        },
        body: JSON.stringify(param),
    })
    .then((response) => response.json())
    .then((json) => {
        if (json.status) {
            // 성공적으로 승인되었을 때, 승인 상태로 변경하고 목록에서 삭제
            console.log("성공1");
            const row = $(button).closest("tr");
            console.log("성공2");
            row.remove();
            console.log("성공3");
            
            
            const approveList = $("#approveList"); // 댓글 목록 요소 (전체 데이터)
            approveList.empty();
            
            // 승인 데이터를 가져오는 방식에 따라서 아래 코드 수정이 필요합니다.
            const approve = json.approve; // 승인 데이터 가져오기
           	console.log(approve);
            
            console.log("->"+approve.volunProceedSeq);
            
            // 새로운 행 생성
            const newRow = $("<tr>");
            newRow.append("<td class='approveVolunProceedSeq'>" + approve.volunProceedSeq + "</td>");
            newRow.append("<td id='approveRecruitSeq'>" + approve.recruitSeq + "</td>");
            newRow.append("<td id='approveMemSeq'>" + approve.memSeq + "</td>");
            newRow.append("<td id='approveName'>" + approve.name + "</td>");
            newRow.append("<td id='approveState'>" + approve.state + "</td>");

            // 목록에 새로운 행 추가
            approveList.append(newRow);
           
        } else {
            alert('승인에 실패했습니다: ' + json.message);
            console.log(json.message);
        }
    })
    .catch(error => {
        console.error('오류 발생:', error);
    });
}

</script>


<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/tiny-slider.js"></script>

<script src="js/flatpickr.min.js"></script>


<script src="js/aos.js"></script>
<script src="js/glightbox.min.js"></script>
<script src="js/navbar.js"></script>
<script src="js/counter.js"></script>
<script src="js/custom.js"></script>







<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>
