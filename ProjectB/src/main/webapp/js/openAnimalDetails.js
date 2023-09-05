function animalDetail(desertionNo) {
    for (let i = 0; i < items.length; i++) {
        if (items[i].desertionNo === desertionNo) {
            const selectedItem = items[i];

            // selectedItem을 사용하여 동물 정보를 동적으로 생성
            if (selectedItem) {
                const htmlContent = "<h2>동물 정보</h2>" +
                    "<p><img alt='' src='" + selectedItem.popfile + "' width='200' height='200'></p>" +
                    "<p>유기번호: " + selectedItem.desertionNo + "</p>" +
                    "<p>나이: " + selectedItem.age + "</p>" +
                    "<p>보호소이름: " + selectedItem.careNm + "</p>" +
                    "<p>보호소전화: " + selectedItem.careTel + "</p>" +
                    "<p>발생일자: " + selectedItem.happenDt + "</p>" +
                    "<p>품종: " + selectedItem.kindCd + "</p>" +
                    "<p>중성화여부: " + selectedItem.neuterYn + "</p>" +
                    "<p>특이사항: " + selectedItem.specialMark + "</p>" +
                    "<p>무게: " + selectedItem.weight + "</p>";

                // 결과를 Check 요소에 동적으로 추가
                const animalDetails = document.getElementById('animalDetails');
                animalDetails.innerHTML = htmlContent;

                // "입양신청하기" 버튼 추가
                const adoptButton = document.createElement('button');
                adoptButton.textContent = "입양신청하기";
                adoptButton.onclick = adoptAnimal; // 버튼 클릭 시 adoptAnimal 함수 실행
                animalDetails.appendChild(adoptButton);

                function adoptAnimal() {
                    const desertionNo = selectedItem.desertionNo;
                   location.href = './account/adoptreq.jsp?desertionNo=' + desertionNo;
                }

                // "뒤로가기" 버튼 추가
                const goBackButton = document.createElement('button');
                goBackButton.textContent = "뒤로가기";
                goBackButton.onclick = goBack; // 버튼 클릭 시 goBack 함수 실행
                animalDetails.appendChild(goBackButton);
            } else {
                // 해당 동물 정보가 없는 경우 처리
                const animalDetails = document.getElementById('animalDetails');
                animalDetails.innerHTML = "<p>해당하는 동물 정보가 없습니다.</p>";
            }

            break;
        }
    }
}

function goBack() {
    const animalDetails = document.getElementById('animalDetails');
    animalDetails.innerHTML = '';
}
