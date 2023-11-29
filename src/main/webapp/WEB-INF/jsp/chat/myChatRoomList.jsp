<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/jsp/include/top.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/admintemplate/css/adminchat.css" rel="stylesheet">

	<div class="chatcontainer">
		<h3 class=" text-center">봉사 개인회원 채팅방</h3>
		<div class="messaging">
			<div class="inbox_msg">
				<div class="inbox_people">
					<div class="headind_srch">
						<div class="recent_heading">
							<h4>개인회원 채팅목록</h4>
						</div>
						<div class="srch_bar">
							<div class="stylish-input-group">
								<input type="text" class="search-bar" placeholder="Search">
								<span class="input-group-addon">
									<button type="button">
										<i class="fa fa-search" aria-hidden="true"></i>
									</button>
								</span>
							</div>
						</div>
					</div>
					<div class="inbox_chat">
					<c:forEach var="chatRoom" items="${mychatInfoList}">
						<div class="chat_list active_chat">
							<div class="chat_people">
								<div class="chat_img">
									<img src="https://ptetutorials.com/images/user-profile.png"
										alt="sunil">
								</div>
								<c:if test="${not empty chatRoom.recruitSeq}">
								<div class="chat_ib" id="roomList">
									<h5>나의 신청게시글번호:${chatRoom.recruitSeq}
										<span class="chat_date">Dec 25</span>
									</h5>
									<p>대화방이 열렸습니다.</p>
									<button class="enter_chat_button" 
					            data-recruitSeq="${chatRoom.recruitSeq}" 
					            data-name="${chatRoom.name}">채팅방 입장</button>
								</div>
								</c:if>
								<c:if test="${empty chatRoom.recruitSeq}">
   											 <p>채팅방이 없습니다. 봉사 신청 후 승인 시에 해당 봉사채팅방 개설됩니다.</p>
								</c:if>
							</div>
						</div>
				</c:forEach>
					</div>
				</div>
	
			</div>
			<p class="text-center top_spac">Volunteer 4조 프로젝트</p>
			<!-- Back to Top -->
		</div>
	</div>

<script type="text/javascript">


// $(document).ready(() => {
//     // 채팅방 입장 버튼에 대한 클릭 이벤트를 설정합니다.
//     $('.enter_chat_button').on('click', function() {
//     	const recruitSeq = `${mychatinfo.recruitSeq}`;
//     	const sender = `${mychatinfo.name}`;
// //     	const name = `${mychatinfo.name}`;
// //         const recruitSeq = ${mychatinfo.recruitSeq};
// //         const sender = ${memSeq};
//         enterRoom(recruitSeq, sender);
//     });
// });

$(document).ready(() => {
    // 채팅방 입장 버튼에 대한 클릭 이벤트를 설정합니다.
    $('.enter_chat_button').on('click', function() {
        // 클릭한 버튼의 데이터 속성을 가져옵니다.
        const recruitSeq = $(this).data('recruitseq');
        const sender = $(this).data('name');
        enterRoom(recruitSeq, sender);
    });
});

function enterRoom(recruitSeq, sender) {
    // 로컬 저장소에 데이터 저장
    localStorage.setItem('chat.recruitSeq', recruitSeq);
    localStorage.setItem('chat.sender', sender);

    // AJAX를 사용하여 서버에 데이터 전송
    $.ajax({
        url: '/userchat/setChatmyInfo',
        type: 'POST',
        data: {
            recruitSeq: recruitSeq,
            sender: sender,
        },
        success: function(response) {
            // 서버 처리 성공 후 페이지 이동
            location.href = '/userchat/room/enter';
        }
    });
}

</script>

<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>
