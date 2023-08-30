<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>API 데이터 출력</title>
</head>
<h1>API 데이터 출력 예시</h1>
<button type="button" onclick="gotoBucket()">찜목록가기</button>
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

      for (let i = 0; i < items.length; i += 4) {
        infoHtml += '<tr>';
        for (let j = i; j < i + 4 && j < items.length; j++) {
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
            '<p><strong>종:</strong> ' +
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
  
  let itemsToBeAdded = []; // 선택한 아이템들을 저장할 배열
  let kinds = []; // 종 정보를 저장할 배열
  let colors = []; // 색 정보를 저장할 배열
  let specials = []; 
  
  function addToBucket(processState, kind, color, special, photo) {
	    if (confirm("이 아이가 맘에 드시나요?") == true) {
	        itemsToBeAdded.push({
	            processState: processState,
	            kind: kind,
	            color: color,
	            special: special,
	            photo: photo
	        });

	        // 추가로 kinds와 같은 필드도 저장
	        kinds.push(kind);
	        colors.push(color);
	        specials.push(special);
	    }
	}
  function gotoBucket() {
      // 선택한 아이템들을 bucket.jsp로 전송하는 로직 추가
      let form = document.createElement('form');
      form.method = 'POST';
      form.action = 'bucket.jsp';

      for (let item of itemsToBeAdded) {
          let photoField = document.createElement('input');
          photoField.type = 'hidden';
          photoField.name = 'photo';
          photoField.value = item.photo;
          form.appendChild(photoField);

          let statusField = document.createElement('input');
          statusField.type = 'hidden';
          statusField.name = 'processState';
          statusField.value = item.processState;
          form.appendChild(statusField);

          let colorField = document.createElement('input');
          colorField.type = 'hidden';
          colorField.name = 'color';
          colorField.value = item.color;
          form.appendChild(colorField);

          let kindField = document.createElement('input');
          kindField.type = 'hidden';
          kindField.name = 'kind';
          kindField.value = item.kind;
          form.appendChild(kindField);

          let specialField = document.createElement('input');
          specialField.type = 'hidden';
          specialField.name = 'special';
          specialField.value = item.special;
          form.appendChild(specialField);

          // 선택한 아이템들을 폼에 추가한 후에 제출
          document.body.appendChild(form);
          form.submit();
      }
  }
</script>
</body>
</html>