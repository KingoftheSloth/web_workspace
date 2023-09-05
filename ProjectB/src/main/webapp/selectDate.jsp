<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문예약하기</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String desertionNo = request.getParameter("desertionNo");
%>

<p id=careAddr>보호소 위치: </p>
<p>전달받은 동물 유기번호: <%= desertionNo %></p>
<form action="SaveToDB.jsp" method="post">
    <input type="hidden" name="desertionNo" value="<%= desertionNo %>">
    <label for="selectedDate">날짜 선택:</label>
    <input type="date" id="selectedDate" name="selectedDate">
    <button>저장하기</button>
</form>
</body>
<script type="text/javascript">
var desertionNo = '<%= request.getParameter("desertionNo") %>';
console.log(desertionNo);
const xhr = new XMLHttpRequest();
xhr.open(
  'GET',
  'http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?serviceKey=ne53vYZ%2FHctQxGJhVLlcKvtvzi%2FHNfY42exeWo4iiO%2FxrJTgFukzupa98bwUDM318BruDv8y8kWtQDh76hClvQ%3D%3D&_type=json&numOfRows=24'
);
xhr.send();
xhr.onload = function () {
    if (xhr.status === 200) {
        const response = JSON.parse(xhr.responseText);
        const items = response.response.body.items.item;
        const selectedItem = items.find(item => item.desertionNo ===  desertionNo);
        console.log(selectedItem)
        const careAddr = selectedItem.careAddr 
        if (selectedItem) {
        	const careAddrElement = document.getElementById('careAddr');
            careAddrElement.innerHTML = "보호소 위치: " + careAddr;
            
            console.log("보호소 위치: " + careAddr);
        }
        else {
        	alert("현재 입양가능한 상태가 아닙니다.");
            console.log("해당 동물 정보를 찾을 수 없습니다.");
        }
    }
};

</script>
</html>