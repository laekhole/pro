<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/jsp/include/top.jsp"%>

<section class="section">
   <div class="container">

     <div class="row blog-entries element-animate">

       <div class="col-md-12 col-lg-8 main-content">

         <div class="post-content-body">
           <div class="review-list">
             <h4 style="font-weight: bold; font-size:35px;">${info.reviewTitle }</h4>
           </div>

             <ul class="review-ul" style="color:black; font-weight:bold;">
               <li>작성일 : <span><fmt:formatDate value="${info.modDate }" pattern="yyyy-MM-dd" /></span></li>
               <li>조회수 : ${info.viewCount }</li>
               <!-- <li>
                 <div class="icon-love">
                   <i class="bi bi-hand-thumbs-up-fill recommend"></i>
                 </div>
                 591
               </li> -->
             </ul>
           <br>
           <br>
		   <div style="font-size:16px; color: black; margin-bottom:5px;"><span style="font-size:9px;">▶</span>  봉사 정보</div>
           <table class="table-review">
             <tr>
               <th>봉사기간</th>
               <td style="color:black; font-weight:bold;">${recruit.volunStartDate } ~ ${recruit.volunEndDate }</td>
               <th>봉사분야</th>
               <td style="color:black; font-weight:bold;">${recruit.volunCode }</td>
             </tr>
             <tr>
               <th>봉사단체</th>
               <td style="color:black; font-weight:bold;">${recruit.groupName }</td>
               <th>봉사시간</th>
               <td style="color:black; font-weight:bold;">${recruit.volunTime }</td>
             </tr>
             <tr>
               <th>봉사지역</th>
               <td style="color:black; font-weight:bold;">${recruit.volunRegion1 } ${recruit.volunRegion2 }</td>
               <th>봉사장소</th>
               <td style="color:black; font-weight:bold;">${recruit.volunAddr }</td>
             </tr>
             <tr>
               <th>봉사대상</th>
               <td style="color:black; font-weight:bold;">${recruit.volunTarget }</td>
               <th></th>
               <td style="color:black; font-weight:bold;"></td>
             </tr>

           </table>


 <!--           <div class="row my-4">
             <div class="col-md-12 mb-4">
               <img src="images/hero_1.jpg" alt="Image placeholder" class="img-fluid rounded">
             </div>
             <div class="col-md-6 mb-4">
               <img src="images/img_2_horizontal.jpg" alt="Image placeholder" class="img-fluid rounded">
             </div>
             <div class="col-md-6 mb-4">
               <img src="images/img_3_horizontal.jpg" alt="Image placeholder" class="img-fluid rounded">
             </div>
           </div> -->
           <div style="color:black; margin-top:50px; margin-bottom:50px;">
           ${info.reviewContent }   
           </div>
         </div>


         <div class="pt-5">
           <p style="font-weight:bold; color:black;">카테고리:  
           	<c:forEach var="category" items="${categoryName }">
           		<a href="/review/list?codeNumber=${category.codeNumber }">${category.codeName }</a>, 
           	</c:forEach>
           
           </p>
         </div>
		<c:if test="${info.member.memId eq principal.user.loginId }">
         <div style="float: right;">
           <a href="#" class="figure"><h6>수정</h6></a>
           <a href="#" class="figure"><h6>삭제</h6></a>
         </div>
        </c:if>
         <div class="icon-love">
        	<a href="" id="recommend">
<!--          			<i class="bi bi-hand-thumbs-up recommend"></i> -->
        	</a>
         </div>
         <span id="recommendCount">${info.recomCount }</span>  
 
         <div class="pt-5 comment-wrap">
           <h3 class="mb-5 heading" id="comment-count" style="font-weight:bold;">댓글 <span style="color:red;">${commentCount }</span> 개</h3>
           <ul class="comment-list" id="comment-form">
           <c:forEach var="comment" items="${commentList }">
             <li class="comment">
               <div class="vcard">
                 <img src="${comment.member.profilImage }" alt="Image placeholder">
               </div>
               <div class="comment-body">
                 <h3>${comment.member.name }</h3>
                 <div class="meta">${comment.modDate }</div>
                 <p>${comment.comContent }</p>
                 
               </div>
             </li>
			</c:forEach>
           </ul>
           <!-- END comment-list -->
		<c:if test="${!empty principal }">
           <div class="comment-form-wrap pt-5">
             <h3 class="mb-5" style="display: inline-block; color:black; ">댓글을 남겨보세요</h3>
             <a href="#" class="btn btn-primary btn-sm rounded px-2 py-2" style="color: black;float:right;background-color: #e7e7e7; font-weight:bold; color: gray;background: #f2f2f2;border-radius: 4px;border: none;font-weight: bold; height: 40px;">Top</a>
             <form>
               <div class="form-group">
                 <label for="name" style="margin-bottom:10px; color:black; ">작성자 : </label>
                 <span style="color:black;">${principal.user.loginName }</span>
               </div>

               <div class="form-group">
                 <textarea name="" id="message" cols="10" rows="5" class="form-control" style="width:100%;" ></textarea>
               </div>
               <div class="form-group">
                 <input type="submit" value="등록하기" id="comment-write" class="btn btn-primary" style="padding: 20px; text-align: center; width: 120px; height: 50px; background-color: #3ab41cb5; color: white; font-size: 19px; border : none; padding:0; float:right;">
               </div>

             </form>
           </div>
        </c:if>  
         </div>

       </div>

       <!-- END main-content -->

       <div class="col-md-12 col-lg-4 sidebar">
         <!-- END sidebar-box -->
         <div class="sidebar-box">
           <div class="bio text-center">
             <img src="${info.member.profilImage }" alt="Image Placeholder" class="img-fluid mb-3">
             <div class="bio-body">
               <h2 style="color:black; font-weight:bold;">${info.member.name }</h2>
<!--                <p class="mb-4">이곳은 프로필 코멘트 남긴걸 보여주는곳 입니다.</p> -->
               <!-- <p class="figure ms-2"><a href="#" class="btn btn-primary btn-sm rounded px-2 py-2">글 좋아요</a></p> -->
             </div>
           </div>
         </div>
         <!-- END sidebar-box -->  
         <div class="sidebar-box">
           <h3 class="heading" style="color:black; font-weight:bold;">인기 후기글</h3>
           <div class="post-entry-sidebar">
             <ul>
          	<c:forEach var="popular" items="${polist }">
				<li>
					<a href="/review/info?reviewSeq=${popular.reviewSeq }">
						<img src="/files/${popular.imageSeq }" alt="Image placeholder" class="me-4 rounded">
						<div class="text">
							<h4>${popular.reviewTitle }</h4>
							<div class="post-meta">
								<span class="mr-2">${popular.modDate } </span>
							</div>
						</div>
					</a>
				</li>
			</c:forEach>

             </ul>
           </div>
         </div>
         <!-- END sidebar-box -->

         <div class="sidebar-box">
           <h3 class="heading" style="color:black; font-weight:bold;">카테고리</h3>
					<ul class="categories">
					<c:forEach var="category" items="${categoryList }">
						<li><a href="/review/list?codeNumber=${category.codeNumber }">${category.codeName } <span>(${category.categoryCount })</span></a></li>
					</c:forEach>
					</ul>
         </div>
         <!-- END sidebar-box -->
       </div>
       <!-- END sidebar -->

     </div>
   </div>
 </section>
<script id="commentTemplate" type="text/x-jsrender">
<li class="comment">
	<div class="vcard">
		<img src="{{:member.profilImage }}" alt="Image placeholder">
	</div>
	<div class="comment-body">
		<h3>{{:member.name }}</h3>
	<div class="meta">{{:modDate }}</div>
		<p>{{:comContent }}</p>                
	</div>
</li>
</script>
<script>
$(document).ready(function () {
	const recommendInt = "${recommendInt}";
	const thumbsUpIcon = $("#recommend");
	
	if (recommendInt > 0) {
		thumbsUpIcon.removeClass("bi-hand-thumbs-up").addClass("bi-hand-thumbs-up-fill");
	} else {
		thumbsUpIcon.removeClass("bi-hand-thumbs-up-fill").addClass("bi-hand-thumbs-up");
	}
	
    var start = 1; // 시작 위치

    $(window).scroll(e => {
    	const { clientHeight, scrollTop, scrollHeight } = e.target.scrollingElement;
//     	console.log("클라이언트 높이 = " + clientHeight)
//     	console.log("스크롤 탑 = " + scrollTop)
//     	console.log("스크롤 높이 = " + (scrollHeight - 400))
    	if (clientHeight + scrollTop >= scrollHeight - 400) {
        	start += 1;
            loadMoreData(start);
    	}
    });

    function loadMoreData(start) {
    	const reviewSeq = "${search.reviewSeq}";
        $.ajax({
            url: "/review/scroll", 
            type: "POST",
            contentType: "application/json; charset=UTF-8",
			data: JSON.stringify({start: start, reviewSeq: reviewSeq}),
			dataType: "json",
            success: function (json) {
            	console.log(json.result)
				const commentData = json.result;
		     	const commentTemplate = $("#commentTemplate").html();
				const tmpl = $.templates(commentTemplate);
				const renderedcomment = tmpl.render(commentData);
				  
// 				const commentListHTML = $("#comment-form");
// 				commentListHTML.empty();
				$("#comment-form").append(renderedcomment);
            }
        });
    }
    
    $("#comment-write").on("click", (e) => {
    	e.preventDefault();
    	const reviewSeq = "${search.reviewSeq}";
    	const param = {
    			reviewSeq: reviewSeq,
    			comContent: $("#message").val()
    	}
        $.ajax({
            url: "/review/comment", 
            type: "POST",
            contentType: "application/json; charset=UTF-8",
			data: JSON.stringify(param),
			dataType: "json",
            success: function (json) {
            	console.log(json.result)
				const commentData = json.result;
		     	const commentTemplate = $("#commentTemplate").html();
				const tmpl = $.templates(commentTemplate);
				const renderedcomment = tmpl.render(commentData);
				  
// 				const commentListHTML = $("#comment-form");
				$("#message").val("");
				$("#comment-form").append(renderedcomment);
				$("#comment-count").text(json.count + " Comments");
            }
        });
    	
    })
    
    $("#recommend").on("click", (e) => {
    	e.preventDefault();
        var recommendInt = "${recommendInt}";
        console.log(recommendInt);
    	const thumbsUpIcon = $("#recommend");
    	const principal = "${principal.user}";
    	if (principal == "") {
    		return false;
    	}
    	const param = {
    			memSeq: "${principal.user.memSeq}",
    			memAuth: "${principal.user.loginAuth}",
    			reviewSeq: "${search.reviewSeq}"
    	}
        $.ajax({
            url: "/review/recommend", 
            type: "POST",
            contentType: "application/json; charset=UTF-8",
			data: JSON.stringify(param),
			dataType: "json",
            success: function (json) {
            	$("#recommendCount").text(json.count);
				
				if (json.status) {
					thumbsUpIcon.removeClass("bi-hand-thumbs-up").addClass("bi-hand-thumbs-up-fill");
				} else {
					thumbsUpIcon.removeClass("bi-hand-thumbs-up-fill").addClass("bi-hand-thumbs-up");
				}
				
                Swal.fire({
          		  title: json.message,
          		  icon: "success"
          		});
            }
        });
    });
    
});





function resizeImages() {
    const images = document.querySelectorAll('img'); // 모든 이미지 요소 선택
    const maxWidth = 400; // 원하는 최대 가로 폭
    const maxHeight = 500; // 원하는 최대 세로 높이

    images.forEach(img => {
      // 이미지 크기가 최대 크기를 넘어가면 조절
      if (img.width > maxWidth || img.height > maxHeight) {
        if (img.width > maxWidth) {
          img.height = (maxWidth / img.width) * img.height;
          img.width = maxWidth;
        }
        if (img.height > maxHeight) {
          img.width = (maxHeight / img.height) * img.width;
          img.height = maxHeight;
        }
      }
    });
  }

  // 페이지 로드 시 이미지 크기 조절 함수 실행
  window.addEventListener('load', resizeImages);

  // 화면 크기가 변경될 때도 이미지 크기 조절 함수 실행
  window.addEventListener('resize', resizeImages);

</script>


<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>