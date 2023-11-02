<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/jsp/include/admintop.jsp"%>

<div class="mb-3 d-flex align-items-center">
	<label for="member-type-filter" class="form-label me-2" style="display: none">봉사게시판 구분</label>
	<button class="btn btn-primary me-2">후기 게시판</button>
	<button class="btn btn-secondary">모집 게시판</button>
</div>

            <div class="container mt-4">
                <!-- 검색어를 입력할 입력 필드 -->
                <input type="text" id="searchInput" placeholder="검색..." onkeyup="filterTable()">
            
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th><input type="checkbox" id="selectAll" onclick="selectAllCheckboxes()"></th>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td>게시글 제목 1</td>
                            <td>작성자 1</td>
                            <td>2023-10-26</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>2</td>
                            <td>게시글 제목 2</td>
                            <td>작성자 2</td>
                            <td>2023-10-25</td>
                        </tr>
                    </tbody>
                </table>
            
                <!-- 선택한 항목을 삭제할 버튼 -->
            <!-- 선택한 항목을 삭제할 둥글게 디자인된 버튼 -->
            <button onclick="deleteRows()" class="btn btn-primary rounded">선택 항목 삭제</button>
            </div>

            <script>
                // 검색어에 따라 테이블 필터링 함수
                function filterTable() {
                    var input = document.getElementById("searchInput");
                    var filter = input.value.toLowerCase(); // 소문자로 변환
                    var table = document.querySelector(".table");
                    var tr = table.getElementsByTagName("tr");
                    
                    for (var i = 1; i < tr.length; i++) {
                        var td = tr[i].getElementsByTagName("td")[2]; // 제목 열
                        if (td) {
                            var txtValue = td.textContent || td.innerText;
                            if (txtValue.toLowerCase().indexOf(filter) > -1) {
                                tr[i].style.display = "";
                            } else {
                                tr[i].style.display = "none";
                            }
                        }
                    }
                }
            
                // 모든 체크박스 선택/해제 함수
                function selectAllCheckboxes() {
                    var checkboxes = document.querySelectorAll('tbody input[type="checkbox"]');
                    for (var i = 0; i < checkboxes.length; i++) {
                        checkboxes[i].checked = document.getElementById('selectAll').checked;
                    }
                }
            
                // 선택된 행 삭제 함수
                function deleteRows() {
                    var checkboxes = document.querySelectorAll('tbody input[type="checkbox"]');
                    for (var i = 0; i < checkboxes.length; i++) {
                        if (checkboxes[i].checked) {
                            checkboxes[i].closest('tr').remove();
                        }
                    }
                }
            </script>            
<%@ include file="/WEB-INF/jsp/include/adminbottom.jsp"%>

