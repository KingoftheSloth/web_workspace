<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="auto">
<head>
<!-- 문서 정보 및 스타일 설정 -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />

<title>Main Page</title>

<!-- 커스텀 스타일 시트 불러오기 -->
<link rel="stylesheet" href="css/002.css" />

<!-- Bootstrap CSS 불러오기 -->
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
					src="${pageContext.request.contextPath}/image/dog.png" alt="cow"
					width="60" height="50" />
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
								<button type="button" onclick="location.href='checkMessage.jsp'">메세지 확인</button>
						</c:if>
					</div>
				</div>
			</div>
		</nav>
	</header>

	<main>
		<!-- Carousel 컴포넌트 슬라이드 설정, data-bs-ride="carousel: 자동 슬라이드 전환  -->
		<div id="myCarousel" class="carousel slide mb-6"
			data-bs-ride="carousel">
			<!-- 몇 번째의 슬라이드가 보여지는지 인디케이터(점) 생성 -->
			<div class="carousel-indicators">
				<!-- data-bs-target="#myCarousel: id="myCarousel 컴포넌트 제어 지정
                data-bs-slide-to="0": 첫 번쨰 슬라이드 지정
                버튼 활성화 표시 -->
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<!-- data-bs-slide-to="1": 두 번쨰 슬라이드 지정 -->
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<!-- data-bs-slide-to="2": 세 번쨰 슬라이드 지정 -->
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<!-- 슬라이드 항목(컨테이너): 스타일, 배치 관리 -->
			<div class="carousel-inner">
				<!-- 개별 슬라이드 항목, 첫 번째, 활성화 -->
				<div class="carousel-item active">
					<!-- 슬라이드 배경을 설정하는 SVG 그래픽, 스크린 리더에게 보이지 않음 
                    preserveAspectRatio: SVG 화면 크기 조정 및 정렬 
                    xMidYMid slice: 이미지 가운데 정렬, 원본 비율 유지한 채로 잘라냄 
                    키보드 탐색 순서에서 제외 -->
					<svg class="bd-placeholder-img" width="100%" height="100%"
						xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
						preserveAspectRatio="xMidYMid slice" focusable="false">
              <!-- 배경 사각형 채우기, 배경 색상 지정 -->
              <rect width="100%" height="100%"
							fill="var(--bs-secondary-color)" />
            </svg>
					<div class="container">
						<!-- 슬라이드 캡션, 왼쪽 정렬 -->
						<div class="carousel-caption text-start">
							<h1>슬라이드 시작</h1>
							<!-- 텍스트 불투명도 조절 -->
							<p class="opacity-75">살짝 불투명한 설명</p>
							<!-- 버튼 크게, 파란색으로 -->
							<p>
								<a class="btn btn-lg btn-primary" href="#">눌러도 변하는 건 없어요</a>
							</p>
						</div>
					</div>
				</div>
				<!-- 개별 슬라이드 항목, 두 번째 -->
				<div class="carousel-item">
					<svg class="bd-placeholder-img" width="100%" height="100%"
						xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
						preserveAspectRatio="xMidYMid slice" focusable="false">
              <!-- 배경을 어둡게 설정 -->
              <rect width="100%" height="100%" fill="black" />
              <image xlink:href="cow.jpg" width="50%" height="50%"
							x="25%" y="15%" />
            </svg>
					<div class="container">
						<div class="carousel-caption">
							<h1 class="text-dark">소</h1>
							<p class="text-white">소?</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#">소!</a>
							</p>
						</div>
					</div>
				</div>
				
				<!-- 개별 슬라이드 항목, 세 번째 -->
				<div class="carousel-item">
					<svg class="bd-placeholder-img" width="100%" height="100%"
						xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
						preserveAspectRatio="xMidYMid slice" focusable="false">
              <rect width="100%" height="100%"
							fill="var(--bs-secondary-color)" />
            </svg>
					<div class="container">
						<!-- 슬라이드 캡션, 오른쪽 정렬 -->
						<div class="carousel-caption text-end">
							<h1>상현</h1>
							<p>GOOD</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#">마지막</a>
							</p>
						</div>
					</div>
				</div>
				
			</div>
			<!-- 슬라이드 컨트롤 이전 버튼 -->
			<button class="carousel-control-prev" type="button"
				data-bs-target="#myCarousel" data-bs-slide="prev">
				
				<!-- 이전 버튼 아이콘 -->
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				
				<!-- 목적 설명 보이지 않게  -->
				<span class="visually-hidden">Previous</span>
			</button>
			
			<!-- 슬라이드 컨트롤 다음 버튼 -->
			<button class="carousel-control-next" type="button"
				data-bs-target="#myCarousel" data-bs-slide="next">
				
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
				
			</button>
		</div>

		<!-- ================================================= -->

		<!-- 마케팅 메시지 및 특징에 대한 정보 -->
		<div class="container marketing">
			<h3 style="text-align: center;">새로운 가족 찾기</h3>
			<br>
			<hr>
			<!-- 행 정의, 슬라이드 아래에 표시되는 세 개의 열 -->
			<div class="row">
		
				<!-- 동물 사진 리스트  -->
				<div id="photoContainer" class="w-full gap-y-3 gap-x-2 p-5"
					style="text-align: center;"></div>
				<button type="button" class="btn btn-outline-primary" style="width: 150px; margin: auto;"
				onclick="location.href='listAnimal2.jsp'">더보기</button>
				
			</div>
			
			<img alt="" src="secretOfdog.png" style = "width:1300px; height:600px;">
			<!-- /.row -->

			<!-- 수평 구분선(가로줄) 생성 -->
			<hr class="featurette-divider" />

			<!-- 콘텐츠 행 -->
			<div class="row featurette">
				<!-- 중간 크기 화면에서 7/12의 너비 -->
				<div class="col-md-7">
					<!-- 제목, 폰트 보통 굵기, 라인 높이 1(간격 좁게) -->
					<h2 class="featurette-heading fw-normal lh-1">
						First featurette heading.
						<!-- 그림자를 포함하는 보조 텍스트 색상 -->
						<span class="text-body-secondary">It’ll blow your mind.</span>
					</h2>
					<!-- 문단의 주요 정보나 중요한 내용을 강조 -->
					<p class="lead">Some great placeholder content for the first
						featurette here. Imagine some exciting prose here.</p>
				</div>
				<div class="col-md-5">
					<!-- 로드 전 대체 이미지, 이미지 크게, 부모 요소에 맞게 조정, 가로 방향으로 가운데 정렬 -->
					<svg
						class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
						width="500" height="500" xmlns="http://www.w3.org/2000/svg"
						role="img" aria-label="Placeholder: 500x500"
						preserveAspectRatio="xMidYMid slice" focusable="false">
              <title>Placeholder</title>
              <rect width="100%" height="100%" fill="gray" />
              <text x="50%" y="50%" fill="var(--bs-secondary-color)"
							dy=".3em">
                500x500
              </text>
            </svg>
				</div>
			</div>

			<hr class="featurette-divider" />

			<div class="row featurette">
				<!-- 화면 크기가 중간 이상일 때 이 컬럼 오른쪽 배치 -->
				<div class="col-md-7 order-md-2">
					<h2 class="featurette-heading fw-normal lh-1" float>
						Oh yeah, it’s that good. <span class="text-body-secondary">See
							for yourself.</span>
					</h2>
					<p class="lead">Another featurette? Of course. More placeholder
						content here to give you an idea of how this layout would work
						with some actual real-world content in place.</p>
				</div>
				<!-- 화면 크기가 중간 이상일 때 이 컬럼 왼쪽 배치 -->
				<div class="col-md-5 order-md-1">
					<svg
						class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
						width="500" height="500" xmlns="http://www.w3.org/2000/svg"
						role="img" aria-label="Placeholder: 500x500"
						preserveAspectRatio="xMidYMid slice" focusable="false">
              <title>Placeholder</title>
              <rect width="100%" height="100%" fill="gray" />
              <text x="50%" y="50%" fill="var(--bs-secondary-color)"
							dy=".3em">
                500x500
              </text>
            </svg>
				</div>
			</div>

			<hr class="featurette-divider" />

			<div class="row featurette">
				<div class="col-md-7">
					<h2 class="featurette-heading fw-normal lh-1">
						And lastly, this one. <span class="text-body-secondary">Checkmate.</span>
					</h2>
					<p class="lead">And yes, this is the last block of
						representative placeholder content. Again, not really intended to
						be actually read, simply here to give you a better view of what
						this would look like with some actual content. Your content.</p>
				</div>
				<div class="col-md-5">
					<svg
						class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
						width="500" height="500" xmlns="http://www.w3.org/2000/svg"
						role="img" aria-label="Placeholder: 500x500"
						preserveAspectRatio="xMidYMid slice" focusable="false">
              <title>Placeholder</title>
              <rect width="100%" height="100%" fill="gray" />
              <text x="50%" y="50%" fill="var(--bs-secondary-color)"
							dy=".3em">
                500x500
              </text>
            </svg>
				</div>
			</div>

			<hr class="featurette-divider" />
		</div>
		<!-- /.container -->
	</main>

	<!-- 페이지 하단 영역 -->
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
	<!-- Bootstrap JS 파일 불러오기 -->
	<script type="text/javascript" src="./js/mainAnimalList.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/islogin.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>