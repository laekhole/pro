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
             <h4 style="font-weight: bold;">${info.reviewTitle }</h4>
           </div>

             <ul class="review-ul">
               <li>작성일 : ${info.modDate }</li>
               <li>조회수 : ${info.viewCount }</li>
               <!-- <li>
                 <div class="icon-love">
                   <i class="bi bi-hand-thumbs-up-fill recommend"></i>
                 </div>
                 591
               </li> -->
             </ul>

           <table class="table-review">
             <tr>
               <th>봉사기간</th>
               <td>2023-10-21 ~ 2023-10-29</td>
               <th>봉사분야</th>
               <td>시설봉사</td>
             </tr>
             <tr>
               <th>봉사단체</th>
               <td>혜화불주먹해적단</td>
               <th>봉사시간</th>
               <td>8시간</td>
             </tr>
             <tr>
               <th>봉사지역</th>
               <td>서울시 종로구</td>
               <th>봉사장소</th>
               <td>혜화역</td>
             </tr>
             <tr>
               <th>봉사대상</th>
               <td>부족한친구들</td>
               <th>뭐넣지</th>
               <td>데이터</td>
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
           <div>
           ${info.reviewContent }   
           </div>
         </div>


         <div class="pt-5">
           <p>Categories:  
           	<c:forEach var="category" items="${categoryName }">
           		<a href="/review/list?codeNumber=${category.codeNumber }">${category.codeName }</a>, 
           	</c:forEach>
           
           </p>
         </div>

         <div style="float: right;">
           <a href="#" class="figure"><h6>수정</h6></a>
           <a href="#" class="figure"><h6>삭제</h6></a>
         </div>
         <div class="icon-love">
           <i class="bi bi-hand-thumbs-up-fill recommend"></i>
         </div>
         <span>${info.recomCount }</span>  
 
         <div class="pt-5 comment-wrap">
           <h3 class="mb-5 heading">6 Comments</h3>
           <ul class="comment-list">
             <li class="comment">
               <div class="vcard">
                 <img src="images/person_1.jpg" alt="Image placeholder">
               </div>
               <div class="comment-body">
                 <h3>혜화불주먹</h3>
                 <div class="meta">2023-10-25</div>
                 <p>댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용</p>
                 
               </div>
             </li>

             <li class="comment">
               <div class="vcard">
                 <img src="images/person_2.jpg" alt="Image placeholder">
               </div>
               <div class="comment-body">
                 <h3>왕십리스킨헤드</h3>
                 <div class="meta">2023-10-26</div>
                 <p>불주먹!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
               </div>
             </li>
           </ul>
           <!-- END comment-list -->

           <div class="comment-form-wrap pt-5">
             <h3 class="mb-5">Leave a comment</h3>
             <form action="#" class="p-5 bg-light">
               <div class="form-group">
                 <label for="name">Name *</label>
                 <input type="text" class="form-control" id="name">
               </div>
               <div class="form-group">
                 <label for="email">Email *</label>
                 <input type="email" class="form-control" id="email">
               </div>
               <div class="form-group">
                 <label for="website">Website</label>
                 <input type="url" class="form-control" id="website">
               </div>

               <div class="form-group">
                 <label for="message">Message</label>
                 <textarea name="" id="message" cols="30" rows="10" class="form-control"></textarea>
               </div>
               <div class="form-group">
                 <input type="submit" value="Post Comment" class="btn btn-primary">
               </div>

             </form>
           </div>
         </div>

       </div>

       <!-- END main-content -->

       <div class="col-md-12 col-lg-4 sidebar">
         <!-- END sidebar-box -->
         <div class="sidebar-box">
           <div class="bio text-center">
             <img src="images/person_2.jpg" alt="Image Placeholder" class="img-fluid mb-3">
             <div class="bio-body">
               <h2></h2>
               <p class="mb-4">이곳은 프로필 코멘트 남긴걸 보여주는곳 입니다.</p>
               <p class="figure ms-2"><a href="#" class="btn btn-primary btn-sm rounded px-2 py-2">쪽지보내기</a></p>
               <!-- <p class="figure ms-2"><a href="#" class="btn btn-primary btn-sm rounded px-2 py-2">글 좋아요</a></p> -->
             </div>
           </div>
         </div>
         <!-- END sidebar-box -->  
         <div class="sidebar-box">
           <h3 class="heading">인기 후기글</h3>
           <div class="post-entry-sidebar">
             <ul>
          	<c:forEach var="popular" items="${polist }">
				<li>
					<a href="/review/info?reviewSeq=${popular.reviewSeq }">
						<img src="/template/images/img_1_sq.jpg" alt="Image placeholder" class="me-4 rounded">
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
           <h3 class="heading">Categories</h3>
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
<script>
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