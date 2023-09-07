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
		<!-- 검색 버튼 -->
		<label> 
		<input type="radio" id="dogRadio" name="animalType"	value="개"> 
			<label for="dogRadio">개</label> 
			<input type="radio" id="catRadio" name="animalType" value="고양이"> 
			<label for="catRadio">고양이</label> <input type="radio" id="othersRadio"	name="animalType" value="기타"> <label for="othersRadio">기타</label>
		</label>
		<button id="searchButton">검색</button>
	</div>
	<input type="hidden" name=desertionNo id=desertionNo>
	<!-- 검색리스트 -->
	<div id="searchResultsContainer">
		<!-- 검색 결과가 여기에 표시됩니다. -->
	</div>
	<hr>
	<!-- 동물 사진 리스트  -->
	<div id="photoContainer" class="w-full grid grid-cols-2 sm:grid-cols-2 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-y-3 gap-x-3" ></div>
	<div id="animalDetails" class="flex-1 flex flex-col gap-1 p-2"></div>
	<div id="pagination">
'현재페이지':<span id="page" >1</span>
		<button id="prevPageBtn" onclick="prevPageData()">이전 페이지</button>
		<button id="nextPageBtn" onclick="nextPageData()">다음 페이지</button>
	</div>
	<script type="text/javascript" src="./js/openAnimalAPI.js"></script>
	<script type="text/javascript" src="./js/openAnimalDetails.js"></script>
		<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous">
	</script>
</body>
</html>