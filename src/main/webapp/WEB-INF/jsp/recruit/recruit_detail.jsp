<%@ include file="/WEB-INF/jsp/include/top.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/page/group.css" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


	<div class="section search-result-wrap">
		<div class="container">
			<br>
			<br>
			<div class="detail_section">
			<div class="form-css">
			<br>

			<div class="inner3">
				<div class="inner4">
					<div>
						<div>
							<div class="inner-detail-wrap">
								<div class="inner5-detail">
									<span class="date">
										<ul class="tags">
											<li><a href="#" style="padding: 10px 20px;" >${recruit.recruitState}</a></li>
											<li><a href="#" style="padding: 10px 20px;" >${recruit.volunRegion1}</a></li>
											<li><a href="#" style="padding: 10px 20px;">D-5</a></li>
											<span class="btn-frame" style="flex: 1;">
												<button class="btn">신청하기</button>
											</span>
										</ul>
									</span>
									<div class="detail-list">
										<div>
											<h3 style="font-weight: bold; margin: 20px 0px;">
												<span style="flex: 1;">${recruit.recruitTitle}</span>
											</h3>
											<ul class="detail-ul">
												<li>${recruit.groupName}</li>
												<li>작성일 : ${recruit.regDate}</li>
												<li>조회수 : ${recruit.viewCount}</li>
												<!-- 수정해야함!! 컬럼추가!! -->
												<li>추천수 : ${recruit.viewCount}</li>
											</ul>
										</div>
									</div>
										<!-- <ul class="review-ul">
											<li>혜화불주먹해적단</li>
											<li>작성일 : 2023-10-26</li>
											<li>조회수 : 3921</li>
											<li>추천수 : 591</li>
										</ul> -->
										<br>
			
									<table class="table-review" style="margin-top: 50px;">
										<tr>
											<th>봉사기간</th>
											<td><span>${recruit.volunStartDate}</span> ~ <span>${recruit.volunEndDate}</span></td>
											<th>봉사분야</th>
											<td><span>${recruit.volunCode}</span></td>
										</tr>
										<tr>
											<th>봉사단체</th>
											<td>${recruit.groupName}</td>
											<th>봉사시간</th>
											<td><span>${recruit.volunTime}</span>시간</td>
										</tr>
										<tr>
											<th>봉사지역</th>
											<td>${recruit.volunRegion1} ${recruit.volunRegion2}</td>
											<th>봉사장소</th>
											<td>${recruit.volunAddr}</td>
										</tr>
										<tr>
											<th>봉사대상</th>
											<td>${recruit.volunTarget}</td>
											<th>뭐넣지</th>
											<td>데이터</td>
										</tr>
			
									</table>

									<!-- 상세 내용 -->
									<div class="contents" style="font-size:16px; color="black;">
										${recruit.recruitContent}
									</div>

									<!-- 지도 -->
									<div class="map">
										<div id="map" style="width:100%;height:350px;"></div>
									</div>


									<div style="padding-bottom: 20px;">
									<!-- 담당자 정보 -->
									<div class="personInfo">
										<ul>
											<li>담당자:<span>${recruit.manager}</span></li>
											<li>연락처:<span>${recruit.email}</span></li>
											<li>이메일:<span>${recruit.phone}</span></li>
										</ul>
									</div>

										<!-- 신청하기 버튼 -->
										<div style="margin-bottom:70px;">
											<div class="btn-frame" style="text-align: center;">
												<button class="btn">신청하기</button>
											</div>
										</div>
									</div>

									<hr>
									<div style="float:right;">
										<button style="padding: 10px 20px; background-color: #0c6ccb; color: white; border-radius: 4px; border: none; font-weight:bold;" >수정</button>
										<button style="padding: 10px 20px; background-color: #0c6ccb; color: white; border-radius: 4px; border: none; font-weight:bold;" id="listBrn" onclick="list()">목록</button>
									</div>

								</div>
							</div>
		
						</div>
		
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>

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
    	function list() {
    		location.href = "<c:url value='/recruit/list'/>"; 
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
    


<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>