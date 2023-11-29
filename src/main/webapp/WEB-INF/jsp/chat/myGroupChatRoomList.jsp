<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/jsp/include/top.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/admintemplate/css/adminchat.css" rel="stylesheet">

	<div class="chatcontainer">
		<h3 class=" text-center">봉사 단체 회원 채팅방</h3>
		<div class="messaging">
			<div class="inbox_msg">
				<div class="inbox_people">
					<div class="headind_srch">
						<div class="recent_heading">
							<h4>봉사단체 채팅목록</h4>
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
				<c:forEach var="chatRoom" items="${groupChatRoomList}">
				    <div class="chat_list active_chat">
				        <div class="chat_people">
				            <div class="chat_img">
				                <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
				            </div>
				            <div class="chat_ib" id="roomList">
				                <c:choose>
				                    <c:when test="${not empty chatRoom.recruitSeq}">
				                        <h5>단체 주관한 채팅방: ${chatRoom.recruitTitle}
				                            <span class="chat_date">Dec 25</span>
				                        </h5>
				                        <p>대화방이 열렸습니다.</p>
				                        <button class="enter_chat_button" data-recruitSeq="${chatRoom.recruitSeq}" data-groupName="${chatRoom.groupName}" data-recruitTitle="${chatRoom.recruitTitle}">채팅방 입장</button>
				                    </c:when>
				                    <c:otherwise>
   											 <p>채팅방이 없습니다. 봉사 등록 시에 자동 개설 됩니다.</p>
				                    </c:otherwise>
				                </c:choose>
				            </div>
				        </div>
				    </div>
				</c:forEach>
					</div>
				</div>
	
			</div>
			<p class="text-center top_spac">Volunteer Sunil Rajput</p>
			<!-- Back to Top -->
		</div>
	</div>

<script type="text/javascript">


$(document).ready(() => {
    // 채팅방 입장 버튼에 대한 클릭 이벤트를 설정합니다.
    $('.enter_chat_button').on('click', function() {
        // 클릭한 버튼의 데이터 속성을 가져옵니다.
        const recruitSeq = $(this).data('recruitseq');
        const sender = $(this).data('groupname');
        const title = $(this).data('recruittitle');
        enterRoom(recruitSeq, sender, title);
    });
});

function enterRoom(recruitSeq, sender, title) {
    // 로컬 저장소에 데이터 저장
    localStorage.setItem('chat.recruitSeq', recruitSeq);
    localStorage.setItem('chat.sender', sender);
    localStorage.setItem('chat.title', title);

    // AJAX를 사용하여 서버에 데이터 전송
    $.ajax({
        url: '/userchat/setChatInfo',
        type: 'POST',
        data: {
            recruitSeq: recruitSeq,
            sender: sender,
            title: title
        },
        success: function(response) {
            // 서버 처리 성공 후 페이지 이동
            location.href = '/userchat/room/groupEnter';
        }
    });
}

</script>

<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>
