<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>API 데이터 출력</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
</head>
<style>
.pointer-cursor {
	cursor: pointer;
}
</style>

<body>
  	<h1>유기동물API 데이터 출력</h1>
	<div>
    <!-- 검색 필드 -->
    <select id="searchCondition">
    <option value="kindCd">품종 (예: 개, 고양이)</option>
    <option value="careAddr">지역 (예: 강원 → 강원도)</option>
    <option value="age">나이(예: 20 → 2020년생)</option>
	</select>
    <input type="text" id="searchInput" placeholder="검색어를 입력하세요">
    <!-- 검색 버튼 -->
    <button id="searchButton">검색</button>
</div>
	<input type="hidden" name=desertionNo id=desertionNo>
	<!-- 검색리스트 -->
	<div id="searchContainer"></div>
	<hr>
	<!-- 동물 사진 리스트  -->
	<div id="photoContainer"></div>
	<div id="animalDetails">
	 </div>
		<div id="pagination">
		<button id="prevPageBtn" onclick="loadPageData(currentPage - 1)"
			disabled>이전 페이지</button>
		<div id="pageNumbers"></div>
		<button id="nextPageBtn" onclick="loadPageData(currentPage + 1)"
			disabled>다음 페이지</button>
	</div>
	<script type="text/javascript" src="./js/openAnimalAPI.js"></script>
	<script type="text/javascript" src="./js/searchAnimal.js"></script>
	<script type="text/javascript" src="./js/openAnimalDetails.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>