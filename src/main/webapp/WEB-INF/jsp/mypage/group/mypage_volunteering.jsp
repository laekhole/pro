<%@ include file="/WEB-INF/jsp/include/top.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/page/group.css" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<div class="d-flex" id="wrapper">
      <!-- Sidebar-->
      <div>
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
      <!-- Page content wrapper-->
      <div style="width:85%;">

         <div class="kanban-board">
            <div class="column" id="details-map-column">
			    <h2 style="color: black; font-size: 25px; font-weight: bold;"> </h2>
			    <div id="volunteer-details">
			        <!-- 봉사활동 정보 표시 -->
			        <h2 style="text-aling:center; margin-top:50px;"><img src="/images/location6.png" style="width:40px;"></h2>
			        <h1 style="color: black; font-size: 30px; font-weight: bold; text-align:center">${recruit.recruitTitle}</h1>
			        <div class="card">
			        <table style="margin-top : 50px; margin-bottom : 50px;">
			              <tr style="border-top: 1px solid #ddd;">
					          <th>글번호</th>
					          <td>${recruit.recruitSeq} 번</td>
					          <th>봉사단체</th>
					          <td>${recruit.groupName}</td>
					      </tr>
					      <tr style="border-top: 1px solid #ddd;">
					        <th>봉사번호</th>
					        <td>123 번</td>
					        <th>봉사장소</th>
					        <td>${recruit.volunAddr}</td>
					      </tr>
					      <tr style="border-top: 1px solid #ddd;">
					        <th>모집기간</th>
					        <td>${recruit.volunStartDate} ~ ${recruit.volunEndDate}</td>
					        <th>봉사기간</th>
					        <td>${recruit.volunStartDate} ~ ${recruit.volunEndDate}</td>
					      </tr>
					      <tr style="border-top: 1px solid #ddd;">
					        <th>모집인원</th>
					        <td>${recruit.memCount} 명</td>
					        <th>신청인원</th>
					        <td>${recruit.count} 명</td>
					      </tr>
					  </table>
					  
					  <div class="map">
						<div id="map" style="width:100%;height:350px;"></div>
					  </div>
				
					  </div>
			    </div>


			</div>

    
    

            <div class="column" id="attendees-column">
                <h2 style="text-aling:center; margin-top:50px;"><img src="/images/list3.png" style="width:40px;"></h2>
			        <h1 style="color: black; font-size: 30px; font-weight: bold; text-align:center; margin-bottm:50px;">회원 출석 여부</h1>
					
					<div class="card" style="min-height:630px;">
					<table style="margin-top:50px;">
					    <tr>
					        <th class="rounded-cell">회원번호</th>
					        <th class="rounded-cell">이름</th>
					        <th class="rounded-cell">승인여부</th>
					        <th class="rounded-cell">출석여부</th>
					    </tr>
					
						<c:forEach items="${volunteer}" var="volunteer">
						    <tr>
						        <td style="border:none; border-bottom: 1px solid #ddd;  border-radius: 5px;">${volunteer.memSeq}</td>
						        <td style="border:none; border-bottom: 1px solid #ddd;  border-radius: 5px;">${volunteer.name}</td>
						        <td style="border:none; border-bottom: 1px solid #ddd;  border-radius: 5px;">${volunteer.state}</td>
						        <td style="border:none; border-bottom: 1px solid #ddd;  border-radius: 5px;" class="attendanceCk" id="attendanceCkId_${volunteer.memSeq}"></td>
						    </tr>
						</c:forEach>


					</table>
					</div>

            </div>
            
        </div>

            

      </div>
   </div>
   <!-- MQTT.js 라이브러리 포함 -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/mqtt/3.0.0/mqtt.min.js"></script>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=259b6e4c0775108f360aa1e89a7a9d32"></script>
   <script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(${recruit.latitude}, ${recruit.longitude}), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(${recruit.latitude}, ${recruit.longitude}); 
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);    
    </script>
	<script>
	    const mqtt_host = "www.amond.store";
	    const mqtt_port = 9001;
	    const mqtt_topic = "/recruitSeq/${recruit.recruitSeq}";
	
	    // 페이지 로드 시 MQTT 클라이언트 초기화
		const options = {
		    hostname: mqtt_host,
		    port: mqtt_port,
		    username: 'kosa',
		    password: '1004',
		    clean: true,
		};
	
		// MQTT 클라이언트 생성 및 초기화
		const mqttClient = mqtt.connect(options);
		
	 	// MQTT 에러 핸들링
	    mqttClient.on('error', function (err) {
	        console.error('MQTT 연결 중 에러 발생:', err);
	    });
	 
	 	// MQTT 연결 성공 시 해당 토픽들을 구독
	    mqttClient.on('connect', function () {
		    console.log("진행1");
		
		    // 토픽 출력
		    console.log("mqtt_topic : " + mqtt_topic);
		
		    // 여기서 토픽을 subscribe
		    mqttClient.subscribe(mqtt_topic, function (err) {
		        if (!err) {
		            console.log('MQTT 토픽 구독 성공:', mqtt_topic);
		        } else {
		            console.error('MQTT 토픽 구독 실패', err);
		        }
		    });
		});
	
	 // MQTT 메시지 수신 이벤트 핸들러
	    mqttClient.on('message', function (topic, receivedMessage) {
	        console.log("진행2");
	        console.log("topic : " + topic);
	        console.log("receivedMessage : " + receivedMessage);

		    const [memSeq, message] = receivedMessage.toString().split('|');
		        console.log("[memSeq, message] : " +[memSeq, message] );
			console.log("memSeq : " + memSeq);
			console.log("message : " + message);
			
			updateAttendanceStatus(memSeq, message);
		 });

	 
	    function updateAttendanceStatus(memSeq, message) {
	        console.log("진행3");

	        // 해당 회원의 출석 여부 업데이트
	        const attendanceElement = document.getElementById("attendanceCkId_" + memSeq);
	        if (attendanceElement) {
	            attendanceElement.innerHTML = message; // 메시지를 표시하거나 원하는 로직으로 처리
	            console.log("memSeq : " + memSeq);
	            console.log("message : " + message);
	        } else {
	            console.error("Element not found for memSeq ");
	        }
	    }

	</script>



	


