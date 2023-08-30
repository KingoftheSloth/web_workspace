<%@page import="sample.dao.ProductDao"%>
<%@page import="sample.dto.ProductDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>uploadAction.jsp</title>
</head>
<body>
<!-- 처리기능  -->
<%
String path ="d:\\iclass0419\\upload";
int size = 10*1024*1024; // 파일 전송 용량 최대 크기

//파일업로드에서는 일반적인 request 가 아닌 MultipartRequest 를 사용합니다. 
//								--> 외부 라이브러리 필요합니다. 

MultipartRequest multiReqeust = new MultipartRequest(
		request, 				//원래의 요청 객체
		path, 					// 업로드 경로
		size,					// 파일 최대 크기
		"UTF-8",				// 파일명 인코딩
		new DefaultFileRenamePolicy() // 중복된 파일이름 변경 정책. 파일 중복시 기본정책은 번호 붙이기
		);
String pname = multiReqeust.getParameter("pname");
String price = multiReqeust.getParameter("price");
// 파일을 전송 받아 path 경로에 저장합니다.
String picture = multiReqeust.getFilesystemName("picture");


// 여기까지 실행된 결과 확인
out.println(pname);out.print("<br>");
out.println(price);out.print("<br>");
out.println(picture);out.print("<br>");


ProductDto dto = new ProductDto(pname, Integer.parseInt(price),null,picture);
ProductDao dao = ProductDao.getProductDao();
int result = dao.insert(dto);


%>
<script type = "text/javascript">
alert('상품 등록이 완료되었습니다.');
location.href="productListAction.jsp";
</script>
</body>
</html>