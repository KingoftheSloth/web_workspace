<%@page import="projectB.dto.adopt"%>
<%@page import="java.util.List"%>
<%@page import="projectB.dao.animalDao"%>
<%@page import="com.oreilly.servlet.DaemonHttpServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입양요청</title>

<style>
table {
	border-collapse: collapse; /* 테이블 셀 테두리를 합칩니다. */
	width: 100%; /* 표의 전체 너비를 100%로 설정합니다. */
	border: 1px solid #ddd; /* 외곽선 스타일과 색상을 설정합니다. */
}

th, td {
	border: 1px solid #ddd; /* 셀 테두리 스타일과 색상을 설정합니다. */
	padding: 8px; /* 셀 안의 여백을 설정합니다. */
	text-align: center; /* 셀 내용을 가운데 정렬합니다. */
}

img {
	width: 100px; /* 이미지의 가로 크기를 조정합니다. */
	height: 100px; /* 이미지의 세로 크기를 조정합니다. */
}

.reserve-button, .reject-button {
	padding: 5px 10px; /* 버튼 내용의 여백을 설정합니다. */
	cursor: pointer; /* 마우스 커서를 포인터로 변경합니다. */
}
</style>

<link rel="stylesheet" href="css/002.css" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
</head>

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

	<section class="py-5 text-center container border border-dark my-5">
		<div class="row py-lg-5">
			<div class="col-lg-6 col-md-8 mx-auto">
				<h1 class="fw-light">하루의 시작, 아침식사</h1>
				<p class="lead text-body-secondary">하루를 시작하는 아침식사는 삼시 세끼 중 가장
					중요하다. 아침식사에서 반드시 보충하면 좋은 영양소는 단백질이다. 단백질은 매 끼니 조금씩 섭취하면 좋지만 아침 식사에서
					단백질을 섭취가 쉽지 않다. 아침 식사로 좋은 단백질 식품은 그릭요거트, 달걀, 코티지치즈, 우유 등이다. 미국의 한
					연구에서 아침식사를 고단백으로 채운 사람들의 체질량지수가 점심이나 저녁때 푸짐한 식사를 한 사람보다 낮은 것으로
					나타났고, 일반적으로 아침식사를 한 사람들이 거른 사람들에 비해 체중을 더 낮게 유지했다고 밝혔다.</p>
				<p>
					<a href="#" class="btn btn-primary my-2">Main call to action</a> <a
						href="#" class="btn btn-secondary my-2">Secondary action</a>
				</p>
			</div>
		</div>
	</section>

	<!-- 메인 시작 -->
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"
		style="margin-bottom: 200px;">

		<h1>입양요청확인</h1>

		<div class="border border-primary rounded"
			style="width: 1252px; padding: 10px;">

			<div class="table-responsive small">


				<%
				List<adopt> list = animalDao.getInstance().infoAdopt();
				%>

				<table class="table table-striped table-hover table-sm"
					style="width: 1230px;">
					<thead>
						<tr>
							<th scope="col">동물 사진</th>
							<th scope="col">유기번호</th>
							<th scope="col">방문예약날짜</th>
							<th scope="col">동물 ID</th>
							<th scope="col">사용자 ID</th>
							<th scope="col">사용자 전화번호</th>
							<th scope="col">확인여부</th>
						</tr>
					</thead>
					<%
					for (adopt item : list) {
						String desertionNo = item.getAniid(); // desertionNo를 동적으로 설정합니다.
					%>
					<tbody>
						<tr>

							<td><img src="<%=item.getFilename()%>" alt='' width='100'
								height='100'></td>
							<td><%=item.getAdoptidx()%></td>
							<td><%=item.getAdoptdate()%></td>
							<td><%=item.getAniid()%></td>
							<td><%=item.getUserid()%></td>
							<td>전화번호</td>
							<td>
								<button class="reserve-button"
									data-animal-id="<%=item.getAniid()%>">예약</button>
								<button class="reject-button"
									data-animal-id="<%=item.getAniid()%>">취소</button>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
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

	<script>
const reserveButtons = document.querySelectorAll(".reserve-button");
const rejectButtons = document.querySelectorAll(".reject-button");

// 예약잡기 버튼 클릭 시 메시지 입력 대화 상자 표시
reserveButtons.forEach(button => {
    button.addEventListener("click", () => {
        const animalId = button.getAttribute("data-animal-id");
        const message = prompt("예약 메시지를 입력하세요:");
        if (message !== null) {
            // 사용자가 메시지를 입력한 경우에만 메시지를 출력하고 예약 처리 로직을 추가하세요.
            alert("전송이 완료되었습니다. 메시지: " + message);
        }
    });
});

// 거절하기 버튼 클릭 시 메시지 입력 대화 상자 표시
rejectButtons.forEach(button => {
    button.addEventListener("click", () => {
        const animalId = button.getAttribute("data-animal-id");
        const message = prompt("취소 메시지를 입력하세요:");
        if (message !== null) {
            // 사용자가 메시지를 입력한 경우에만 메시지를 출력하고 거절 처리 로직을 추가하세요.
            alert("전송이 완료되었습니다. 메시지: " + message);
        }
    });
});
</script>
</body>
</html>
