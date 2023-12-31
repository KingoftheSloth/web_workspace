<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리 북카페</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/community.css?v=3">
</head>
<body>
	<main id="write">
		<h3>북챗 :: 커뮤니티</h3>
		<p>오늘 무슨 책을 읽으셨나요?</p>
		<hr style="color: white;">
		<form name="frm1" method="post" action="updateAction.jsp"
			onsubmit="return isValid()">
			<input type="hidden" name="idx" value="${vo.idx }"> <input
				type="hidden" name="page" value="${page }">
			<!-- 현재 페이저 번호 전달 - 순서 5) post로 전달해야 하므로 hidden type으로 저장-->
			<table>
				<tr>
					<th>제목</th>
					<td>
					<c:choose>
								<%-- title 에 '[수정]'이 있으면 참  --%>
							<c:when test="$fn:contains(vo.title, '[수정]')}">
							</c:when>
							<c:otherwise>
								<input type="text" name="title" size="50"
									value="[수정]${vo.title }" readonly>
							</c:otherwise>
						</c:choose> <!-- readonly : 입력불가 --></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="writer" size="50"
						value="${vo.writer }" disabled="disabled"></td>
				</tr>
				<tr>
					<th>작성 날짜</th>
					<td><c:out value="${vo.createdAt }" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<!-- textarea의 크기  : rows="30" cols="80"  -->
					<td><textarea rows="30" cols="80" name="content" required><c:out
								value="${vo.content }" /></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="button" onclick="isValid()">저장</button> <!-- 유효성 검사 후 자바스크립ㅈ트에서 submit.(hrd_mvc2 프로젝트 유효성 검사 참고.) -->
						<button type="reset">다시쓰기</button>
						<button type="button" onclick="location.href='list.jsp?page=${page}'">목록</button>
						<!-- 현재페이지 번호 전달 --  순서5)  -->
					</td>
				</tr>
			</table>
		</form>
	</main>
	<script type="text/javascript">
function isValid(){
	let result = true // 유효성 검사 결과 저장
		const content = document.forms[0].content // input요소
		if(content.value == ''){
			alert('글 내용 작성은 필수 입니다.')
			result = false
			content.focus()
		}
	if(result){
		document.forms[0].submit()
	} /*유효성 검사를  위해서 저장 버튼 타입을 submit으로 두는 방법도 있습니다.
	 그럴 때는 form 태그에 onsubmit="return isValid() => isValid 함수 실행한 리턴이 true 일때만 submit 합니다. */
	}  
</script>
</body>
</html>

<!-- 
	이클립스에 ipv4로 처리되도록 톰캣 설정을 바꿉니다.
	request 객체로 remoteAddr 받을 때 기본 설정이 ipv6로 출력됩니다.
	변경방법 : Run Configurations -> 왼쪽 항목에서 Tomcat Server 클릭 -> Arguments 탭에서
			 ->  VM argument 문자열 맨 마지막에 다음 내용 작성. -Djava.net.preferIPv4Stack=true

 -->