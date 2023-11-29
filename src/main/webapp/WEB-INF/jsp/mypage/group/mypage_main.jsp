<%@ include file="/WEB-INF/jsp/include/top.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/page/group.css" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

   <div class="d-flex" id="wrapper">
      <!-- Sidebar-->
      
      <div class="col-md-2 col-lg-3 col-xl-2 border-end bg-white" id="sidebar-wrapper" style="
       margin-bottom: 50px;
       border-bottom: 1px solid #dee2e6;">
       
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
      
		<div style="width:80%;">
<!-- 			<div style="display: flex; justify-content: center;">
				<div style="width:75%;"> -->
				<br>
					<input type="hidden" id="GROUP_MEM_SEQ" name="groupMemSeq" value="${principal.user.memSeq}">
					<div class="inner1">
						<div class="inner2">
							<div class="row posts-entry">
								<div class="sss">
									<div style="width:100%">
									<br>
      								<div>
      									<h6 style="text-align: center;"><img src="/images/profile.png" class="mb-2"></h6>
      								</div>
      								<br>
									<h2 style="text-align: center; color:black; font-weight:bold;">${principal.user.loginName}</h2>
									<br>
									<div style="margin-bottom:100px;">
										<table style="margin-top : 30px; margin-bottom : 50px;">
								              <tr style="border-top: 1px solid #ddd;">
										          <th style="background-color:white;">봉사번호</th>
										          <td >${principal.user.memSeq} 번</td>
										          <th style="background-color:white;" >봉사단체</th>
										          <td >${principal.user.loginName}</td>
										      </tr>
										      <tr style="border-top: 1px solid #ddd;">
										        <th style="background-color:white;">단체결성일</th>
										        <td>2023-11-02</td>
										        <th style="background-color:white;">단체회원수</th>
										        <td>25 명</td>
										      </tr>
										  </table>
									</div>
									<div>
	      								<table style="font-size:13px; margin-bottom:50px;">
										      <tr>
										          <th class="rounded-cell" style="font-size:16px; width:315px;" >체크리스트</th>
										      </tr>
		                        
						                        <tbody id="approveList">
							                        <%-- <c:forEach var="approve" items="${approve}"> --%>
								                        	<tr id="approveDetail">
									                            <td style="border-top: 1px solid #ddd; border-bottom: 1px solid #ddd;  border-radius: 5px; height:150px; font-size:16px; font-weight:bold;">
									                            	<span>신청중</span><br>
									                            	<span style="color:red;">${count}</span> 건
									                            </td>
									                            <td style="border-top: 1px solid #ddd; border-bottom: 1px solid #ddd;  border-radius: 5px; height:150px; font-size:16px; font-weight:bold;">
									                            	<span>채팅방 생성</span><br>
									                            	<span style="color:red;">2</span> 건
									                            </td>
									                            <td style="border-top: 1px solid #ddd; border-bottom: 1px solid #ddd;  border-radius: 5px; height:150px; font-size:16px; font-weight:bold;">
									                            	<span>작성된 후기</span><br>
									                            	<span style="color:red;">${review}</span> 건
									                            </td>                                        
									                        </tr>
							                        <%-- </c:forEach> --%>
						                        </tbody>
						                     
						                  </table>
      								</div>
									<br>
									<br>	
					                    <%-- <table style="font-size:13px; margin-bottom:50px;">
						                    <tbody id="registerList">
											      <tr>
											          <th class="rounded-cell" style="font-size:16px; width:315px;" >작성 글 목록</th>
											          <th style="background-color:white;"></th>
											          <th style="background-color:white; float:right; font-size:16px; border:none;"><a href="/manager/registerList?groupSeq=${principal.user.memSeq}">+ 더보기</a></th>
											      </tr>
							                      <tr>
														<c:forEach var="list" items="${list}">
																<td style="margin-bottom:5px; font-size:16px; font-weight:bold;"><a href="/recruit/detail?recruitSeq=${list.recruitSeq}">${list.recruitTitle}</a></td>
														</c:forEach>
												  </tr>
							                 </tbody>
						                 </table> --%>
					                <br>
					                
				                	</div>
									</div>

								</div>
							</div>
						</div>
		
		
					</div>
	</div>
 


<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/tiny-slider.js"></script>

<script src="js/flatpickr.min.js"></script>


<script src="js/aos.js"></script>
<script src="js/glightbox.min.js"></script>
<script src="js/navbar.js"></script>
<script src="js/counter.js"></script>
<script src="js/custom.js"></script>







<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>
