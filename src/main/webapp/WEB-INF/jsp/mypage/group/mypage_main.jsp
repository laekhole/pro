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
									<h2 style="text-align: center; color:black; ">${principal.user.loginName}</h2>
									<br>
									<div>
	      								<table style="font-size:13px; margin-bottom:50px;">
										      <tr>
										          <th class="rounded-cell" style="font-size:16px;">신청중</th>
										          <th class="rounded-cell" style="font-size:16px;">봉사활동 등록건수</th>
										          <th class="rounded-cell" style="font-size:16px;">오늘의 봉사활동</th>
										      </tr>
		                        
						                        <tbody id="approveList">
							                        <%-- <c:forEach var="approve" items="${approve}"> --%>
								                        	<tr id="approveDetail">
									                            <td style="border-bottom: 1px solid #ddd;  border-radius: 5px;">3 건</td>
									                            <td style="border-bottom: 1px solid #ddd;  border-radius: 5px;">3 건</td>
									                            <td style="border-bottom: 1px solid #ddd;  border-radius: 5px;">3 건</td>                                        
									                        </tr>
							                        <%-- </c:forEach> --%>
						                        </tbody>
						                     
						                    </table>
      									</div>
									<br>
									<br>	
					                    <table style="font-size:13px; margin-bottom:50px;">
									      <tr>
									          <th class="rounded-cell" style="font-size:16px;">봉사활동 등록건수</th>
									          <th class="rounded-cell" style="font-size:16px;">오늘의 봉사활동</th>
									      </tr>
	                        
					                        <tbody id="approveList">
						                        <%-- <c:forEach var="approve" items="${approve}"> --%>
							                        	<tr id="approveDetail">
								                            <td style="border-bottom: 1px solid #ddd;  border-radius: 5px;">3 건</td>
								                            <td style="border-bottom: 1px solid #ddd;  border-radius: 5px;">3 건</td>                                   
								                        </tr>
						                        <%-- </c:forEach> --%>
					                        </tbody>
					                     
					                    </table>
					                <br>
					                <hr>
					                <table style="font-size:13px; margin-bottom:50px;">
									      <tr>
									          <th class="rounded-cell" style="font-size:16px;">미확인 쪽지</th>
									          <th class="rounded-cell" style="font-size:16px;">미확인 후기</th>
									          <th class="rounded-cell" style="font-size:16px;">미확인 승인</th>
									      </tr>
	                        
					                        <tbody id="approveList">
						                        <%-- <c:forEach var="approve" items="${approve}"> --%>
							                        	<tr id="approveDetail">
								                            <td style="border-bottom: 1px solid #ddd;  border-radius: 5px;">3 건</td>
								                            <td style="border-bottom: 1px solid #ddd;  border-radius: 5px;">3 건</td>
								                            <td style="border-bottom: 1px solid #ddd;  border-radius: 5px;">3 건</td>                                      
								                        </tr>
						                        <%-- </c:forEach> --%>
					                        </tbody>
					                     
					                    </table>
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
