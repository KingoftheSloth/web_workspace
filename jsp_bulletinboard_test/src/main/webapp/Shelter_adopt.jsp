<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입양요청</title>
</head>
<body>
<h1>입양요청</h1>
<hr>
<div name="adopt">
<table>
<tr>사용자정보</tr><p>
<div name ="Adopter">
<table>
<th>이름</th><td><label><input type=text></label></td>
<th>전화번호</th><td><label><input type=text></label></td>
<th>입양경험</th><td><label><input type=text></label></td>
<th>반려동물보유</th><td><label><input type=text></label></td>
</table>
</div>
</p>
<tr>동물정보</tr><div name ="Adopted_animal"></div></p>
</table>
<label><input type="checkbox">예</label>
<label><input type="checkbox">아니오</label>
</div>
<button>예약하기</button>
</body>
</html>