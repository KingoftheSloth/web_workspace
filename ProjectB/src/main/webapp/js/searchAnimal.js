const searchContainer = document.getElementById('searchContainer');
const searchKeyword = document.getElementById('searchInput').value; // 검색어 입력값 가져오기
const searchResult = [];
const searchCondition = document.getElementById('searchCondition'); // 선택된 검색 조건 가져오기

// 검색 버튼 클릭 시 호출되는 함수

function searchAnimals() {
	const searchKeyword = document.getElementById('searchInput').value; // 검색어 입력값 가져오기
	searchResult.length = 0; // 검색 결과 배열 초기화
	// 검색 결과를 저장할 배열
	// items 배열을 순회하면서 검색어와 일치하는 항목 찾기
	for (let i = 0; i < items.length; i++) {
		const item = items[i];
		if (searchCondition.value === 'kindCd' && item.kindCd.includes(searchKeyword)) {
			searchResult.push(item); // 지역으로 검색
		} else if (searchCondition.value === 'careAddr' && item.careAddr.includes(searchKeyword)){
			searchResult.push(item); // 무게로 검색
		} else if (searchCondition.value === 'age' && item.age.includes(searchKeyword.replace(/[()]/g, '').trim())) {
			console.log(item);
			searchResult.push(item); // 나이로 검색
		}
	}
	console.log(searchResult.length);
	if (searchResult.length === 0) {
		alert('조건에 맞는 동물을 찾지 못했습니다.');
		console.log('조건에 맞는 동물을 찾지 못했습니다.');
		console.log(searchResult)
		displayInitialItems(); // 초기 리스트 표시
        return; 
	}
	displaySearchResults(searchResult);
	photoContainer.style.display = 'none';
}

// 검색 결과를 화면에 표시하는 함수
function displaySearchResults(results) {
	searchContainer.innerHTML = ''; // 기존 내용 지우기

	// 검색 결과를 표시
	for (let row = 0; row < totalRows; row++) {
		let rowElement = document.createElement('div');
		rowElement.classList.add('photo-row');

		for (let i = 0; i < itemsPerRow; i++) {
			let itemIndex = (row * itemsPerRow) + i;
			if (itemIndex < results.length) {
				let item = results[itemIndex];
				let photoUrl = item.popfile;
				let imgElement = document.createElement('img');
				imgElement.src = photoUrl;
				imgElement.width = 100;
				imgElement.height = 100;
				imgElement.classList.add('pointer-cursor');

				let linkElement = document.createElement('a');
				linkElement.href = 'javascript:animalDetail("' + item.desertionNo + '")';
				linkElement.appendChild(imgElement);
				rowElement.appendChild(linkElement);

				imgElement.addEventListener('click', function() {
					console.log(item);
				});
			}else {
                break;
            }
		}

		searchContainer.appendChild(rowElement);
	}
}

// 검색 버튼 클릭 이벤트 처리
const searchButton = document.getElementById('searchButton');
searchButton.addEventListener('click', searchAnimals);

