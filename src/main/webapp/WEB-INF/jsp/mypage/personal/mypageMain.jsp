<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>






	<%@ include file="/WEB-INF/jsp/include/top.jsp"%>





	<%@ include file="/WEB-INF/jsp/include/sidebar.jsp"%> 
    
      <!-- Page content wrapper-->
      <div class="col-md-10 col-lg-9 col-xl-10" id="page-content-wrapper" style="margin-top: 1rem;">

            <!-- Page content-->
            <div class="container-fluid">
               <div class="row" style="width: 1300px; height: 16rem; margin-bottom: 2rem;">
                  <div class="col-md-2">
                     <img src="images/person_1.jpg" class="img-fluid" alt="프로필 사진" style="width:100%; margin-bottom:1rem !important;">
                     <div class="btn btn-secondary my-2 my-sm-0"  style="width:100%">변경</div>
                     <div class="col-md-2border" style="margin: 0;"><i class="bi bi-thermometer-high"></i>36.5˚C</div>
                 </div>
                  <div class="col-md-6">
                     <div class="border">
                        <div style="height: 16rem;">
                           <div class="blog-entry d-flex blog-entry-search-item">
                              <!-- <a href="single.html" class="img-link me-4">
                                 <img src="images/img_1_sq.jpg" alt="Image" class="img-fluid" style="10rem !important">
                              </a> -->
                              <div>
	                              <span class="date"> 오늘의 봉사 </span>
	                              <span class="date float-end" id="mypageDate" ></span>
	                              <h2><a href="single.html">봉사 리스트 얻을 자리</a></h2>
                              </div>
                           </div>
                        </div>
                     </div>.
                  </div>
                  <div class="col-md-3 border d-flex align-items-center">
                     <p class="text-md-start">
						개인 봉사온도
                     </p>
                  </div>
               </div>

                  <div class="row" style="width:1300px; margin-bottom: 2rem;" >
                     <div class="col-md-11" >
                     <ul class="nav nav-pills nav-fill">
                        <li class="nav-item">
                          <a class="nav-link active" data-toggle="tab" href="#mapTab">지도</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" data-toggle="tab" href="#calendarTab">내 일정</a>
                        </li>
                      </ul>
                      <div class="tab-content">
                        <div class="tab-pane fade show active" id="mapTab">
                           <div class="border">
                              <div>

                              </div>               
                              <div class="row" style="" >
                                 <div class="col-md-8">
                                    <div id="map" style="width:100%;height:25rem;"></div>
                                 </div>
                              
                                 <div class="col-md-4" >
                                    <div class="card" style="width: 100%; height: 8rem; margin-bottom: 1rem !important;">
                                       <div class="card-body">
                                          <h5 class="card-title"><i class="bi bi-clock"></i> IN</h5>
                                          <p class="card-text" style="text-align:right">날짜 및 시간</p>
                                          <p class="card-text" id="arrival" style="text-align:right"></p>
                                       </div>
                                    </div>
            
                                    <div class="card" style="width: 100%; height: 8rem; margin-bottom: 1rem !important;">
                                       <div class="card-body">
                                          <h5 class="card-title"><i class="bi bi-clock"></i> OUT</h5>
                                          <p class="card-text" style="text-align:right">날짜 및 시간</p>
                                          <p class="card-text" id="departure" style="text-align:right"></p>
                                       </div>
                                    </div>
            
                                    <div class="btn btn-secondary my-2 my-sm-0" id="btnTimeRecord" style="width:100%; height: 7rem;">
                                       <p> 시간 기록 버튼 : <div id="currentTime"> </div> </p>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="tab-pane fade" id="calendarTab">
                           <div class="card" style="width: 100%;">
                              <div class="card-body">
                                 <h5 class="card-title">내 일정</h5>
                                 <div id='calendar'></div>
   
                              </div>
                           </div>
                        </div>
                      </div>
                     </div>
                  </div>

                  <div class="row" style="width:100%; margin-bottom: 2rem;" >
                     <div class="col-md-9">
                        


                     </div>

                  </div>

            </div>

      </div>
   </div>





<!-- 	마이 페이지 날짜 획득용JS -->
	<script>
	function getKoreanDate() {
	   const now = new Date();
	   const options = {
	       timeZone: 'Asia/Seoul',
	       year: 'numeric',
	       month: '2-digit',
	       day: '2-digit'
	   };
	   const koreanDate = now.toLocaleString('ko-KR', options);
	   return koreanDate;
	}
	
	document.getElementById('mypageDate').textContent = getKoreanDate();
	</script>


 
      <!-- 거리계산용 JS -->
      <script src='https://unpkg.com/@turf/turf@6.3.0/turf.min.js'></script>
      <script src='/js/map/distance.js'></script>
<!-- 	  <script src="js/common/distance.js"></script> -->
      <!-- kakaoMap SDK -->
      <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=08d20e40da94696ee7b9ff3a47add144"></script>
      <script>

      // distance.js import 성공하면 삭제할 코드
      function calculateDistance(coord1, coord2) {
    	  const point1 = turf.point(coord1);
    	  const point2 = turf.point(coord2);

    	  const options = { units: 'meters' };
    	  const distance = turf.distance(point1, point2, options);

    	  return distance;
    	}
      
      
      
	  // 봉사활동 센터 위치 얻기 위한 함수
      function getInfo() {
         // 지도의 현재 중심좌표를 얻어옵니다 
         var center = map.getCenter(); 
         
         // 지도의 현재 레벨을 얻어옵니다
         var level = map.getLevel();
         
         // 지도타입을 얻어옵니다
         var mapTypeId = map.getMapTypeId(); 
         
         // 지도의 현재 영역을 얻어옵니다 
         var bounds = map.getBounds();
         
         // 영역의 남서쪽 좌표를 얻어옵니다 
         var swLatLng = bounds.getSouthWest(); 
         
         // 영역의 북동쪽 좌표를 얻어옵니다 
         var neLatLng = bounds.getNorthEast(); 
         
         // 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
         var boundsStr = bounds.toString();
         
         
         var message = '봉사활동 위치 좌표는 위도 ' + center.getLat() + ', <br>';
         message += '경도 ' + center.getLng() + '이고 <br>';
         // message += '지도 레벨은 ' + level + ' 입니다 <br> <br>';
         // message += '지도 타입은 ' + mapTypeId + ' 이고 <br> ';
         // message += '지도의 남서쪽 좌표는 ' + swLatLng.getLat() + ', ' + swLatLng.getLng() + ' 이고 <br>';
         // message += '북동쪽 좌표는 ' + neLatLng.getLat() + ', ' + neLatLng.getLng() + ' 입니다';         
         // 개발자도구를 통해 직접 message 내용을 확인해 보세요.
         // ex) console.log(message);
         console.log(message);
       
       return {
         center : {lat : center.getLat(), lng : center.getLng()},
         bounds : bounds
       }
      }
     
      ////////////// 지도 표시 api //////////////
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
                  center: new kakao.maps.LatLng(37.29297, 127.0486), // 지도의 중심좌표 광교 좌표
//                  center: new kakao.maps.LatLng(37.61625, 127.0656), // 지도의 중심좌표 동적으로 변환해야 함
//                  center: new kakao.maps.LatLng(37.61625, 127.0656), // 지도의 중심좌표 석계 좌표

                  level: 4 // 지도의 확대 레벨
            };
      // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
      var map = new kakao.maps.Map(mapContainer, mapOption); 


      ////////////// 지도 확대 툴바 api //////////////
      // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
      var mapTypeControl = new kakao.maps.MapTypeControl();

      // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
      // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
      map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

      // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
      var zoomControl = new kakao.maps.ZoomControl();
      map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);





      ////////////// 지도 클릭 시 마커 및 좌표 획득 api //////////////
      // 지도 중심좌표에 마커를 생성합니다
      var marker2 = new kakao.maps.Marker({ 
            // 지도 중심좌표에 마커를 생성합니다 
            position: map.getCenter()
      }); 
      // 지도에 마커를 표시합니다
      marker2.setMap(map);
 



      // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
      if (navigator.geolocation) {
         
         // GeoLocation을 이용해서 접속 위치를 얻어옵니다
         var coord1 = navigator.geolocation.getCurrentPosition(function(position) {
            
            var userlat = position.coords.latitude; // 위도
            var userlon = position.coords.longitude; // 경도

          console.log("사용자 위치[위도] " + userlat);
          console.log("사용자 위치[경도] -> " + userlon);

         const gpsInfo =  getInfo();
         
//            console.log("gpsInfo -> " + gpsInfo);
//            console.log("gpsInfo.center -> " + gpsInfo.center);
//            console.log("gpsInfo.center.lat -> " + gpsInfo.center.lat);
//            console.log("gpsInfo.center.lng -> " + gpsInfo.center.lng);
          
         // 이부분에서 거리 계산하면 됨 

         const coord1 = [userlon, userlat];
         const coord2 = [gpsInfo.center.lng, gpsInfo.center.lat];
         
/*          console.log("coord1의 값을 보자 "+coord1); */


      //////////////////////turf.js를 사용했을 때의 코드
        // 두 지점 간의 거리를 계산합니다.
      //   const options = { units: 'meters' }; // 거리의 단위를 미터로 설정합니다.
      //   const distance = turf.distance(coord11, coord2, options);
        

      ///////////////////////////////////turf.js 관련 내용을 함수화해 만든 distance.js를 사용했을 때의 코드
        const distance = calculateDistance(coord1, coord2);

        console.log('두 지점 사이의 거리는 약 '+ distance +'미터입니다.');

        // 거리에 따라 버튼 눌렀을 때 버튼 활성화/비활성화
//        if (distance <= 100) { // 의도대로 짠 거리 로직
        if (distance <= 1000) { // GPS 오차가 너무 심함; 모바일에서도 해봐야 할 듯
           document.getElementById('btnTimeRecord').classList.add('btn-secondary');
           document.getElementById('btnTimeRecord').classList.remove('btn-primary');
           } else {
           document.getElementById('btnTimeRecord').classList.remove('btn-secondary');
           document.getElementById('btnTimeRecord').classList.add('btn-primary');

           }
        
        // 버튼 활성화 돼있을 때 시간 값 넣기
		document.getElementById('btnTimeRecord').addEventListener('click', async function() {
		    if (this.classList.contains('btn-secondary')) {
		        if (document.getElementById('arrival').textContent.trim() === '') {
		            document.getElementById('arrival').textContent = await getKoreanStandardTime();
		        } else {
		            if (document.getElementById('departure').textContent.trim() === '') {
		                document.getElementById('departure').textContent = await getKoreanStandardTime();
		            }
		        }
		    }
		});
		
		async function getKoreanStandardTime() {
		    const now = new Date();
		    const koreanDate = now.toLocaleString('ko-KR', { timeZone: 'Asia/Seoul' });
		    return koreanDate;
		}
        
      
//             console.log("if문 안에 함수 안에 userlon"+userlon);
            var locPosition = new kakao.maps.LatLng(userlat, userlon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                  message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
            
            // 마커와 인포윈도우를 표시합니다
            displayMarker(locPosition, message);

/*
			console.log("현재 접속 위도입니다. userlat : "+userlat);
            console.log("현재 접속 경도입니다. userlon : "+userlon);
 */            

            });

         
      } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
         
         var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
            message = 'geolocation을 사용할수 없어요..'
            
         displayMarker(locPosition, message);
      }



      // 지도에 마커와 인포윈도우를 표시하는 함수입니다
      function displayMarker(locPosition, message) {

         // 마커를 생성합니다
         var marker = new kakao.maps.Marker({  
            map: map, 
            position: locPosition
         }); 
         
         var iwContent = message, // 인포윈도우에 표시할 내용
            iwRemoveable = true;

         // 인포윈도우를 생성합니다
         var infowindow = new kakao.maps.InfoWindow({
            content : iwContent,
            removable : iwRemoveable
         });
         
         // 인포윈도우를 마커위에 표시합니다 
         infowindow.open(map, marker);
         
         // 지도 중심좌표를 접속위치로 변경합니다
         map.setCenter(locPosition);      
      }  


      </script>

      
    <!-- jQuery, Popper.js, Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>

    <!-- FullCalendar JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js" crossorigin="anonymous"></script>

      <!-- FullCalendar JS -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" crossorigin="anonymous"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js" crossorigin="anonymous"></script>
      <script>
         // 여기에 JavaScript 코드를 작성하세요.
 
         // 변수 선언
         var calendar;
         var event;
 
         // FullCalendar 초기화
         $(document).ready(function () {
             calendar = $('#calendar').fullCalendar({
                 // FullCalendar 옵션 설정
                 header: {
                     left: 'prev,next today',
                     center: 'title',
                     right: 'month,agendaWeek,agendaDay'
                 },
                 navLinks: true,
                 selectable: true,
                 selectHelper: true,
                 editable: true,
                 eventLimit: true,
                 contentHeight: 410,
                 
 
                 // 이벤트 클릭 이벤트 처리
                 eventClick: function (calEvent, jsEvent, view) {
                     event = calEvent;
                     $('#inputTitle').val(calEvent.title);
                     $('#eventModalLabel').text('Edit Event');
                     $('#eventModal').modal('show');
                 },
 
                 // 날짜 클릭 이벤트 처리
                 dayClick: function (date, jsEvent, view) {
                     event = null;
                     $('#inputTitle').val('');
                     $('#eventModalLabel').text('New Event');
                     $('#eventModal').modal('show');
                 },
             });
         });
 
         // 이벤트 생성 및 수정 함수 추가
         function saveEvent() {
             var title = $('#inputTitle').val();
 
             if (title) {
                 var eventData = {
                     title: title,
                     start: event ? event.start : $('#calendar').fullCalendar('getDate'),
                     end: event ? event.end : null,
                 };
 
                 if (event) {
                     // 이벤트 수정
                     event.title = title;
                     $('#calendar').fullCalendar('updateEvent', event);
                 } else {
                     // 이벤트 생성
                     $('#calendar').fullCalendar('renderEvent', eventData, true);
                 }
                 $('#eventModal').modal('hide');
             } else {
                 alert('Title is required');
             }
         }
     </script>


      <script>
     </script>


      <!-- 탭 만들기 부트스트랩 링크 -->
      <!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
      <!-- 마이 페이지 날짜 기록 함수 호출용 JS -->
      <script>
         document.getElementById("currentTime").innerHTML = Date();
      </script>
      
<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>   

