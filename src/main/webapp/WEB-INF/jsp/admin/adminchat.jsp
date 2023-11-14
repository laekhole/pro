<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="/WEB-INF/jsp/include/admintop.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/admintemplate/css/adminchat.css" rel="stylesheet">

<div class="container">
	<h3 class=" text-center">채팅방</h3>
	<div class="messaging">
		<div class="inbox_msg">
			<div class="inbox_people">
				<div class="headind_srch">
					<div class="recent_heading">
						<h4>채팅목록</h4>
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
					<c:forEach var="chatRoomItem" items="${chatlist}">
						<div class="chat_list">
							<div class="chat_people">
								<div class="chat_img">
									<img src="https://ptetutorials.com/images/user-profile.png"
										alt="sunil">
								</div>
								<div class="chat_ib">
									<h5>
										 ${chatRoomItem.roomName} <span class="chat_date"><fmt:formatDate value="${chatRoomItem.createdRoomTime}" pattern="yyyy-MM-dd HH:mm"/></span>
									</h5>
									<p>${chatRoomItem.recruitTitle}</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>


			</div>

			<div class="mesgs">
				<div class="msg_history">
					<div class="incoming_msg">
						<div class="incoming_msg_img">
							<img src="https://ptetutorials.com/images/user-profile.png"
								alt="sunil">
						</div>
						<div class="received_msg">
							<div class="received_withd_msg">
								<p>Test which is a new approach to have all solutions</p>
								<span class="time_date"> 11:01 AM | June 9</span>
							</div>
						</div>
					</div>
					<div class="outgoing_msg">
						<div class="sent_msg">
							<p>Test which is a new approach to have all solutions</p>
							<span class="time_date"> 11:01 AM | June 9</span>
						</div>
					</div>
					<div class="incoming_msg">
						<div class="incoming_msg_img">
							<img src="https://ptetutorials.com/images/user-profile.png"
								alt="sunil">
						</div>
						<div class="received_msg">
							<div class="received_withd_msg">
								<p>Test, which is a new approach to have</p>
								<span class="time_date"> 11:01 AM | Yesterday</span>
							</div>
						</div>
					</div>
					<div class="outgoing_msg">
						<div class="sent_msg">
							<p>Apollo University, Delhi, India Test</p>
							<span class="time_date"> 11:01 AM | Today</span>
						</div>
					</div>
					<div class="incoming_msg">
						<div class="incoming_msg_img">
							<img src="https://ptetutorials.com/images/user-profile.png"
								alt="sunil">
						</div>
						<div class="received_msg">
							<div class="received_withd_msg">
								<p>We work directly with our designers and suppliers, and
									sell direct to you, which means quality, exclusive products, at
									a price anyone can afford.</p>
								<span class="time_date"> 11:01 AM | Today</span>
							</div>
						</div>
					</div>
				</div>
				<div class="type_msg">
					<div class="input_msg_write" style="height: 194px;">
						<input type="text" class="write_msg" style="height: 100%;"
							placeholder="Type a message" />
						<button class="msg_send_btn" type="button">
							<i class="fa fa-paper-plane" aria-hidden="true"></i>
						</button>

					</div>
				</div>
			</div>

		</div>
		<p class="text-center top_spac">Volunteer Sunil Rajput</p>
		<!-- Back to Top -->
	</div>
</div>
<%@ include file="/WEB-INF/jsp/include/adminbottom.jsp"%>
<script type="text/javascript">



</script>