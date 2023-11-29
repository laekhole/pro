<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/jsp/include/top.jsp"%>

<head>
<title>단체 채팅방</title>
</head>
<link href="/admintemplate/css/groupChatRoom.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<c:url value='/resources/mqtt/mqtt.min.js'/>"></script>

<body>

	<div class="chat-container">
		<header class="chat-header">
			<h1>
				<i class="fas fa-smile"></i> 채팅방
			</h1>
			<a href="/userchat/chatGroupRoom?groupMemSeq=${principal.user.memSeq}"><button id="leave-room" class="btn">Chat List</button></a>
		</header>
		<main class="chat-main">
			<div class="chat-sidebar">
				<div class="room-info">
					<div class="room-title-section">
						<label for="room-title">주최한 봉사:</label>
						<h2 class="room-title" id="room-title">${title}</h2>
					</div>
					<div class="room-name-section">
						<label for="room-name">단체 이름:</label>
						<h3 class="room-name" id="room-name">${groupname}</h3>
					</div>
				</div>
				<!-- User List Section -->
				<ul id="users" class="user-list">
					<!-- User list will be dynamically populated here -->
				</ul>
			</div>
			<div class="chat-messages">
				<ul class="list-group" id="message_list">
					<!-- Messages will be here -->
				</ul>
			</div>
		</main>
		<div class="chat-form-container">
			<form id="chat-form">
				<input type="text" class="form-control" name="message" id="message"
					placeholder="메시지 입력하세요" required autocomplete="off" />
				<button class="btn btn-primary" type="button"
					id="send_message_button">
					<i class="fa fa-paper-plane" aria-hidden="true">보내기</i>
				</button>
			</form>
		</div>
	</div>

	<script type="text/javascript">
	 let notificationCount = 0;

	 // 알림 배지 업데이트 함수
	 const updateNotificationBadge = () => {
	     notificationCount++;
	     $(".notification-badge").text(notificationCount).show();
	 };
	
	 // 페이지 로드 시 알림 수 초기화
	 $(document).ready(function() {
	     $(".notification-badge").text(notificationCount).hide();
	 });
	 
    //MQTT 수신 받을 상태로 초기화를 한다
    //MQTT client
    const roomId = localStorage.getItem('chat.recruitSeq');
    const sender = localStorage.getItem('chat.sender');
    

    //MQTT info host, port, topic 을 설정.
    //const mqtt_host = "www.masugil.shop";
    //const mqtt_port = 9090; //websocket port : mosquitt.conf 파일에 설정됨 :   
    //const mqtt_topic = "/team1/sub/" + roomId;
    const mqtt_host = "www.amond.store";
    const mqtt_port = 9001; //websocket ssl port : mosquitt.conf 파일에 설정됨  
    const mqtt_topic = "/test/sub/" + roomId;
    //*websocket에 ssl 적용시
    //아래 내용 mosquitt.conf 파일에 추가함 
		//listener 8883
		//protocol websockets
		//cafile /etc/ssl/ca_bundle.crt
		//certfile /etc/ssl/certificate.crt
		//keyfile /etc/ssl/private.key
		//require_certificate false
		//tls_version tlsv1.2
    

    const options = {
//     		  protocol : 'wss',
    		  hostname : mqtt_host,
          port: mqtt_port,
          username : 'kosa',
          password : '1004',
          clean: true,
    }
    console.log('Connecting mqtt client ');
    console.log('mqtt_topic -> ', mqtt_topic);
      
    const mqttClient = mqtt.connect(options);
    console.log('mqttClient -> ', mqttClient);

    const disconnect = () => {
         console.log('mqtt 연결 끊음');
         mqttClient.end();
    }  
      
    mqttClient.on('error', (err) => {
        console.log('Connection error: ', err)
        mqttClient.end()
    });
      
    mqttClient.on('reconnect', () => {
        console.log('Reconnecting...')
    });
      
    mqttClient.on('connect', () => {
    	  console.log('Connected')
        //구독 메시지 등록 
        //메시지 수신 이벤트 핸들러 등록
        subscribe();
          
        //채팅방에 입장 메시지를 서버에 전송한다
        enterSendMessage();
    });
      
    // 구독 메시지 수신 
    mqttClient.on('message', function (topic, message) {
        // message is Buffer
        console.log("mqtt message receive :", message.toString())
        recvMessage(JSON.parse(message.toString()))
    })
      
    $("#message").on("keydown", e => {
    	  if (e.keyCode == 13) {
    		  sendMessage();
        }
    });
        
    $("#send_message_button").on("click", e => {
        sendMessage();
    });
        
    $("#leave_button").on("click", e => {
    	  $("#leave_button,#send_message_button").addClass("disabled");
        $("#reenter_button").removeClass("disabled");
        
        //잠시 나간다 . 메시지 수신을 하는 않는다
        unsubscribe();
               
        //채팅방에 퇴장메시지를 서버에 전송한다
        leaveSendMessage();

    });
        
    $("#reenter_button").on("click", e => {
    	  $("#reenter_button").addClass("disabled");
        $("#leave_button,#send_message_button").removeClass("disabled");
        
        //채팅방에 입장한다
        //구독을 신청한다 
        subscribe();
            
        //채팅방에 입장 메시지를 서버에 전송한다
        enterSendMessage();
    });

        
    $(document).ready(()=>{
    	  //채팅방의 정보를 얻는다
        console.log("before getRoomInfo");            
        getRoomInfo();
            
        $(window).on("beforeunload", e => {
        	  //구독을 해제 한다
            unsubscribe();
            mqttClient.disconnect();
        })
    });

    //메시지 수신 이벤트 핸들러 등록
    //구독을 등록한다
    const subscribe = () => {
    	  mqttClient.subscribe(mqtt_topic, err => {
    		  console.log("Subscribe to a topic 생성");
    		  if (!err) {
    			  console.log("error", err);
          } else {
          }
        })
    }
        
    //메시지 수신를 해제 한다 
    //구독을 해제한다
    const unsubscribe = () => {
    	  mqttClient.unsubscribe(mqtt_topic);
    }
        
    //roomId를 이용하여 채팅방 정보를 출력한다 
    //현재는 이름만 출력함  
    const getRoomInfo = () => {
        $.ajax({ 
            type: "GET",
            url: "<c:url value='/admin/SelectRoom/'/>" + roomId,
            dataType: "json" // 요청을 서버로 해서 응답이 왔을 때 기본적으로 모든 것이 문자열 (생긴게 json이라면) => javascript오브젝트로 변경
        }).done(resp => {
            //채팅방의 이름을 출력한다 
            console.log("getRoomInfo resp", resp);            
            $("#room-name").text(resp.name + " - " + sender);
        }).fail(err => {
            console.log("getRoomInfo error", err);            
        }); 
    }
        
    //입장메시지를 전송한다
    const enterSendMessage = () => {
    	  console.log("enterSendMessage ")
        
    	  //채팅방에 입장을 서버에 전송한다
    	  mqttClient.publish(mqtt_topic, JSON.stringify({type:'ENTER', roomId : roomId, sender : '[알림]', message : sender + "님 입장하셨습니다"}));
    }
        
    //퇴장메시지를 전송한다
    const leaveSendMessage = () => {
    	  //채팅방에 입장을 서버에 전송한다
        mqttClient.publish(mqtt_topic, JSON.stringify({type:'LEAVE', roomId : roomId, sender : '[알림]', message : sender + "님 퇴장하셨습니다"}));
    }
        

    //서버에 메시지를 전송한다
//     const sendMessage = () => {
//     	  const message = $("#message").val();
//         mqttClient.publish(mqtt_topic, JSON.stringify({type:'TALK', roomId : roomId, sender : sender, message:message}));
//         $("#message").val("");
//     };
         
//     const recvMessage = recv =>  {
//     	  console.log(recv);
//         $("#message_list").prepend('<li class="list-group-item" >[' + recv.sender + '] - ' + recv.message + '</li>'); 
        
//         if(recv.sender !== sender){
//             updateNotificationBadge(); // 알림 배지 업데이트
//             }      
//     }
    const sendMessage = () => {
    const message = $("#message").val();
    mqttClient.publish(mqtt_topic, JSON.stringify({type: 'TALK', roomId: roomId, sender: sender, message: message}));
    $("#message").val("");
};

    const recvMessage = recv => {
        let messageClass = (recv.sender === sender) ? 'sent-message' : 'received-message';
        let messageElement = '<li class="list-group-item ' + messageClass + '" >[' + recv.sender + '] - ' + recv.message + '</li>';
        $("#message_list").prepend(messageElement);
        
        if (recv.sender !== sender) {
            updateNotificationBadge(); // 알림 배지 업데이트
        }
    };
    
    </script>
</body>
