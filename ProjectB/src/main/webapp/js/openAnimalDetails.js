function animalDetail(desertionNo) {
	const animalDetails = document.getElementById('animalDetails');
	animalDetails.innerHTML = '';

	for (let i = 0; i < items.length; i++) {
		if (items[i].desertionNo === desertionNo) {
			const selectedItem = items[i];
			sessionStorage.setItem('selectedItem', JSON.stringify(selectedItem));
			// selectedItem을 사용하여 동물 정보를 동적으로 생성
			if (selectedItem) {
				const animalDetails = document.getElementById('animalDetails');
				animalDetails.classList.add('row'); // Bootstrap 그리드 컨테이너로 설정
				animalDetails.style.borderBottom = '1px solid black';

				// 이미지 표시 부분 (왼쪽에 배치)
				const imageContainer = document.createElement('div');
				imageContainer.classList.add('col-md-6', 'order-mb-4'); // Bootstrap 그리드 클래스 및 순서 설정
				imageContainer.style.position = 'relative';

				const image = document.createElement('img');
				image.src = selectedItem.popfile;
				image.alt = '동물 이미지';
				image.setAttribute('id', 'img');
				image.width = '650';
				image.height = '520';
				imageContainer.appendChild(image);

				const rotateButton = document.createElement('button');
				rotateButton.textContent = "90°";
				rotateButton.setAttribute('id', 'rotate');
				rotateButton.classList.add("btn", "btn-dark");
				rotateButton.style.position = 'absolute';
				rotateButton.style.border = 'none';
				rotateButton.style.width = '66px';
				rotateButton.style.top = '93%';
				rotateButton.style.left = '89%';
				rotateButton.onclick = rotate;
				imageContainer.appendChild(rotateButton);

				const icon = document.createElement('i');
				icon.classList.add("bi", "bi-arrow-clockwise");
				rotateButton.appendChild(icon);

				// 동물 상세 정보 부분 (오른쪽에 배치)
				const infoContainer = document.createElement('div');
				infoContainer.classList.add('col-md-6', 'order-mb-4'); // Bootstrap 그리드 클래스 및 순서 설정
				infoContainer.style.width = '500px';
				infoContainer.style.marginLeft = '100px';
				infoContainer.style.fontFamily = 'Arial, Helvetica, sans-serif';

				const htmlContent = "<h2>상세프로필</h2>" +
					"<p>유기번호: " + selectedItem.desertionNo + "</p>" +
					"<p>나이: " + selectedItem.age + "</p>" +
					"<p>발생일자: " + selectedItem.happenDt + "</p>" +
					"<p>품종: " + selectedItem.kindCd + "</p>" +
					"<p>중성화여부: " + selectedItem.neuterYn + "</p>" +
					"<p>특이사항: " + selectedItem.specialMark + "</p>" +
					"<p>무게: " + selectedItem.weight + "</p>" +
					"<p>보호소이름: " + selectedItem.careNm + "</p>" +
					"<p>보호소주소: " + selectedItem.careAddr + "</p>" +
					"<p>보호소전화: " + selectedItem.careTel + "</p>";

				infoContainer.innerHTML = htmlContent;

				// "입양신청하기" 버튼 추가
				const adoptButton = document.createElement('button');
				adoptButton.textContent = "입양신청하기";
				adoptButton.classList.add("btn", "btn-outline-success", "mx-5"); // Bootstrap 버튼 클래스 추가
				adoptButton.type = "button";
				adoptButton.onclick = adoptAnimal; // 버튼 클릭 시 adoptAnimal 함수 실행
				infoContainer.appendChild(adoptButton);

				// "뒤로가기" 버튼 추가
				const goBackButton = document.createElement('button');
				goBackButton.textContent = "뒤로가기";
				goBackButton.classList.add("btn", "btn-outline-danger"); // Bootstrap 버튼 클래스 추가
				goBackButton.type = "button";
				goBackButton.onclick = goBack; // 버튼 클릭 시 goBack 함수 실행
				infoContainer.appendChild(goBackButton);

				// 이미지와 정보 컨테이너를 추가
				/*animalDetails.innerHTML = ''; // 기존 내용 초기화*/
				animalDetails.appendChild(imageContainer);
				animalDetails.appendChild(infoContainer);

				window.scrollTo(0, 0);
				// 입양 신청 시 필요한 정보를 세션에 저장
			} else {
				// 해당 동물 정보가 없는 경우 처리
				const animalDetails = document.getElementById('animalDetails');
				animalDetails.innerHTML = "<p>해당하는 동물 정보가 없습니다.</p>";
			}

			break;
		}
	}
}


function adoptAnimal() {
	// 세션에 저장한 데이터 불러오기
	const selectedItemJSON = sessionStorage.getItem('selectedItem');
	console.log(selectedItemJSON);
	if (selectedItemJSON) {
		const selectedItem = JSON.parse(selectedItemJSON);

		// form 엘리먼트를 생성합니다.
		const form = document.createElement('form');
		form.action = 'saveToSession.jsp'; // 데이터를 전송할 서버 스크립트 URL을 지정합니다.
		form.method = 'POST'; // HTTP POST 메소드를 사용합니다. 

		// 필요한 정보를 <input> 요소로 추가합니다.
		const desertionNoInput = document.createElement('input');
		desertionNoInput.type = 'hidden'; // 숨김 필드로 설정합니다.
		desertionNoInput.name = 'desertionNo'; // 서버 스크립트에서 사용할 필드명을 지정합니다.
		desertionNoInput.value = selectedItem.desertionNo; // 값을 설정합니다.
		form.appendChild(desertionNoInput);

		const careNmInput = document.createElement('input');
		careNmInput.type = 'hidden';
		careNmInput.name = 'careNm';
		careNmInput.value = selectedItem.careNm;
		form.appendChild(careNmInput);

		const careAddrInput = document.createElement('input');
		careAddrInput.type = 'hidden';
		careAddrInput.name = 'careAddr';
		careAddrInput.value = selectedItem.careAddr;
		form.appendChild(careAddrInput);

		const popfileInput = document.createElement('input');
		popfileInput.type = 'hidden';
		popfileInput.name = 'popfile';
		popfileInput.value = selectedItem.popfile;
		form.appendChild(popfileInput);

		const ageInput = document.createElement('input');
		ageInput.type = 'hidden';
		ageInput.name = 'age';
		ageInput.value = selectedItem.age;
		form.appendChild(ageInput);

		const careTelInput = document.createElement('input');
		careTelInput.type = 'hidden';
		careTelInput.name = 'careTel';
		careTelInput.value = selectedItem.careTel;
		form.appendChild(careTelInput);

		const chargeNmInput = document.createElement('input');
		chargeNmInput.type = 'hidden';
		chargeNmInput.name = 'chargeNm';
		chargeNmInput.value = selectedItem.chargeNm;
		form.appendChild(chargeNmInput);

		const filenameInput = document.createElement('input');
		filenameInput.type = 'hidden';
		filenameInput.name = 'filename';
		filenameInput.value = selectedItem.filename;
		form.appendChild(filenameInput);

		const happenDtInput = document.createElement('input');
		happenDtInput.type = 'hidden';
		happenDtInput.name = 'happenDt';
		happenDtInput.value = selectedItem.happenDt;
		form.appendChild(happenDtInput);

		const processStateInput = document.createElement('input');
		processStateInput.type = 'hidden';
		processStateInput.name = 'processState';
		processStateInput.value = selectedItem.processState;
		form.appendChild(processStateInput);

		const kindCdInput = document.createElement('input');
		kindCdInput.type = 'hidden';
		kindCdInput.name = 'kindCd';
		kindCdInput.value = selectedItem.kindCd;
		form.appendChild(kindCdInput);

		const neuterYnInput = document.createElement('input');
		neuterYnInput.type = 'hidden';
		neuterYnInput.name = 'neuterYn';
		neuterYnInput.value = selectedItem.neuterYn;
		form.appendChild(neuterYnInput);

		const noticeEdtInput = document.createElement('input');
		noticeEdtInput.type = 'hidden';
		noticeEdtInput.name = 'noticeEdt';
		noticeEdtInput.value = selectedItem.noticeEdt;
		form.appendChild(noticeEdtInput);

		const noticeSdtInput = document.createElement('input');
		noticeSdtInput.type = 'hidden';
		noticeSdtInput.name = 'noticeSdt';
		noticeSdtInput.value = selectedItem.noticeSdt;
		form.appendChild(noticeSdtInput);

		const officetelInput = document.createElement('input');
		officetelInput.type = 'hidden';
		officetelInput.name = 'officetel';
		officetelInput.value = selectedItem.officetel;
		form.appendChild(officetelInput);

		const orgNmInput = document.createElement('input');
		orgNmInput.type = 'hidden';
		orgNmInput.name = 'orgNm';
		orgNmInput.value = selectedItem.orgNm;
		form.appendChild(orgNmInput);

		const sexCdInput = document.createElement('input');
		sexCdInput.type = 'hidden';
		sexCdInput.name = 'sexCd';
		sexCdInput.value = selectedItem.sexCd;
		form.appendChild(sexCdInput);

		const specialMarkInput = document.createElement('input');
		specialMarkInput.type = 'hidden';
		specialMarkInput.name = 'specialMark';
		specialMarkInput.value = selectedItem.specialMark;
		form.appendChild(specialMarkInput);


		const weightInput = document.createElement('input');
		weightInput.type = 'hidden';
		weightInput.name = 'weight';
		weightInput.value = selectedItem.weight;
		form.appendChild(weightInput);

		// 폼을 현재 페이지에 추가하고 자동으로 제출합니다.
		document.body.appendChild(form);
		form.submit();
		console.log(selectedItem);
	} else {
		console.log('세션 데이터가 없습니다.');
	}
}
function goBack() {
	const animalDetails = document.getElementById('animalDetails');
	animalDetails.innerHTML = '';
	animalDetails.style.border = "none"; // border를 제거하는 스타일 추가
}



let isClicked = false;

function rotate() {
	const img = document.getElementById("img");

	if (!isClicked) {
		img.style.transform = "rotate(90deg)";
		isClicked = true;
	} else {
		img.style.transform = "rotate(0deg)";
		isClicked = false;
	}
}
