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
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/manager/main?groupSeq=${principal.user.memSeq}">마이 페이지</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/recruit/registerForm">신청 글 작성</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/manager/registerList?groupSeq=${principal.user.memSeq}">신청 글 목록</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/manager/updateState?groupSeq=${principal.user.memSeq}">신청 목록/ 승인 및 거절</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/manager/volunteeringList?groupSeq=${principal.user.memSeq}">진행 중인 봉사</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/manager/review?groupSeq=${principal.user.memSeq}">봉사활동 후기글</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/manager/calendar?groupSeq=${principal.user.memSeq}">캘린더 관리</a>
               <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/manager/profile?groupSeq=${principal.user.memSeq}">개인 정보 및 프로필 수정</a>
         </div>
         
      </div>
      <input type="hidden" id="GROUP_MEM_SEQ" name="groupMemSeq" value="${principal.user.memSeq}">
      <div style="width:100%">
      
         <div class="kanban-board">
            <div class="column" id="waiting-column" style="min-height:700px; margin-bottom:50px;">
                <h2 style="color: black;
                font-size: 25px;
                font-weight: bold;"><img src="/images/list4.png" style="width:22px;">   신청 대기 목록</h2>
                
                
                <div class="card" style="min-height: 870px;">
                    <table style="font-size:13px; border:none;">
				      <tr>
				          <th class="rounded-cell">신청번호</th>
				          <th class="rounded-cell">봉사신청글 제목</th>
				          <th class="rounded-cell">회원번호</th>
				          <th class="rounded-cell">이름</th>
				          <th class="rounded-cell">상태</th>
				      </tr>
                        
                        <c:forEach var="state" items="${state}">
                        <tbody id="stateList">
                        	        <input type="hidden" id="mem_count" name="memCount" value="${state.memCount}">
	                        		<input type="hidden" id="count" name="count" value="${state.count}">
	                        <tr id="statestateList">
	                            <td class="volunProceedSeq" id="volun_proceed_seq" style="border:none;  border-bottom: 1px solid #ddd;  border-radius: 5px;">${state.volunProceedSeq}</td>
	                            <td id="recruitTitle" style="border:none;  border-bottom: 1px solid #ddd;  border-radius: 5px;">${state.recruitTitle}</td>
	                            <td id="memSeq" style="border:none;  border-bottom: 1px solid #ddd;  border-radius: 5px;">${state.memSeq}</td>
	                            <td id="name" style="border:none;  border-bottom: 1px solid #ddd;  border-radius: 5px;">${state.name}</td>                                           
	                            <td id="statestate" style="border:none;  border-bottom: 1px solid #ddd;  border-radius: 5px;">
	                                <div class="button-container">
	                                   <input type="hidden" value="${state.state}" id="state">
		                                   <button onclick="moveToAccepted(this)" style="background-color:#3ab41cb5;  font-weight:bold;">승인</button>         
		                                   <button style="background-color:#ff7c7c; font-weight:bold;" onclick="openRejectDialog(${state.volunProceedSeq})">거절</button>
	                                </div>
	                            </td>
	                        </tr>
                        </tbody>
                        </c:forEach>
                        
                    </table>
                </div>
            </div>
            
         	<!-- 신청 확정 내역 -->

            <div class="column" id="accepted-column" style="margin-bottom:50px;">
            
                <!-- 승인 내역 카드 -->
                <h2 style="color: black; font-size: 25px; font-weight: bold;"><img src="/images/list4.png" style="width:22px;">   승인 목록</h2>
                <div class="card" style="min-height:400px;">
                    <table style="font-size:13px; border:none;">
                        
				      <tr>
				          <th class="rounded-cell">신청번호</th>
				          <th class="rounded-cell">봉사신청글 제목</th>
				          <th class="rounded-cell">회원번호</th>
				          <th class="rounded-cell">이름</th>
				          <th class="rounded-cell">상태</th>
				      </tr>
                        
                        <tbody id="approveList">
	                        <c:forEach var="approve" items="${approve}">
		                        	<tr id="approveDetail">
			                            <td class="approveVolunProceedSeq" style="border:none; border-bottom: 1px solid #ddd;  border-radius: 5px;">${approve.volunProceedSeq}</td>
			                            <td id="approveRecruitTitle" style="border:none; border-bottom: 1px solid #ddd;  border-radius: 5px;">${approve.recruitTitle}</td>
			                            <td id="approveMemSeq" style="border:none; border-bottom: 1px solid #ddd;  border-radius: 5px;">${approve.memSeq}</td>
			                            <td id="approveName" style="border:none; border-bottom: 1px solid #ddd;  border-radius: 5px;">${approve.name}</td>                                           
			                            <td id="approveState" style="border:none; border-bottom: 1px solid #ddd;  border-radius: 5px;">${approve.state}</td>
			                        </tr>
	                        </c:forEach>
                        </tbody>
                        
                     	<tr id="approveapproveList" style="display: none;">
                            <td class="approveVolunProceedSeq" style="border:none; border-bottom: 1px solid #ddd;  border-radius: 5px;"></td>
                            <td id="approveRecruitTitle" style="border:none; border-bottom: 1px solid #ddd;  border-radius: 5px;"></td>
                            <td id="approveMemSeq" style="border:none; border-bottom: 1px solid #ddd;  border-radius: 5px;"></td>
                            <td id="approveName" style="border:none; border-bottom: 1px solid #ddd;  border-radius: 5px;"></td>                                           
                            <td id="approveState" style="border:none; border-bottom: 1px solid #ddd;  border-radius: 5px;"></td>
	                    </tr>
                    </table>
                </div>
                
                <!-- 거절 내역 카드 -->
                <h2 style="color: black; font-size: 25px; font-weight: bold;"><img src="/images/list4.png" style="width:22px;">   거절 목록</h2>
                <div class="card" style="min-height:400px;">
                    <table style="font-size:13px;">
                        
				      <tr>
				          <th class="rounded-cell">신청번호</th>
				          <th class="rounded-cell">봉사신청글 제목</th>
				          <th class="rounded-cell">회원번호</th>
				          <th class="rounded-cell">이름</th>
				          <th class="rounded-cell">상태</th>
				      </tr>
                        
                        <tbody id="rejectList">
	                        <c:forEach var="reject" items="${reject}">
		                        	<tr id="rejectDetail">
			                            <td class="rejectVolunProceedSeq" style="border:none; border-bottom: 1px solid #ddd;  border-radius: 5px;">${reject.volunProceedSeq}</td>
			                            <td id="rejectRecruitTitle" style="border:none; border-bottom: 1px solid #ddd;  border-radius: 5px;">${reject.recruitTitle}</td>
			                            <td id="rejectMemSeq" style="border:none; border-bottom: 1px solid #ddd;  border-radius: 5px;">${reject.memSeq}</td>
			                            <td id="rejectName" style="border:none; border-bottom: 1px solid #ddd;  border-radius: 5px;">${reject.name}</td>                                           
			                            <td id="rejectState" style="border:none; border-bottom: 1px solid #ddd;  border-radius: 5px;">${reject.state}</td>
			                        </tr>
	                        </c:forEach>
                        </tbody>
                        
                     	<tr id="rejectrejectList" style="display: none;">
	                            <td class="rejectVolunProceedSeq" style="border-bottom: 1px solid #ddd;  border-radius: 5px;"></td>
	                            <td id="rejectRecruitTitle" style="border-bottom: 1px solid #ddd;  border-radius: 5px;"></td>
	                            <td id="rejectMemSeq" style="border-bottom: 1px solid #ddd;  border-radius: 5px;"></td>
	                            <td id="rejectName" style="border-bottom: 1px solid #ddd;  border-radius: 5px;"></td>                                           
	                            <td id="rejectState" style="border-bottom: 1px solid #ddd;  border-radius: 5px;"></td>
	                    </tr>
                     	
                    </table>
                </div>
                
            </div>

        
        </div>

        
        <div id="rejectDialog" class="modal">
        <input type="hidden" id="volunSeq" value="">
            <div class="modal-content">
               <span class="close" onclick="closeRejectDialog()">&times;</span>
               <h4>거절 사유 입력</h4>
               <textarea id="rejectMessage" rows="4" cols="50"></textarea>
               <div style="float:right; margin-top: 10px; margin-left: 89%;">
               		<button style="background-color:#ff7c7c; width: 70px;" onclick="sendRejectionReason(this)" >전송</button>
               </div>
            </div>
        </div>

	  
    </div>
</div>
 

<script>


function moveToAccepted(button) {
    button.disabled = true;

    const state = $(button).closest("tr").find("#state").val();
    const volunProceedSeq = $(button).closest("tr").find(".volunProceedSeq").text();
    const groupMemSeq = $("#GROUP_MEM_SEQ").val();
    const count = $("#count").val();
    const memCount = $("#mem_count").val();

    console.log("state : " + state);
    console.log("volunProceedSeq : " + volunProceedSeq);
    console.log("groupMemSeq : " + groupMemSeq);
    console.log("신청한인원수 : " + count);
    console.log("모집인원수 : " + memCount);
    
    const param = {
        state: state,
        volunProceedSeq: volunProceedSeq,
        groupMemSeq: groupMemSeq,
        count: count,
        memCount: memCount,
    };
    
    console.log("state2 : " + state);
    console.log("volunProceedSeq2 : " + volunProceedSeq);
    console.log("groupMemSeq2 : " + groupMemSeq);
    console.log("신청한인원수 : " + count);
    console.log("모집인원수 : " + memCount);

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
            if (json.approve) {  // 추가: 성공적으로 승인된 경우에만 처리
                // 성공적으로 승인되었을 때, 승인 상태로 변경하고 목록에서 삭제
                const count = json.approve.count; // 업데이트된 count 값

	            // UI에서 count 값을 업데이트
	            $("#count").val(count); // 혹은 다른 방법으로 UI를 업데이트
            
                console.log("성공1");
                const row = $(button).closest("tr");
                console.log("성공2");
                row.remove();
                console.log("성공3");

                const approveList = $("#approveList"); // 댓글 목록 요소 (전체 데이터)
                approveList.empty();

                // 승인 데이터를 가져오는 방식에 따라서 아래 코드 수정이 필요합니다.
                const approves = json.approve.approve; // 승인 데이터 가져오기
                console.log(approves);
                console.log("성공4");

                approves.forEach((approve) => {
                    const approveapproveList = $("#approveapproveList").clone();

                    console.log("성공5");
                    console.log(approve);

                    approveapproveList.find(".approveVolunProceedSeq").text(approve.volunProceedSeq);
                    approveapproveList.find("#approveRecruitTitle").text(approve.recruitTitle);
                    approveapproveList.find("#approveMemSeq").text(approve.memSeq);
                    approveapproveList.find("#approveName").text(approve.name);
                    approveapproveList.find("#approveState").text(approve.state);

                    // 목록에 새로운 행 추가
                    approveapproveList.show();
                    approveList.append(approveapproveList);
                })
                
                alert("승인되었습니다.");
                
            } else {
                alert('승인에 실패했습니다: ' + json.message);
                console.log(json.message);
            }
        } else {
            alert('승인에 실패했습니다: ' + json.message);
            console.log(json.message);
        }
    });

}


 function sendRejectionReason(button) {

	    const state = document.getElementById('state').value;
	    const rejectMessage = document.getElementById('rejectMessage').value;
	   /*  const volunProceedSeq = document.getElementById('volun_proceed_seq').textContent; */
	    const volunProceedSeq = $("#volunSeq").val();
		const groupMemSeq = $("#GROUP_MEM_SEQ").val();

	    console.log("state: " + state);
 	    console.log("거절 사유: " + rejectMessage);
	    console.log("volunProceedSeq: " + volunProceedSeq);
	    console.log("groupMemSeq : " + groupMemSeq);

	    const param = {
	        state: state,
 	        rejectMessage: rejectMessage,
	        volunProceedSeq: volunProceedSeq,
	        groupMemSeq: groupMemSeq,
	    };
	    
	    console.log("state2: " + state);
 	    console.log("거절 사유2: " + rejectMessage);
	    console.log("volunProceedSeq2: " + volunProceedSeq);
	    console.log("groupMemSeq2 : " + groupMemSeq);

	    fetch("<c:url value='/manager/reject'/>", {
	        method: "POST",
	        headers: {
	            "Content-Type": "application/json; charset=UTF-8",
	        },
	        body: JSON.stringify(param),
	    })
	    .then((response) => response.json())
	    .then((json) => {
	        if (json.status) {
				alert("거절되었습니다.");
	        	const volunProceedSeq = $("#volunSeq").val(); // 서버에서 받은 값

	        	// volunProceedSeq 값을 가진 행을 찾아서 삭제
	        	$("#stateList .volunProceedSeq").filter(function() {
	        	    return $(this).text() === volunProceedSeq;
	        	}).closest("tr").remove();

	        	

	            const rejectList = $("#rejectList"); // 거절 목록 요소 (전체 데이터)
	            rejectList.empty();

	            // 거절 데이터를 가져오는 방식에 따라서 아래 코드 수정이 필요합니다.
	            const rejects = json.reject.reject; // 거절 데이터 가져오기
	            console.log(rejects);
	            console.log("성공4");

	            rejects.forEach((reject) => {
	                const rejectrejectList = $("#rejectrejectList").clone();

	                console.log("성공5");
	                console.log(reject);

	                rejectrejectList.find(".rejectVolunProceedSeq").text(reject.volunProceedSeq);
	                rejectrejectList.find("#rejectRecruitTitle").text(reject.recruitTitle);
	                rejectrejectList.find("#rejectMemSeq").text(reject.memSeq);
	                rejectrejectList.find("#rejectName").text(reject.name);
	                rejectrejectList.find("#rejectState").text(reject.state);

	                // 목록에 새로운 행 추가
	                rejectrejectList.show();
	                rejectList.append(rejectrejectList);

	             	// 모달 대화 상자 닫기
	                const rejectDialog = document.getElementById('rejectDialog');
	                rejectDialog.style.display = "none";


	                // 모달 대화 상자 내용 초기화
	                document.getElementById('rejectMessage').value = "";

	            })
	            
	            
	            
	            
	            
	        } else {
	            alert('거절에 실패했습니다: ' + json.message);
	            console.log(json.message);
	        }
	    })
	    .catch(error => {
	        console.error('오류 발생:', error);
	    });
	}

 
 
 
 /* 거절폼 */

function openRejectDialog(seq) {
    const rejectDialog = document.getElementById('rejectDialog');
    console.log("뭐가쓰이는걸까1");
    $("#volunSeq").val(seq);
    
    rejectDialog.style.display = "block";
}



function closeRejectDialog() {
    const rejectDialog = document.getElementById('rejectDialog');
    rejectDialog.style.display = "none";
}

	

</script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/tiny-slider.js"></script>

<script src="js/flatpickr.min.js"></script>


<script src="js/aos.js"></script>
<script src="js/glightbox.min.js"></script>
<script src="js/navbar.js"></script>
<script src="js/counter.js"></script>
<script src="js/custom.js"></script>







<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>
