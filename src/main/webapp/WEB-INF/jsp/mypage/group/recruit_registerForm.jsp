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
      
      <!-- Page content wrapper-->
      <div>

         <div class="section search-result-wrap">
            <div class="container" style="margin-left : 10%;">
               <br>
               <br>
               <div class="search_section">
                  <form action="/recruit/register" method="post">
                     <div class="form-css">
                        <br>
      
                     <div class="inner3">
                     <div class="inner4">
                        <div>
                           <div class="inner-detail-wrap">
                              <div class="inner-detail">
                                 <div>
                                    <br>
      
                                    <!-- 글번호 히든처리 -->
                                    
      
                                    <table class="table-register">
                                       <tr>
                                          <th><span style="color:rgb(255, 97, 97);">·  </span>봉사기간</th>
                                          <td><span><input type="date"  class="form-keyword" id="volun_start_date" name="volunStartDate"></span>~<span><input type="date"  class="form-keyword" id="volun_end_date" name="volunEndDate"></span></td>
                                          <th><span style="color:rgb(255, 97, 97);">·  </span>봉사분야</th>
                                          <td>
                                             <select class="form-select" id="volun_code" name="volunCode" title="활동분야 선택">
                                                <option value="">선택</option>
                                                <option value="0010">시설봉사</option>
                                                <option value="0020">재가봉사</option>
                                                <option value="0030">전문봉사</option>
                                                <option value="0040">지역사회봉사</option>
                                                <option value="0050">금,물품봉사</option>
                                                <option value="0060">해외봉사</option>
                                                <option value="0070">헌혈</option>
                                                <option value="0080">기타봉사</option>
                                             </select>
                                          </td>
                                       </tr>
                                       <tr>
                                          <!-- 봉사단체는 로그인한 닉네임 바로가져올거임 -->
                                          <th><span style="color:rgb(255, 97, 97);">·  </span>봉사단체</th>
                                          <td><input type="text" class="form-keyword" id="group_name" name="groupName"></td>
                                          <th><span style="color:rgb(255, 97, 97);">·  </span>봉사시간</th>
                                          <td><span><input type="number" id=volun_time  name="volunTime"></span></td>
                                       </tr>
      
                                          <!-- 봉사지역 -->
                                       <tr>
                                          <th><span style="color:rgb(255, 97, 97);">·  </span>봉사지역</th>
                                          <td>
                                           	<div class="search_boxes">
												<div class="search_box">
													<select class="form-select" id="volun_region1" name="volunRegion1" onchange="categoryChange(this)">
														<option value>시/도 선택</option>
														<option value="general01">강원</option>
														<option value="general02">경기</option>
														<option value="general03">경남</option>
														<option value="general04">경북</option>
														<option value="general05">광주</option>
														<option value="general06">대구</option>
														<option value="general07">대전</option>
														<option value="general08">부산</option>
														<option value="general09">서울</option>
														<option value="general10">울산</option>
														<option value="general11">인천</option>
														<option value="general12">전남</option>
														<option value="general13">전북</option>
														<option value="general14">제주</option>
														<option value="general15">충남</option>
														<option value="general16">충북</option>
													</select>
													<select class="form-select" id="volun_region2" name="volunRegion2">
														<option>군/구 선택</option>
													</select>
												</div>
											 </div>
                                          </td>
                                          <!-- 카카오지도로 출력 -->
                                          <th><span style="color:rgb(255, 97, 97);">·  </span>봉사장소</th>
<!--                                           <input type="text" id="sample5_address" placeholder="주소">
										  <input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br> -->
                                          <td>
                                          	  <input type="text" class="form-keyword" id="volun_addr" name="volunAddr" placeholder="주소">
                                          	  <input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색">
                                          	  <div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
                                          	  <input type="hidden" id="latitude" name="latitude">
											  <input type="hidden" id="longitude" name="longitude">
                                          </td>
                                       </tr>
      
      								
                                       <tr>
                                          <!-- 봉사대상 -> 직접작성? -->
                                          <th><span style="color:rgb(255, 97, 97);">·  </span>봉사대상</th>
                                          <td><input type="text" class="form-keyword" id="volun_target"  name="volunTarget"></td>
                                          <th><span style="color:rgb(255, 97, 97);">·  </span>모집인원</th>
                                          <td><input type="number"  class="form-keyword" id="mem_count"  name="memCount"></td>
                                       </tr>
      
      									
                                       <tr>
                                          <!-- 모집기간  -->
                                          <th><span style="color:rgb(255, 97, 97);">·  </span>모집기간</th>
                                          <td><span><input type="date" class="form-keyword" id="recruit_start_date" name="recruitStartDate"></span>~<span><input type="date" class="form-keyword" id="recruit_end_date" name="recruitEndDate"></span></td>
                                          <th><span style="color:rgb(255, 97, 97);">·  </span>담당자</th>
                                          <td><input type="text" class="form-keyword" id="manager" name="manager"></td>
                                       </tr>
      
                                       <tr>
                                          <!-- 담당자 안내  -->
                                          <th><span style="color:rgb(255, 97, 97);">·  </span>연락처</th>
                                          <td><input type="text" class="form-keyword" id="phone" name="phone"></td>
                                          <th><span style="color:rgb(255, 97, 97);">·  </span>이메일</th>
                                          <td><input type="text" class="form-keyword" id="email" name="email"></td>
                                       </tr>
                                       
                                       <tr>
                                          <!-- 모집상태  -->
                                          <th><span style="color:rgb(255, 97, 97);">·  </span>모집상태</th>
                                          <td><input type="text" class="form-keyword" id="recruit_state" name="recruitState" value="모집중"></td>
                                          <th><span style="color:rgb(255, 97, 97);">·  </span></th>
                                          <td><input type="hidden" class="form-keyword" id="group_mem_seq" name="groupMemSeq" value="1"></td>
                                       </tr>
                  
                                    </table>
      
                                    <br>
                                    <br>
      
                                    <div>
                                       <input type="text" name="recruitTitle" id="recruit_title" class="form-keyword" placeholder="제목" style="width: 100%; height: 40px;">
                                       <!-- 상세 내용 -->
                                       <br>
                                       <br>
                                       <div class="contents-frame">
                                          <textarea name="recruitContent" id="recruit_content" placeholder="내용" style="border-radius: 4px;"></textarea>
                                       </div>
                                    </div>
                                    <br>
                                    <br>
                                    <!-- 신청하기 버튼 -->
                                    <div class="btn-frame">
                                       <button class="btn" onclick="registerBtn()" type="submit">등록</button>
                                       <button class="btn">취소</button>
                                    </div>
      
                                 </div>
                              </div>
               
                           </div>
               
                        </div>
                     </div>
                     </div>
                  </div>
                  </form>
               </div>
            </div>
         </div>

            
				
      </div>
   </div>
				
<script>


  /* 위지윅 적용 */
        ClassicEditor
              .create(document.querySelector('#recruitContent'))
              .catch(error=>{
                    console.error(error);
              });

</script> 
<script>
  function registerBtn() {
	  alert("등록되었습니다.");
	  
  }
  
</script>
<script>
  function categoryChange(e) {
	  const volun_region2 = document.getElementById("volun_region2");
	
	  const gangwon = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	  const gyeonggi = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	  const gyeongsangnam = ["거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군"];
	  const gyeongsangbuk = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	  const gwangju = ["광산구", "남구", "동구", "북구", "서구"];
	  const daegu = ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"];
	  const daejeon = ["대덕구", "동구", "서구", "유성구", "중구"];
	  const busan = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	  const seoul = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	  const ulsan = ["남구","동구","북구","중구","울주군"];
	  const incheon = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	  const jeonnam = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	  const jeonbuk = ["군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군"];
	  const jeju = ["서귀포시","제주시","남제주군","북제주군"];
	  const chungbuk = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	  
	
	  if (e.value == "general01") {
	    add = gangwon;
	  } else if (e.value == "general02") {
	    add = gyeonggi;
	  } else if (e.value == "general03") {
	    add = gyeongsangnam;
	  } else if (e.value == "general04") {
	    add = gyeongsangbuk;
	  } else if (e.value == "general05") {
	    add = gwangju;
	  } else if (e.value == "general06") {
	    add = daegu;
	  } else if (e.value == "general07") {
	    add = daejeon;
	  } else if (e.value == "general08") {
	    add = busan;
	  } else if (e.value == "general09") {
	    add = seoul;
	  } else if (e.value == "general10") {
	    add = ulsan;
	  } else if (e.value == "general11") {
	    add = incheon;
	  } else if (e.value == "general12") {
	    add = jeonnam;
	  } else if (e.value == "general13") {
	    add = jeonbuk;
	  } else if (e.value == "general14") {
	    add = jeju;
	  } else if (e.value == "general15") {
	    add = chungnam;
	  } else if (e.value == "general16") {
	    add = chungbuk;
	  }
	
	  volun_region2.options.length = 1;
	  // 군/구 갯수;
	
		for (property in add) {
			let opt = document.createElement("option");
			opt.value = add[property];
			opt.innerHTML = add[property];
			volun_region2.appendChild(opt);
		}
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

<!-- 카카오 주소&맵 받아오기 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=259b6e4c0775108f360aa1e89a7a9d32&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


 // JavaScript 코드 내에서 위도와 경도를 설정
    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("volun_addr").value = addr;
                
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                        var result = results[0]; // 첫 번째 결과값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 위도와 경도 정보를 hidden 필드에 설정
                        document.getElementById("latitude").value = result.y;
                        document.getElementById("longitude").value = result.x;
                        
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords);
                    }
                });
            }
        }).open();
    }

</script>

  <!-- 함수 호출용 JS -->
  <script>
     document.getElementById("currentTime").innerHTML = Date();
  </script>    
  
<!--   <script>
	  // 사용자가 입력한 시간을 변경할 때마다 시간 차이 계산
	  $('#start_time, #end_time').on('input', function() {
	      var start = new Date($('#start_time').val());
	      var end = new Date($('#end_time').val());
	
	      var diffTime = (end.getTime() - start.getTime()) / (1000 * 60 * 60);
	
	      $("input[name='diff_time']").val(diffTime);
	  });
  </script> -->

<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>

