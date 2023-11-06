<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     --%>
<%-- <%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>     --%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>${pageTitle }</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="Untree.co">
<link rel="shortcut icon" href="/template/favicon.png">

<!-- CDN방식 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" > -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@200&display=swap" rel="stylesheet">

<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap5" />

<!-- <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;600;700&display=swap" rel="stylesheet">
 -->

<link rel="stylesheet" href="/template/fonts/icomoon/style.css">
<link rel="stylesheet" href="/template/fonts/flaticon/font/flaticon.css">



<link rel="stylesheet" href="/template/css/tiny-slider.css">
<link rel="stylesheet" href="/template/css/aos.css">
<link rel="stylesheet" href="/template/css/glightbox.min.css">
<link rel="stylesheet" href="/template/css/style.css">
<link rel="stylesheet" href="/template/css/flatpickr.min.css">
<!-- 새로 추가 되는 CSS -->
<link rel="stylesheet" href="/css/page/review.css">
	<!-- FullCalendar CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" />




<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="/js/common/jsrender.js"></script>
<script src="/js/common/jsviews.js"></script>
<script src="/js/common/jquery.locator.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/12.4.0/classic/ckeditor.js"></script>
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>


</head>
<body>

<nav class="site-nav">
	<div class="container">
		<div class="menu-bg-wrap">
			<div class="site-navigation">
				<div class="row g-0 align-items-center">
					<div class="col-2">
						<a href="/main" class="logo m-0 float-start">봉사활동커뮤니티<span class="text-primary">.</span></a>
					</div>
					<div class="col-8 text-center">

						<ul class="js-clone-nav d-none d-lg-inline-block text-start site-menu mx-auto">
							<li class="active"><a href="index.html">공지사항</a></li>
							<li><a href="category.html" style="color: #fff;">봉사 안내</a></li>
							<li><a href="category.html" style="color: #fff;">봉사 신청</a></li>
							<li><a href="/review/list" style="color: #fff;">봉사 후기</a></li>
							<li><a href="category.html" style="color: #fff;">고객센터</a></li>						
						</ul>
					</div>
					
					<div class="col-2 text-end">
						<ul class="js-clone-nav d-none d-lg-inline-block text-start site-menu mx-auto">
						<!-- <div class="icon-container">
							<i class="custom-icon fas fa-sign-in-alt"></i>
						</div> -->
						<div class="icon-container me-4">
							<span class="notification-badge">3</span>
							<i class="icon-message"></i>
						</div>
							<li class="has-children">

						<div class="icon-container me-4">
							<i class="custom-icon fas fa-user mypage"></i>
						</div>
							
							<ul class="dropdown">
								<li><a href="search-result.html">1:1 쪽지함</a></li>
								<li><a href="blog.html">내가 쓴 글</a></li>
								<li><a href="single.html">신청한 봉사 목록</a></li>
								<li class="has-children">
									<a href="#">테스트</a>
									<ul class="dropdown">
										<li><a href="#">Sub Menu One</a></li>
										<li><a href="#">Sub Menu Two</a></li>
										<li><a href="#">Sub Menu Three</a></li>
									</ul>
								</li>
							</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</nav>
