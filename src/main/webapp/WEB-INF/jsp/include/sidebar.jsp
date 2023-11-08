<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <!-- Sidebar -->
   <div class="d-flex" id="wrapper">
      <!-- Sidebar-->
      <div class="col-md-2 col-lg-3 col-xl-2 border-end bg-white" id="sidebar-wrapper">
            <div class="list-group list-group-flush border-top">
                  <a id="myMain" class="list-group-item list-group-item-action list-group-item-light p-3" href="<c:url value='/user/' />">마이 페이지</a>
                  <a id="" class="list-group-item list-group-item-action list-group-item-light p-3" href="#">즐겨찾기 목록</a>
                  <a id="" class="list-group-item list-group-item-action list-group-item-light p-3" href="#">찜한 봉사 목록</a>
                  <a id="myList" class="list-group-item list-group-item-action list-group-item-light p-3" href="<c:url value='/user/list' />">나의 봉사 목록</a>
                  <a id="myFinish" class="list-group-item list-group-item-action list-group-item-light p-3" href="<c:url value='/user/finished' />">종료된 봉사</a>
                  <a id="myReview" class="list-group-item list-group-item-action list-group-item-light p-3" href="<c:url value='/user/reviewed' />">내가 쓴 후기</a>
                  <a id="" class="list-group-item list-group-item-action list-group-item-light p-3" href="#">문의 내역</a>
                  <a id="" class="list-group-item list-group-item-action list-group-item-light p-3" href="#">개인 정보</a>

            </div>
      </div>
      
      <script>
      document.addEventListener('DOMContentLoaded', function() {
    	    var pageName = document.getElementById('pageName').value;
    	    var myMain = document.getElementById('myMain');
    	    var myList = document.getElementById('myList');
    	    var myFinish = document.getElementById('myFinish');
    	    var myReview = document.getElementById('myReview');

    	    if (pageName === 'list') {
    	        myList.style.backgroundColor = '#45a7d7f7';
    	    } else if (pageName === 'finish') {
    	        myFinish.style.backgroundColor = '#45a7d7f7';
    	    } else if (pageName === 'main') {
    	        myMain.style.backgroundColor = '#45a7d7f7';
    	    } else if (pageName === 'review') {
    	        myReview.style.backgroundColor = '#45a7d7f7';
    	    }
    	});
      </script>