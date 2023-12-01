<!-- 별이 검색부 / 23-11-30 21:07에 recruit_list.jsp 보면 있음 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<form action="/recruit/list" >
						<div class="form-css" style="width:100%; background-color: #f8f8f8; border-radius: 5px;">
	
							<!-- 봉사 지역 -->
						<div style="width:100%;">
						<div class="form-region" style="margin-right:1%;">
							<label for="form-select">봉사지역 </label>
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
