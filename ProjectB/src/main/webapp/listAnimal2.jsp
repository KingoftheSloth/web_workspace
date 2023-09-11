<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>API 데이터 출력</title>

<link rel="stylesheet" href="css/002.css" />
<link rel="stylesheet" href="css/003.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<style>
.pointer-cursor {
	cursor: pointer;
}

#photoContainer img {
	margin-bottom: 20px;
	margin-top: 30px;
}
/* 버튼 스타일 */
.my-button {
	padding: 10px 20px; /* 버튼 내부 패딩 설정 */
	background-color: #007BFF; /* 배경색 설정 */
	color: #fff; /* 글자색 설정 */
	border: none; /* 테두리 없애기 */
	border-radius: 5px; /* 버튼 모서리 둥글게 만들기 */
	cursor: pointer; /* 포인터 커서 설정 */
	font-size: 20px; /* 글자 크기 설정 */
}

/* 라디오 버튼 스타일 */
.my-radio {
	margin-right: 5px; /* 라디오 버튼 간격 설정 */
	font-size: 20px; /* 글자 크기 설정 */
}
</style>

<body class="d-flex flex-column min-vh-100 pb-0">
	<!-- 헤더 시작, 밝은 테마 -->
	<header data-bs-theme="light">
		<!-- 네비 바에서 화면의 크기가 중간 이상일 때 요소 확대, 상단 고정, 배경 밝게-->
		<nav class="navbar navbar-expand-md fixed-top bg-light"
			style="height: 80px;">
			<!-- 컨테이너 화면 너비만큼 확장(그리드 가능) -->
			<div class="container-fluid">
				<!-- 네비 브랜드 로고 -->
				<a class="navbar-brand" href="002.html"> <!-- alt는 대체 텍스트 --> <img
					src="../image/dog.png" alt="cow" width="60" height="50" />
				</a>
				<!-- 요소를 접을 수 있게 만듬, 콘텐츠 그룹화 -->
				<div id="menu" class="collapse navbar-collapse" id="navbarCollapse">
					<!-- 네비 내부 목록, 오른쪽 마진 자동 설정 및 왼쪽 정렬, 아래 마진 2, 중간 크기에서는 아래 마진 0 -->
					<ul class="navbar-nav me-auto mb-2 mb-md-0">
						<!-- 네비 항목 -->
						<li class="nav-item">
							<!-- 네비 링크, 활성화되면 표시, 텍스트 검정, 스크린 리더(aria)에게 현재 페이지임을 알림 --> <a
							class="nav-link active text-black" aria-current="page"
							href="${pageContext.request.contextPath}">Home</a>
						</li>
						<li class="nav-item"><a class="nav-link text-black" href="#">상품</a>
							<ul class="list-unstyled mb-0">
								<li><a
									href="${pageContext.request.contextPath}/products/productsListAction.jsp"
									class="text-decoration-none">상품 전체 보기</a></li>
								<li><a
									href="${pageContext.request.contextPath}/products/products.jsp"
									class="text-decoration-none">상품 등록</a></li>
								<li><a href="#" class="text-decoration-none">SUB_MENU3</a>
								</li>
							</ul></li>
						<li class="nav-item"><a class="nav-link text-black" href="#">커뮤니티</a>
							<ul class="list-unstyled mb-0">
								<li><a href="#" class="text-decoration-none">입양/상품 후기</a></li>
								<li><a href="#" class="text-decoration-none">임시보호/실종</a></li>
								<li><a href="#" class="text-decoration-none">SUB_MENU3</a>
								</li>
							</ul></li>
						<li class="nav-item"><a class="nav-link disabled text-black">공고</a>
						</li>
						<li class="nav-item"><a class="nav-link text-black"
							href="javascript:write()">1:1 문의</a></li>
					</ul>
					<!-- form 내부 요소들을 수평 정렬할 수 있음 -->
					<form class="d-flex" role="search">
						<!-- 폼 입력 필드, 밝은 테마, 오른쪽 마진 3 -->
						<input class="form-control form-control-light me-3" type="search"
							placeholder="Search..." aria-label="Search" />
					</form>
					<!-- 오른쪽 정렬 -->
					<div class="text-end d-flex" style="min-width: 180px">
						<c:if test="${user !=null }">
							<h4>
								<c:out value="${user.username }" />
								님
							</h4>
							<span> <a
								href="${pageContext.request.contextPath}/logout.jsp">로그아웃</a>
							</span>
							<span> <a
								href="${pageContext.request.contextPath}/account/mypage.jsp">마이페이지</a>
							</span>
						</c:if>

						<!-- 검은 테두리 흰 바탕 -->
						<c:if test="${user ==null }">

							<button type="button" class="btn btn-outline-dark me-2"
								onclick="location.href='${pageContext.request.contextPath}/login.jsp'">로그인</button>
							<!-- 노란 배경의 스타일 -->
							<button type="button" class="btn btn-warning"
								onclick="location.href='${pageContext.request.contextPath}/account/signup2.jsp'">회원가입</button>
						</c:if>
					</div>
				</div>
			</div>
		</nav>
	</header>

	<main style="margin-bottom: 200px; text-align: center;">

		<div>
			<h1 class="mt-5">현재 보호중인 친구들</h1>
			<div>
				<!-- 검색 버튼 -->
				<label> <input type="radio" id="dogRadio" name="animalType"
					value="개"> <label for="dogRadio" class="my-radio">개</label>
					<input type="radio" id="catRadio" name="animalType" value="고양이"
					class="my-radio"> <labelfor="catRadio">고양이</label> <input
					type="radio" id="othersRadio" name="animalType" value="기타">
				<label for="othersRadio">기타</label> </label>
			</div>
			<button id="searchButton" class="my-button">검색</button>
			<button id="resetButton" class="my-button">검색 초기화</button>

			<input type="hidden" name=desertionNo id=desertionNo>

			<div id="animalDetails"
				style="width: 650px; margin: auto; text-align: left; padding: 30px; margin-top: 30px;"></div>

			<div class="d-flex align-items-center">
				<button
					style="height: 100px; margin-left: 450px; border: 1px solid white; background-color: white;"
					id="prevPageBtn" onclick="prevPageData()">
					<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
						fill="currentColor" class="bi bi-arrow-left-circle-fill"
						viewBox="0 0 16 16">
  						<path
							d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0zm3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z" />
					</svg>
				</button>

				<!-- 검색리스트 -->
				<div class="d-flex" id="searchResultsContainer">
					<!-- 검색 결과가 여기에 표시됩니다. -->
				</div>

				<button
					style="height: 100px; border: 1px solid white; background-color: white;"
					id="nextPageBtn" onclick="nextPageData()">
					<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
						fill="currentColor" class="bi bi-arrow-right-circle-fill"
						viewBox="0 0 16 16">
  					<path
							d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z" />
					</svg>
				</button>
			</div>


			<!-- 동물 사진 리스트  -->
			<div id="pagination" style="text-align: center;">
				<div id="photoContainer"
					class="w-full grid grid-cols-2 sm:grid-cols-2 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-y-3 gap-x-3"></div>
				현재페이지:<span id="page">1</span>

			</div>
			<hr>
		</div>
		<!-- 메인 종료 -->
	</main>
	<!-- 푸터 시작 -->
	<footer class="container">
		<!-- 오른쪽으로 부유, 현재 페이지 맨 위 링크 -->
		<p class="float-end">
			<a href="#">Back to top</a>
		</p>
		<p class="mb-0">
			&copy; 2017–2023 Company, Inc. &middot; <a href="#">Privacy</a>
			&middot; <a href="#">Terms</a>
		</p>
		<!-- 푸터 종료 -->
	</footer>

	<script type="text/javascript" src="./js/openAnimalAPI.js"></script>
	<script type="text/javascript" src="./js/openAnimalDetails.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js">
		
	</script>
</body>
</html>