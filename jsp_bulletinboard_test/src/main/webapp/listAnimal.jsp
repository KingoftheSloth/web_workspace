<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>API 데이터 출력</title>
</head>
<h1>API 데이터 출력 예시</h1>
<div id="infoContainer"></div>
<table>
  <tbody id="infoTable"></tbody>
</table>
<div id="dataContainer">
	<!-- 서버에서 받아온 데이터가 여기에 출력될 것입니다 -->
</div>
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
      let infoTable = document.getElementById('infoTable');
      let items = response.response.body.items.item;

      let infoHtml = '';

      for (let i = 0; i < items.length; i += 3) {
        infoHtml += '<tr>';
        for (let j = i; j < i + 3 && j < items.length; j++) {
          let item = items[j];
          let processState = item.processState;
          let kind = item.kindCd;
          let color = item.colorCd;
          let special = item.specialMark;
          let photo = item.popfile; // 사진 파일 URL

          let pick = '찜하기';

          infoHtml +=
            '<td>' +
            '<img src="' +
            photo +
            '" width="30%">' +
            '<p><strong>상태:</strong> ' +
            processState +
            '</p>' +
            '<p><strong>견종:</strong> ' +
            kind +
            '</p>' +
            '<p><strong>색:</strong> ' +
            color +
            '</p>' +
            '<p><strong>특이사항:</strong> ' +
            special +
            '</p>' +
            '<button type="button" onclick="addToBucket(\'' +
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
            pick +
            '</button>' +
            '</td>';
        }
        infoHtml += '</tr>';
      }

      infoTable.innerHTML = infoHtml;

      dataContainer.innerHTML = '<pre>' + JSON.stringify(response, null, 2) + '</pre>';
    }
  };
  
  function addToBucket(processState, kind, color, special, photo) {
	    // 폼 생성
	    let form = document.createElement('form');
	    form.method = 'POST';
	    form.action = 'bucket.jsp';

	    // 폼 필드 추가
	    let photoField = document.createElement('input');
	    photoField.type = 'hidden';
	    photoField.name = 'photo';
	    photoField.value = photo;
	    form.appendChild(photoField);
	    
	    let statusField = document.createElement('input');
	    statusField.type = 'hidden';
	    statusField.name = 'processState';
	    statusField.value = processState;
	    form.appendChild(statusField);

	    let kindField = document.createElement('input');
	    kindField.type = 'hidden';
	    kindField.name = 'kind';
	    kindField.value = kind;
	    form.appendChild(kindField);

	    let colorField = document.createElement('input');
	    colorField.type = 'hidden';
	    colorField.name = 'color';
	    colorField.value = color;
	    form.appendChild(colorField);

	    let specialField = document.createElement('input');
	    specialField.type = 'hidden';
	    specialField.name = 'special';
	    specialField.value = special;
	    form.appendChild(specialField);
	    
	    

	    // 폼 추가 후 제출
	    document.body.appendChild(form);
	    form.submit();
	  }
</script>
</body>
</html>