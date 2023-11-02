<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <%@ include file="/WEB-INF/jsp/include/admintop.jsp"%>
       
          <!--공지사항 바디 리스트 -->
          <div class="notice-container">
            <div class="notice-actions">
                <div class="notice-search">
                    <select class="notice-select" id="noticeCategory">
                        <option value="title">제목</option>
                        <option value="author">작성자</option>
                        <option value="content">내용</option>
                    </select>
                    <input type="text" id="noticeInput" class="search-input" placeholder="검색...">
                    <button class="search-btn">검색</button>
                </div>
                <button class="new-notice-btn">새 공지사항 등록</button>
            </div>
            <!-- 기타 공지사항 내용... -->
        	</div>
        
         <!-- 정렬 영역 -->
          <!-- 상단 고정 및 삭제 버튼 -->
          <div class="button-group">
            <div class="manage-buttons">
                <button class="btn btn-primary m-2">상단 고정</button>
                <button class="btn btn-primary m-2">선택 삭제</button>
            </div>
            <div class="sort-area">
                <button class="btn btn-primary m-2">최신순</button>
                <button class="btn btn-primary m-2">조회순</button>
            </div>
        </div>
        
              <!-- 공지사항 목록 -->
          <div class="col-12">
            <div class="bg-light rounded h-100 p-4">
                <h6 class="mb-4">Responsive Table</h6>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col"><input type="checkbox" id="selectAll"></th>
                                <th scope="col">#</th>
                                <th scope="col">First Name</th>
                                <th scope="col">Last Name</th>
                                <th scope="col">Email</th>
                                <th scope="col">Country</th>
                                <th scope="col">ZIP</th>
                                <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="checkbox"></td>
                                <th scope="row">1</th>
                                <td>John</td>
                                <td>Doe</td>
                                <td>jhon@email.com</td>
                                <td>USA</td>
                                <td>123</td>
                                <td>Member</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>mark@email.com</td>
                                <td>UK</td>
                                <td>456</td>
                                <td>Member</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>jacob@email.com</td>
                                <td>AU</td>
                                <td>789</td>
                                <td>Member</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
 <%@ include file="/WEB-INF/jsp/include/adminbottom.jsp"%>

