<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
<%
  request.setCharacterEncoding("UTF-8");
%>

<h1>나의 PICK 목록</h1>
<table>
  <tr>
    <th>사진</th>
    <th>상태</th>
    <th>견종</th>
    <th>색</th>
    <th>특이사항</th>
  </tr>
  <tr>
    <td id="photoCell"></td>
    <td>${param.processState }</td>
    <td>${param.kind }</td>
    <td>${param.color }</td>
    <td>${param.special }</td>
  </tr>
</table>
<button>입양신청하기</button>
<button>취소하기</button>
<script type="text/javascript">
var photo = "${param.photo}";
var status = "${param.processState}";
var kind = "${param.kind}";
var color = "${param.color}";
var special = "${param.special}";

var photoCell = document.getElementById("photoCell");
var imgTag = document.createElement("img");
imgTag.src = photo;
imgTag.width = "100";
photoCell.appendChild(imgTag);

console.log("${param.processState}");
</script>
</html>