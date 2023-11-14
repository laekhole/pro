<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ include file="/WEB-INF/jsp/include/top.jsp"%>
	<%@ include file="/WEB-INF/jsp/include/sidebar.jsp"%> 
    
    <input type="hidden" id="pageName" value="finish">
<!-- Page content wrapper-->
      <div class="col-md-10 col-lg-9 col-xl-10" id="page-content-wrapper">

            <!-- Page content-->
            <div class="container-fluid">
               <div class="row" style="width: 1100px;">
               </div>





                <div class="row posts-entry" style="margin-bottom: 2rem;">
                
                    <div class="col-lg-10" style="text-align: right;">
						<%@ include file="/WEB-INF/jsp/include/searchformTemplate.jsp"%> 
                    </div>

                    <div class="col-lg-10">
                    
			             <div class="blog-entry d-flex blog-entry-search-item" style="display: flex; align-items: center;">
			               <div class="form-check">
			                   <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
			                   <label class="form-check-label" for="flexCheckDefault"></label>
			               </div>
			               <div style="flex-grow: 1; margin-left: 1rem;">
			                   <span class="date" style="margin-right: 5rem;">Apr. 14th, 2022</span>
			                   <span class="date">Apr. 14th, 2022</span>
			                   <p style="margin:0;">봉사 단체 이름</p>
			                   <h2><a href="single.html">1번째 샘플? Wait until you meet Rust</a></h2>
			                   <div class="d-flex justify-content-between align-items-center">
			                       <div>
			                           <p style="margin-bottom: 0;">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
			                       </div>
			                       <div class="btn-container">
			                       
			                           <a href="#"><div class="btn btn-secondary my-2 my-sm-0"> 후기<br>쓰기</div></a>
			                           <div class="btn btn-secondary my-2 my-sm-0"> 평가<br>하기</div>
			                       </div>
			                   </div>
			               </div>
			             </div>

					<c:forEach var="finished" items="${list}">
						<div class="blog-entry d-flex blog-entry-search-item" style="align-items: center !important;">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
								<label class="form-check-label" for="flexCheckDefault"></label>
							</div>
							<div style="flex-grow: 1; margin-left: 1rem;">
								<span class="date" style="margin-right: 5rem !important;">${finished.volunStartDate }</span>
								<span class="date">${finished.volunEndDate }</span>
								<p style="margin:0;">${finished.groupName }</p>
								<h2><a href="single.html">${finished.recruitTitle }</a></h2>
								<div class="d-flex justify-content-between align-items-center">
									<div>
										<p>${finished.recruitContent }</p>
									</div>
									<div class="btn-container">
										<a href="#"><div class="btn btn-secondary my-2 my-sm-0"> 후기<br>쓰기</div></a>
										<div class="btn btn-secondary my-2 my-sm-0"> 평가<br>하기</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

			             <div class="blog-entry d-flex blog-entry-search-item" style="display: flex; align-items: center;">
			               <div class="form-check">
			                   <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
			                   <label class="form-check-label" for="flexCheckDefault"></label>
			               </div>
			               <div style="flex-grow: 1; margin-left: 1rem;">
			                   <span class="date">Apr. 14th, 2022</span>
			                   <h2><a href="single.html">3번째 샘플? Wait until you meet Rust</a></h2>
			                   <div class="d-flex justify-content-between align-items-center">
			                       <div>
			                           <p style="margin-bottom: 0;">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
			                       </div>
			                       <div class="btn-container">

 		                            <a href="#"><div class="btn btn-secondary my-2 my-sm-0"> 후기<br>쓰기</div></a>   
			                        <div class="btn btn-secondary my-2 my-sm-0"> 평가<br>하기</div>
                              
			                       </div>
			                   </div>
			               </div>
			             </div>

                        <div class="row text-start pt-5 border-top">
                            <div class="col-md-12">
                                <div class="custom-pagination">
                                    <span>1</span>
                                    <a href="#">2</a>
                                    <a href="#">3</a>
                                    <a href="#">4</a>
                                    <span>...</span>
                                    <a href="#">15</a>
                                </div>
                            </div>
                        </div>

                    </div>


			</div>




            </div>

      </div>
   </div>
   
<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>   

  </body>
</html>