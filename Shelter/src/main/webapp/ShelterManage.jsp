<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보호소 동물정보 관리 페이지</title>
</head>
<h1>동물정보관리</h1>
<hr>
<form action="post">
<table>
  <tbody id="infoTable"></tbody>
</table>
</form>
<script type="text/javascript">
  const xhr = new XMLHttpRequest();
  // 요청 파라미터를 쿼리스트링으로 설정
  xhr.open(
    'GET',
    'http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?serviceKey=ne53vYZ%2FHctQxGJhVLlcKvtvzi%2FHNfY42exeWo4iiO%2FxrJTgFukzupa98bwUDM318BruDv8y8kWtQDh76hClvQ%3D%3D&_type=json&numOfRows=20'
  );
  xhr.send();
  xhr.onload = function () {
	  if (xhr.status == 200) {
	      let response = JSON.parse(xhr.response);
	      let dataContainer = document.getElementById('dataContainer');
	      let items = response.response.body.items.item;
	      let infoHtml = '';
	      for (let i = 0; i < items.length; i += 2) {
	          infoHtml += '<tr>';
	          for (let j = i; j < i + 2 && j < items.length; j++) {
	            let item = items[j];
	            let processState = item.processState;
	            let kind = item.kindCd;
	            let color = item.colorCd;
	            let special = item.specialMark;
	            let photo = item.popfile; // 사진 파일 URL

	            let modify = '수정하기';

	            infoHtml +=
		              '<td>' +
		              '<img src="' +
		              photo +
		              '" width="30%">' +
		              '</td>' +
		              '<td>' +
		              '<strong>상태:</strong> ' + processState + '<br>' +
		              '<strong>견종:</strong> ' + kind + '<br>' +
		              '<strong>색:</strong> ' + color + '<br>' +
		              '<strong>특이사항:</strong> ' + special + '<br>' +
		              '<button type="button" onclick="update(\'' +
		              processState +
		              "', '" +
		              kind +
		              "', '" +
		              color +
		              "', '" +
		              special +
		              "', '" +
		              photo +
		              "')\">" +
		              modify +
		              '</button>' +
		              '</td>';
		          }
		          infoHtml += '</tr>';
		        }

	        infoTable.innerHTML = infoHtml;

	      }
	    };
	    function update(processState,kind,color,special,photo){
	    	
	    	
	    	
	    	
	    }
	      
	  </script>
</body>
</html>