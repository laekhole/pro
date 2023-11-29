<%@ include file="/WEB-INF/jsp/include/top.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/page/group.css" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


	<div class="search-result-wrap" style="margin-top:50px; margin-bottom:50px;">
		<div class="container">
			<div class="innerinner" style="width: 100%;margin: 0;padding: 0;display:flex;justify-content:center;">
			<div class="inner1" style="width: 100%;">
    
				<div class="inner2">
					<div class="row posts-entry">
						<div class="sss" style="margin-bottom:50px;">
						
						<c:forEach var="notice" items="${list}">
							<div class="blog-entry d-flex blog-entry-search-item" style="margin-bottom:70px;">
								<div style="width:100%;">
									<p class="title"><a href="" style="font-size:30px;">${notice.title }</a></p>
								</div>
							</div>
							<hr>
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

	</script>
	
<%@ include file="/WEB-INF/jsp/include/bottom.jsp"%>