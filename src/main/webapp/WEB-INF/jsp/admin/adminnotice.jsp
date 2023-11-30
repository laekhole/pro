<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

 <%@ include file="/WEB-INF/jsp/include/admintop.jsp"%>
 <link href="/admintemplate/css/adminnotice.css" rel="stylesheet">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!--  sweetalert -->
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
       
          <!--공지사항 바디 리스트 -->
	<div class="notice-container">
		<div class="notice-actions">
			<!-- 검색 영역 -->
			<div class="notice-search">
				<select class="notice-select" name="type1" id="noticeCategory">
					<option value="title">제목</option>
					<option value="writeId">작성자</option>
					<option value="content">내용</option>
				</select> <input type="text" name="searchWord" id="noticeInput"
					class="search-input" placeholder="검색...">
				<button type="submit" class="search-btn">검색</button>
			</div>
	
			<!-- 새 공지사항 버튼 -->
		</div>
		<!-- 기타 공지사항 내용... -->
	</div>


<!-- 정렬 영역 -->
          <!-- 상단 고정 및 삭제 버튼 -->
          <div class="button-group">
            <div class="manage-buttons">
            
                <button class="btn btn-primary m-2" id="new-notice-btn">공지사항 등록</button>
                <button class="btn btn-primary m-2">상단 고정</button>
                <button class="btn btn-primary m-2">선택 삭제</button>
            </div>
            <div class="sort-area">
                <button class="btn btn-primary m-2">최신순</button>
                <button class="btn btn-primary m-2">조회순</button>
            </div>
        </div>
        
              <!-- 공지사항 목록 -->
          <div class="container mt-4" id="adminnoticeTableContainer">
		    <table class="table">
		        <thead>
		            <tr>
		            	<th><input type="checkbox" id="selectAll" onclick="noticeselectAllCheckboxes()"></th>
		                <th scope="col">공지번호</th>
		                <th scope="col">작성자</th>
		                <th scope="col">제목</th>
		                <th scope="col">등록일</th>
		                <th scope="col">수정일</th>
		                <th scope="col">조회수</th>
		                <th scope="col">고정여부</th>
		                <th scope="col">삭제이력</th>
		                <th scope="col">비고</th>
		            </tr>
		        </thead>
		        <tbody>
		            <c:forEach var="notice" items="${adminnoticeList}" varStatus="status">
		                <tr>
			              <td><input type="checkbox"></td>
			              <th scope="row">${notice.noticeSeq}</th>
			              <td>${notice.writeId}</td>
			              <td>${notice.title}</td>
			              <td>${notice.regDate}</td>
			              <td>${notice.modDate}</td>
			              <td>${notice.viewCount}</td>
			              <td>${notice.pixedYn}</td>
			              <td>${notice.delYn eq 'N' ? 'Active' : 'Deleted'}</td>
			              <td></td>
			            </tr>
		            </c:forEach>
		        </tbody>
		    </table>
		</div>
		
				<!-- 공지사항 다이얼로그 -->
		<div id="noticeDialog" class="dialog">
			<div class="dialog-content">
				<h2 class="dialog-title">새 공지사항 등록</h2>
				<form id="noticeForm" class="dialog-form">
					<div class="form-group">
						<label for="noticeTitle">제목</label> <input type="text"
							id="noticeTitle" name="title" class="form-control" required>
					</div>
					<div class="form-group">
						<label for="noticeContent">내용</label>
						<textarea id="noticeContent" name="content" class="form-control"
							rows="4" required></textarea>
					</div>
					<div class="form-group">
							<label for="fixedCheckbox">상단 고정</label> 
							<input type="checkbox" id="fixedCheckbox" name="pixedYn" class="form-control" value="Y">
					</div>
					<div class="form-group">
						<label for="noticeDate">등록 날짜</label> <input type="text"
							id="noticeDate" name="date" class="form-control" readonly>
					</div>
					<div class="form-group">
						<input type="hidden" id="noticeRegDate" name="regDate" value="">
						<input type="hidden" name="viewCount" value="0">
					</div>
					<div class="form-actions">
						<button type="submit" class="btn btn-primary">등록</button>
						<button type="button" class="btn btn-secondary" id="closeDialog">닫기</button>
					</div>
				</form>
			</div>
		</div>
		
		
		
		
<%@ include file="/WEB-INF/jsp/common/inc-paging.jsp"%>
 <%@ include file="/WEB-INF/jsp/include/adminbottom.jsp"%>

<script type="text/javascript">

// 모든 체크박스 선택/해제 함수
function noticeselectAllCheckboxes() {
    var checkboxes = document.querySelectorAll('tbody input[type="checkbox"]');
    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = document.getElementById('selectAll').checked;
    }
}

$(document).ready(function () {
    // 새 공지사항 등록 버튼 클릭 시 다이얼로그 열기
    $("#new-notice-btn").on("click", function () {
      // 다이얼로그 열기
      $("#noticeDialog").css("display", "block");
    });

    // 다이얼로그 닫기 버튼 클릭 시 다이얼로그 닫기
    $("#closeDialog").on("click", function () {
    // 다이얼로그 닫기
    $("#noticeDialog").css("display", "none");
});
    
    // 상단 고정 체크박스 이벤트 처리
//     $("#fixedCheckbox").on("change", function () {
//       // 체크 상태에 따라 pixedYn 값을 설정
//       var pixedYn = $(this).is(":checked") ? "Y" : "N";
//       $("#fixedCheckbox").val(pixedYn);
//     });
    $("#fixedCheckbox").on("change", function () {
    	  // 체크 상태에 따라 pixedYn 값을 설정
    	  var pixedYn = $(this).is(":checked") ? "Y" : "N";
    	  $(this).val(pixedYn);
    	});

    // 공지사항 등록 폼 제출 시
    $("#noticeForm").on("submit", function (e) {
      e.preventDefault();

      // 입력된 데이터 가져오기
      const title = $("#noticeTitle").val();
      const content = $("#noticeContent").val();
      const pixedYn = $("#fixedCheckbox").val();

      // AJAX를 사용하여 서버로 데이터 전송
      $.ajax({
        url: "/admin/insertnotice",
        type: "POST",
        contentType: "application/json; charset=UTF-8",
        data: JSON.stringify({
          title: title,
          content: content,
          pixedYn: pixedYn,
        }),
        dataType: "json",
        success: function (response) {
          // 서버로부터의 응답을 처리하는 코드
          console.log("서버 응답:", response);

          if (response && response.message) {
              // 성공 메시지가 있는 경우
              Swal.fire({
                icon: 'success',
                title: '성공',
                text: response.message
              }).then(function () {
	
                // 예를 들어, 다이얼로그 닫기 등의 동작을 추가할 수 있습니다.
                $("#noticeDialog").css("display", "none");
              location.reload();
              });
            } else if (response && response.error) {
            	console.error("else if 오류 발생:", error);
              // 오류 메시지가 있는 경우
              Swal.fire({
                icon: 'error',
                title: '오류',
                text: response.error
              });
            }
          },
          error: function (xhr, status, error) {
        	 
            // 오류 처리
            console.error("오류 발생:", status, error);

            // SweetAlert을 사용하여 오류 메시지를 표시
            Swal.fire({
              icon: 'error',
              title: '오류',
              text: '서버와 통신 중 오류가 발생했습니다.'
            });
          },
        });
      });
    });

</script>

