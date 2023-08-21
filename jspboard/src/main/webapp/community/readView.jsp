<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리 북카페</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/read.css?v=3?">
</head>
<body>
	<main id="read">
		<h3>북챗 :: 커뮤니티</h3>
		<p>오늘 무슨 책을 읽으셨나요?</p>
		<hr style="color: white;">
		<div style="width: 80%; margin: auto; max-width: 760px;">
			<ul id="table"><!--c:out value에 들어갈 프로퍼티는 Community 클래스를 보세요.  -->
			<li>
			<ul class="row">
				<li>제목</li>
				<li><c:out value="${vo.title }" /></li>
				<li>조회수</li>
				<li><c:out value="${vo.readCount }" /></li>
			</ul>
			</li>
			<li>
			<ul class="row">
				<li>작성자</li>
				<li><c:out value="${vo.writer}" /> <span
					style="font-size: 70%; padding-left: 30pxl">(<c:out
							value="${vo.ip }" />)
				</span></li>
				<li>작성날짜</li>
				<li><fmt:formatDate value="${vo.createdAt}" type="both" /></li>
				<!-- pattern ="yyyy-mm-dd HH:mm:ss 또는 type = date,time,both 중 하나로 형식 지정하기  -->
			</ul>
			</li>
			<li id="content">
				<ul>
					<li>내용</li>
					<!-- textarea에 입력한 엔터는 \n db에도 \n으로 저장됩니다. (=> textarea 는 글쓰기, 글수정에서 사용할 입력 태그.) 
					     html 문서 출력은 줄바꿈은 <br> 태그로 변경되어야 하는데 해결 방법 1) pre태그, 방법2) \n을 <br>로 대치
					     방법2)는 줄바꿈 외에도 여러가지 메타문자들이 대치되어야 하지만 pre 태그 안에서는 모든 문자들을 그대로 출력시킴-->
					<li><pre><c:out value="${vo.content }" /></pre></li>
				</ul>
			</li>
			</ul>
			<div style="text-align: center; margin-bottom: 10px;">
				<c:if test="${user.id==vo.writer }">
					<!-- session에 저장된 user attribute의 id와 작성자가 같은면 보이기  -->
					<a class="button" href="javascript:execute(1)">수정</a>
					<!-- 자바스크립트 함수 : 인자값 1은 수정  -->
					<a class="button" href="javascript:execute(2)">삭제</a>
					<!-- 자바스크립트 함수 : 인자값 1은 수정  -->
				</c:if>
				<a class="button" href="list.jsp?page=${page }">목록</a>
				<!-- 현재 페이지 번호 전달 - 순서 3  -->
			</div>
		</div>
		<script type="text/javascript">
      function execute(f){
         let url
         let message
         if(f===1){         //아래 url 변수와 같이 조건삼항연산자로 변경가능
            message='글 수정하시겠습니까?'
         }else if(f===2){
            message='글 삭제하시겠습니까?'
         }
         const yn = confirm(message)
         if(yn) {
            //설명 작성 : 
            url = (f===1)? 'update.jsp?idx='+${vo.idx} :(f===2)? 'delete.jsp?idx='+${vo.idx}:'#';
            location.href=url+'&page='+${page};  /* 현재페이지 번호 전달 - 순서3) */
         }else{
            alert('취소합니다.')
         }   
      }
   </script>
		<!-- 메인글 출력 끝 -->

		<hr>
		<!--댓글 목록 시작 -->

	</main>

</body>
</html>