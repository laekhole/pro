<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <!-- Sidebar -->
   <div class="d-flex" id="wrapper">
      <!-- Sidebar-->
      <div class="col-md-2 col-lg-3 col-xl-2 border-end bg-white" id="sidebar-wrapper">
            <div class="list-group list-group-flush">
                  <a class="list-group-item list-group-item-action list-group-item-light p-3" href="<c:url value='/mypage/personal/' />">마이 페이지</a>
                  <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#">즐겨찾기 목록</a>
                  <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#">찜한 봉사 목록</a>
                  <a class="list-group-item list-group-item-action list-group-item-light p-3" href="<c:url value='/mypage/personal/list' />">나의 봉사 목록</a>
                  <a class="list-group-item list-group-item-action list-group-item-light p-3" href="<c:url value='/mypage/personal/finished' />">종료된 봉사</a>
                  <a class="list-group-item list-group-item-action list-group-item-light p-3" href="<c:url value='/mypage/personal/reviewed' />">내가 쓴 후기</a>
                  <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#">문의 내역</a>
                  <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#">개인 정보</a>

            </div>
      </div>