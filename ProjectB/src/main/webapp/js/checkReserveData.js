document.addEventListener("DOMContentLoaded", function () {
  const xhr = new XMLHttpRequest();
  xhr.open(
    'GET',
    'http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?serviceKey=ne53vYZ%2FHctQxGJhVLlcKvtvzi%2FHNfY42exeWo4iiO%2FxrJTgFukzupa98bwUDM318BruDv8y8kWtQDh76hClvQ%3D%3D&_type=json&numOfRows=24'
  );
  xhr.send();
  xhr.onload = function () {
    if (xhr.status == 200) {
      let response = JSON.parse(xhr.response);
      let items = response.response.body.items.item;

      let adoptElements = document.querySelectorAll('.adopt');
      adoptElements.forEach(function (element, index) {
        let desertionNo = element.getAttribute('data-desertion-no');
        let animalDetails = document.getElementById('animalDetails_' + desertionNo);
        let selectedItem = items.find(item => item.desertionNo === desertionNo);
        if (selectedItem) {
          const imageUrl = selectedItem.popfile;
          // 이미지를 불러오는데 성공한 경우
          if (imageUrl) {
            const htmlContent =
              "<p><img alt='' src='" + imageUrl + "' width='100' height='100'></p>";
            animalDetails.innerHTML = htmlContent;
            console.log(htmlContent)
          } else {
            // 이미지 URL이 없는 경우 사용자에게 알림
            const errorMessage = "이미지를 불러올 수 없습니다.";
            animalDetails.innerHTML = errorMessage;
             console.error(errorMessage);
          }
        }
      });
    }
  };
});
