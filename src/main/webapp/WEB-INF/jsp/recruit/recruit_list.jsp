<%@ include file="/WEB-INF/jsp/include/top.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/page/group.css" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


	<div class="search-result-wrap" style="margin-top:50px; margin-bottom:50px;">
		<div class="container">
			<div style="display: flex; justify-content: center;">
				<div style="width:75%;">
					<div class="recuit" >봉사자모집 및 신청</div>
					<br>
					<!-- 검색 구간 -->
					<div style="font-weight:bold;">※ [모집중] 이라도 VolunTree 외 다른 경로를 통해 자원봉사자가 모집되는 경우 참여가 어려울 수 있습니다.</div>
					<br>
				<div class="search_section">
					<form action="/recruit/list" >
						<div class="form-css" style="width:100%; background-color: #f8f8f8; border-radius: 5px;">
	
							<!-- 봉사 지역 -->
						<div style="width:100%;">
						<div class="form-region" style="margin-right:1%;">
							<label for="form-select" >봉사지역 </label>
								<select class="form-select" id="volun_region1" name="volunRegion1" style="width:170px;" onchange="categoryChange(this)" >
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
								<select class="form-select" id="volun_region2" name="volunRegion2" style="width:170px;">
									<option>군/구 선택</option>
								</select>
						</div>
	
							<!-- 봉사 기간 -->
						<div class="form-calendar">
							<label for="date-select">봉사기간 </label>
							<input type="date" class="form-keyword" name="sttdte" title="봉사기간 시작일"  style="width:195px;"><span class="dash"> ~ </span><input type="date" class="form-keyword" name="enddte" title="봉사기간 종료일"  style="width:195px;" >
						</div>
						</div>
						<br>
						<!-- 모집 현황 -->
						<div class="form-status" style="margin-right: 1.5%;">
							<label for="form-select">모집현황 </label>
							<select class="form-select" name="status">
								<option value="">선택</option>
								<option value="0115">모집중</option>
								<option value="0116">모집완료</option>
							</select>
						</div>
	
						<!-- 봉사 분야 -->
						<div class="form-acttype">
							<label for="form-select">봉사분야 </label>
							<select class="form-select" id="acttype" name="acttype" title="활동분야 선택">
								<option value="">선택</option>
								<option value="01">시설봉사</option>
								<option value="02">재가봉사</option>
								<option value="03">전문봉사</option>
								<option value="04">지역사회봉사</option>
								<option value="05">금,물품봉사</option>
								<option value="06">해외봉사</option>
								<option value="07">헌혈</option>
								<option value="99">기타봉사</option>
							</select>
						</div>

						<!-- 검색 조건 -->
						<div class="form-search" style="float:right;">
							<label for="form-select">검색조건 </label>
							<select class="form-select" id="acttype" name="acttype" title="활동분야 선택">
								<option value="">선택</option>
								<option value="recruitTitle">제목</option>
								<option value="groupName">작성자</option>
								<option value="recruitContent">내용</option>
							</select>
							<input class="form-keyword" name="searchWord" type="search" value="${search.searchWord }" >
							<button type="submit" id="search" style="font-size: 17px;width: 70px;height: 36px;background-color: #3ab41cb5;">검색</button>

						</div>
						
						<!-- 검색 출력  -->
	
					</div>
					</form>
				</div>	

				</div>
			</div>


			<div class="innerinner" style="width: 100%;margin: 0;padding: 0;display:flex;justify-content:center;">
			<div class="inner1" style="width: 100%;">
    
				<div class="inner2">
					<div class="row posts-entry">
						<div class="sss" style="margin-bottom:50px;">
						
							<c:forEach var="recruit" items="${list}">
							<div class="blog-entry d-flex blog-entry-search-item" style="margin-bottom:70px;">
								<div style="width:100%;">
									<div class="date" style="margin-bottom: 10px;">
										<!-- 모집 날짜 정보를 저장하는 hidden input -->

										<ul class="tags">
											<li style="font-size:18px;"><a href="#" id="recruitState" class="recruitLink" style="width: 100px; text-align: center; padding: 6px; font-weight:bold; ">${recruit.recruitState}</a></li>
											<li id="recruitList"><a href="#" style=" width: 100px; text-align: center; padding: 6px; font-weight:bold;">${recruit.volunRegion1}</a></li>
											
											<!-- 이거 디데이 자바스크립트로 설정하기 -->
											<!-- 여러 개의 리스트 아이템이 있을 때, 각각에 대한 클래스 추가 -->
											<li class="recruit-list-item">
											    <a href="#" style="background-color: #fbeb6c; width: 100px; text-align: center; padding: 6px; font-weight:bold;" >
											        <span class="dday-element"></span>
											    </a>
											    <input type="hidden" class="recruit-start-date" name="recruitStartDate" value="${recruit.recruitStartDate}">
											    <input type="hidden" class="recruit-end-date" name="recruitEndDate" value="${recruit.recruitEndDate}">
											</li>
												
																						
											
										</ul>
									</div>
									
<%-- 									<a href="/exam/get.do?boardNum=${board.boardNum}">${board.title}</a> --%>
									<p class="title"><a href="/recruit/detail?recruitSeq=${recruit.recruitSeq}" style="font-size:30px; ">${recruit.recruitTitle}</a></p>
									<div style="margin-top:10px;">
										<div class="data clear">
										<div style="width:100%;">
												<dl style="width:15%; font-size:15px;">
													<dt>신청/필요인원:</dt>
													<dd>
														<span>${recruit.count}</span>/<span>${recruit.memCount}</span>
													</dd>
												</dl>
												<dl style="width:25%; font-size:15px;">
													<dt>모집기간:</dt>
													<dd>
													
													  <span><fmt:formatDate value="${recruit.recruitStartDate}" pattern="yyyy-MM-dd" /></span>~
													  <span><fmt:formatDate value="${recruit.recruitEndDate}" pattern="yyyy-MM-dd" /></span>

													</dd>
												</dl>												
												<dl style="width:25%; font-size:15px;">
													<dt>봉사기간:</dt>
													<dd>
													
													  <span><fmt:formatDate value="${recruit.volunStartDate}" pattern="yyyy-MM-dd" /></span>~
													  <span><fmt:formatDate value="${recruit.volunEndDate}" pattern="yyyy-MM-dd" /></span>

													</dd>
												</dl>
												<dl style="width:25%; font-size:15px;" >
													<dt>모집기관:</dt>
													<dd>${recruit.groupName}</dd>
												</dl>
										</div>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>
							

						</div>
						
		
					</div>
				</div>
			</div>
		</div>
	
		
			<%@ include file="/WEB-INF/jsp/common/inc-paging.jsp"%>
		</div>
		
	</div>
<script>
    // 문서가 로드된 후 실행되는 함수
    document.addEventListener("DOMContentLoaded", function() {
        // 모든 클래스가 "recruitLink"인 요소들을 선택
        var recruitLinks = document.querySelectorAll('.recruitLink');

        // 각 링크에 대해 반복
        recruitLinks.forEach(function(link) {
            // 해당 요소의 텍스트 값이 "모집중"인 경우
            if (link.innerText.trim() === "모집중") {
                // 링크의 텍스트 색상을 변경하여 흰색으로 설정
                link.style.color = 'white';
                // 링크의 배경색을 변경하여 원하는 색상으로 설정
                link.style.backgroundColor = '#3ab41cb5';
            }
        });
    });
</script>


<script>
   
// calculateDday 함수 정의
function calculateDday(targetDate) {
    var target = new Date(targetDate);
    var today = new Date();
    var timeDiff = target - today;
    var daysDiff = Math.ceil(timeDiff / (1000 * 3600 * 24));

    if (daysDiff === 0) {
        return "금일마감";
    } else if (daysDiff > 0) {
        return "D-" + daysDiff;
    } else {
        return "D+" + Math.abs(daysDiff);
    }
}

// DOMContentLoaded 이벤트 리스너
document.addEventListener("DOMContentLoaded", function() {
    // 각 recruit-start-date 클래스에 대해 D-Day 계산 및 할당
    var dateElements = document.getElementsByClassName("recruit-end-date");

    for (var i = 0; i < dateElements.length; i++) {
        var targetDateString = dateElements[i].value;
        var targetDate = new Date(targetDateString.replace(/-/g, "/"));
        var dday = calculateDday(targetDate);

        // 해당하는 D-Day 값을 클래스가 dday-element인 요소에 할당
        document.getElementsByClassName("dday-element")[i].innerHTML = dday;
    }
});


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
<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>