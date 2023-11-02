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
                                 <span class="date">Apr. 14th, 2022</span>
                                 <h2><a href="single.html">Thought you loved Python? Wait until you meet Rust</a></h2>
                                 <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Unde, nobis ea quis inventore vel voluptas.</p>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-3 border d-flex align-items-center">
                     <p class="text-md-start">
                        혜화동불주먹해적단 님은 이웃과 총 45회/172시간 30분 함께 했습니다.
                     </br>이미지나 아이콘 등으로 꾸밈말 추가
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
                              <div class="row" style="width:100%; margin-bottom: 2rem;" >
                                 <div class="col-md-8">
                                    <div id="map" style="width:100%;height:25rem;"></div>
                                 </div>
                              
                                 <div class="col-md-4" >
                                    <div class="card" style="width: 100%; height: 8rem; margin-bottom: 1rem !important;">
                                       <div class="card-body">
                                          <h5 class="card-title"><i class="bi bi-clock"></i> IN</h5>
                                          <p class="card-text" style="text-align:right">날짜 및 시간</p>
                                       </div>
                                    </div>
            
                                    <div class="card" style="width: 100%; height: 8rem; margin-bottom: 1rem !important;">
                                       <div class="card-body">
                                          <h5 class="card-title"><i class="bi bi-clock"></i> OUT</h5>
                                          <p class="card-text" style="text-align:right">날짜 및 시간</p>
                                       </div>
                                    </div>
            
                                    <div class="btn btn-secondary my-2 my-sm-0" style="width:100%; height: 7rem;">
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








 
      <!-- kakaoMap SDK -->
      <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=08d20e40da94696ee7b9ff3a47add144"></script>
      <script>
      ////////////// 지도 표시 api //////////////
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
                  center: new kakao.maps.LatLng(37.583719781699365, 126.99995471354192), // 지도의 중심좌표
                  level: 2 // 지도의 확대 레벨
            };

      // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
      var map = new kakao.maps.Map(mapContainer, mapOption); 


      ////////////// 지도 이동 api //////////////
      function setCenter() {            
            // 이동할 위도 경도 위치를 생성합니다 
            var moveLatLon = new kakao.maps.LatLng(33.452613, 126.570888);
            
            // 지도 중심을 이동 시킵니다
            map.setCenter(moveLatLon);
      }

      function panTo() {
            // 이동할 위도 경도 위치를 생성합니다 
            var moveLatLon = new kakao.maps.LatLng(33.450580, 126.574942);
            
            // 지도 중심을 부드럽게 이동시킵니다
            // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
            map.panTo(moveLatLon);            
      } 

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
      // 지도를 클릭한 위치에 표출할 마커입니다
      var marker = new kakao.maps.Marker({ 
            // 지도 중심좌표에 마커를 생성합니다 
            position: map.getCenter() 
      }); 
      // 지도에 마커를 표시합니다
      marker.setMap(map);

      // 지도에 클릭 이벤트를 등록합니다
      // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
      kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
            
            // 클릭한 위도, 경도 정보를 가져옵니다 
            var latlng = mouseEvent.latLng; 
            
            // 마커 위치를 클릭한 위치로 옮깁니다
            marker.setPosition(latlng);
            
            var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
            message += '경도는 ' + latlng.getLng() + ' 입니다';
            
            var resultDiv = document.getElementById('clickLatlng'); 
            // resultDiv.innerHTML = message;
            
            
      });
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

      <!-- 탭 만들기 부트스트랩 링크 -->
      <!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

      <!-- 함수 호출용 JS -->
      <script>
         document.getElementById("currentTime").innerHTML = Date();
      </script>
<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>   

  </body>
</html>