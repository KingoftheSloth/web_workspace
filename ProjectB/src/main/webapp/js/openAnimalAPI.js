let initialUrl;

window.onload = function () {
    // 초기 페이지 로드 시 초기 상태 표시 및 데이터 로딩
    loadPageData(1);
    // 초기 URL을 저장
    initialUrl = `http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?serviceKey=ne53vYZ%2FHctQxGJhVLlcKvtvzi%2FHNfY42exeWo4iiO%2FxrJTgFukzupa98bwUDM318BruDv8y8kWtQDh76hClvQ%3D%3D&_type=json&bgnde=${tenDaysAgoFormatted}&endde=${todayFormatted}&numOfRows=${itemsPerPage}`;
};

const xhr = new XMLHttpRequest();
const photoContainer = document.getElementById('photoContainer');
let itemsPerPage = 25;
let itemsPerRow = 5;
let totalRows = 4;
let todayFormatted;
let tenDaysAgoFormatted;
let items = []; // 데이터를 저장할 테이블
let url; // URL 변수를 선언

function loadPageData(page,url) {
    if(page==null || page=='' )
		page = 1;
    const today = new Date(); // 현재 날짜 가져오기
    const tenDaysAgo = new Date(today);
    tenDaysAgo.setDate(today.getDate() - 10); // 현재 날짜로부터 10일 전 계산

    // 날짜 포맷 YYYYMMDD로 변환
    todayFormatted = formatDate(today);
    tenDaysAgoFormatted = formatDate(tenDaysAgo);
    
    // URL을 동적으로 생성합니다.
    if(url==null || url=='')
    url = `http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?serviceKey=ne53vYZ%2FHctQxGJhVLlcKvtvzi%2FHNfY42exeWo4iiO%2FxrJTgFukzupa98bwUDM318BruDv8y8kWtQDh76hClvQ%3D%3D&_type=json&bgnde=${tenDaysAgoFormatted}&endde=${todayFormatted}&numOfRows=${itemsPerPage}&pageNo=${page}`;
    
    xhr.open('GET', url);
    xhr.send();
    xhr.onload = function () {
        if (xhr.status == 200) {
            let response = JSON.parse(xhr.response);
            if (response.response.body && response.response.body.items && response.response.body.items.item) {
                items = response.response.body.items.item;
                const totalCount = response.response.body.totalCount;
                console.log('10일간의 데이터 수:', totalCount);
                displayInitialItems();
                // 페이지를 추가하는 버튼을 생성합니다.
            } else {
                console.log('API로부터 데이터가 비어 있습니다.');
            }
        }
    };
}
function formatDate(date) {
    const year = date.getFullYear();
    const month = (date.getMonth() + 1).toString().padStart(2, '0');
    const day = date.getDate().toString().padStart(2, '0');
    return `${year}${month}${day}`;
}


function displayItems() {
    photoContainer.innerHTML = '';

    for (let row = 0; row < totalRows; row++) {
        let rowElement = document.createElement('div');
        rowElement.classList.add('photo-row');

        for (let i = 0; i < itemsPerRow; i++) {
            let itemIndex = (row * itemsPerRow) + i;0
            if (itemIndex < items.length) {
                let item = items[itemIndex];
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

                imgElement.addEventListener('click', function () {
                    console.log(item);
                });
            }
        }

        photoContainer.appendChild(rowElement);
    }
     document.getElementById('searchResultsContainer').appendChild(photoContainer);
}

function displayInitialItems() {
    displayItems(); // 초기 페이지 로드 시 데이터 표시
}



function prevPageData(){
	const page = document.getElementById("page")
	page.innerHTML = page.innerHTML - 1
	loadPageData(page.innerHTML);
}

function nextPageData() {
    let page = document.getElementById("page");
    const kindRadio = document.querySelector('input[name="animalType"]:checked');

    if (kindRadio) {
        const kindValue = kindRadio.value;

        // 현재 선택한 동물 종류에 따라 kind 값을 설정합니다.
        let kindCode;
        if (kindValue === "개") {
            kindCode = dogCode;
            page.innerHTML = 1;
        } else if (kindValue === "고양이") {
            kindCode = catCode;
            page.innerHTML = 1;
        } else {
            kindCode = otherCode;
            page.innerHTML = 1;
        }

        // URL을 동적으로 생성합니다.
        const newUrl = `http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?serviceKey=ne53vYZ%2FHctQxGJhVLlcKvtvzi%2FHNfY42exeWo4iiO%2FxrJTgFukzupa98bwUDM318BruDv8y8kWtQDh76hClvQ%3D%3D&_type=json&bgnde=${tenDaysAgoFormatted}&endde=${todayFormatted}&numOfRows=${itemsPerPage}&pageNo=${Number(page.innerHTML) + 1}&upkind=${kindCode}`;

        // 수정된 URL로 데이터를 로드합니다.
        page.innerHTML = Number(page.innerHTML) + 1
        loadPageData(Number(page.innerHTML) + 1, newUrl);
    }
}


const catCode = 422400;
const dogCode = 417000;
const otherCode = 429900; 

document.getElementById('searchButton').addEventListener('click', function () {
        // 라디오 버튼에서 선택한 동물의 종류에 따라 kind 값을 설정합니다.
   let kindCode;
    if (document.getElementById('catRadio').checked) {
        kindCode = catCode;
    } else if (document.getElementById('dogRadio').checked) {
        kindCode = dogCode;
    } else {
        kindCode = otherCode;
    }
    // URL을 동적으로 생성합니다.
    initialUrl = `http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?serviceKey=ne53vYZ%2FHctQxGJhVLlcKvtvzi%2FHNfY42exeWo4iiO%2FxrJTgFukzupa98bwUDM318BruDv8y8kWtQDh76hClvQ%3D%3D&_type=json&bgnde=${tenDaysAgoFormatted}&endde=${todayFormatted}&numOfRows=${itemsPerPage}`;
  	
  	let page = 1;
  	url = initialUrl + `&pageNo=${page}&upkind=${kindCode}`;
    // 수정된 URL로 데이터를 로드합니다.
    loadPageData(1,url);
});
