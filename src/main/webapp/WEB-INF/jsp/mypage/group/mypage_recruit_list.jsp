<%@ include file="/WEB-INF/jsp/include/top.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/page/group.css" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


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
                            <th>성별</th>
                            <th>상태</th>
                            <th>신청일</th>
                        </tr>
                        
                        <c:forEach var="state" items="${state}">
                        <tr>
                        	<td class="volunProceedSeq" data-volunProceedSeq="${state.volunProceedSeq}">${state.volunProceedSeq}</td>
                            <td>${state.recruitSeq}</td>
                            <td>${state.memSeq}</td>
                            <td>${state.name}</td>
                            <td>${state.gender}</td>                                            
                            <td>
                                <div class="button-container">
                                	<input type="hidden" value="${state.state}">
                                	<button onclick="moveToAccepted(this)" >승인</button>
                                    <button onclick="openRejectDialog(this)" >거절</button>
                                </div>
                            </td>
							<td id="startDate">${state.startDate}</td>
                        </tr>
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
                            <th>성별</th>
                            <th>상태</th>
                            <th>확정일</th>
                        </tr>
                    </table>
                </div>
                
				<!-- 거절 내역 카드 -->
				<div class="card rejection-card" style="min-height:300px;">
				    <table style="font-size:13px;">
				        <tr>
				            <th>신청번호</th>
				            <th>봉사글번호</th>
				            <th>회원번호</th>
				            <th>이름</th>
				            <th>성별</th>
				            <th id="statusCell" class="reject-status">상태</th>
				            <th>확정일</th>
				        </tr>
				    </table>
				</div>

                
            </div>

        
        </div>
    
		<div id="rejectDialog" class="modal">
		    <div class="modal-content">
		        <span class="close" onclick="closeRejectDialog()">&times;</span>
		        <h2>거절 사유 입력</h2>
		        <textarea id="rejectionReason" rows="4" cols="50"></textarea>
		        <button onclick="sendRejectionReason(this)">전송</button>
		    </div>
		</div>

      </div>
      

      </div>

<script>
  function registerBtn() {
	  alert("등록되었습니다.");
	  
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


<script>

/* 승인 */
function moveToAccepted(button) {
    const card = button.parentNode.parentNode.parentNode; // 수정
    console.log("card : " + card);
    const currentDate = new Date();
    const approvalDate = currentDate.getFullYear() + '-' + (currentDate.getMonth() + 1) + '-' + currentDate.getDate();
    card.querySelector("td:last-child").textContent = approvalDate;
    console.log(card.querySelector("td:last-child").textContent);

    // 승인 버튼을 비활성화
    const buttons = card.querySelectorAll("button");
    console.log(buttons);
    buttons[0].style.display = "none"; // 승인 버튼 숨기기
    buttons[1].style.display = "none"; // 거절 버튼 숨기기

    // '승인' 상태로 변경
    const statusCell = card.querySelector("td:nth-last-child(2)"); // '상태' 셀 선택
    statusCell.textContent = '승인';
    
    // 승인 목록에 카드 추가
    const acceptedTable = document.getElementById('accepted-column').querySelector('table');
    acceptedTable.appendChild(card);
}


/* 거절 */

/* 거절 */

function openRejectDialog(button) {
    const rejectDialog = document.getElementById('rejectDialog');
    rejectDialog.style.display = "block";
}

function sendRejectionReason(button) {
    const rejectionReason = document.getElementById('rejectionReason').value;
    console.log("거절 사유: " + rejectionReason);

    // 테이블 행(카드)를 찾기 위해 부모 엘리먼트 탐색
    const card = button.parentNode.parentNode.parentNode; // 수정
    console.log("card : " + card);

    if (card) {
        // 승인, 거절 버튼을 비활성화
        const buttonContainers = card.querySelectorAll("button");
        console.log(buttonContainers);

        // 각 .button-container 엘리먼트 내에서 버튼을 찾아 비활성화
        buttonContainers.forEach(buttonContainer => {
            const buttons = buttonContainer.querySelectorAll("button");
            buttons[0].style.display = "none"; // 승인 버튼 숨기기
            buttons[1].style.display = "none"; // 거절 버튼 숨기기
        });

        // '거절' 상태로 변경
        const statusCell = card.querySelector(".reject-status"); // '상태' 셀 선택
        console.log("statusCell: " + statusCell);

        if (statusCell) {
            statusCell.textContent = '거절';

            // 현재 날짜 열 추가
            const currentDate = new Date();
            const approvalDate = currentDate.getFullYear() + '-' + (currentDate.getMonth() + 1) + '-' + currentDate.getDate();
            card.querySelector("td:last-child").textContent = approvalDate;

            // "거절 목록" 테이블로 이동
            const rejectedTable = document.querySelector('.rejection-card table');
            rejectedTable.appendChild(card);

            // 모달 대화 상자 닫기
            const rejectDialog = document.getElementById('rejectDialog');
            rejectDialog.style.display = "none";

            // 모달 대화 상자 내용 초기화
            document.getElementById('rejectionReason').value = "";
        }
    }
}






function closeRejectDialog() {
    const rejectDialog = document.getElementById('rejectDialog');
    rejectDialog.style.display = "none";
}


</script>


<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>

