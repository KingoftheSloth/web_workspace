window.onload = function () {
    // 초기 페이지 로드 시 초기 상태 표시 및 데이터 로딩
    loadPageData(currentPage);
};

const xhr = new XMLHttpRequest();
const photoContainer = document.getElementById('photoContainer');
let itemsPerPage = 25;
let itemsPerRow = 5;
let totalRows = 4;
let currentPage = 1;
let items = []; // 데이터를 저장할 테이블

function loadPageData(page) {
    const today = new Date(); // 현재 날짜 가져오기
    const tenDaysAgo = new Date(today);
    tenDaysAgo.setDate(today.getDate() - 10); // 현재 날짜로부터 10일 전 계산

    // 날짜 포맷 YYYYMMDD로 변환
    const todayFormatted = formatDate(today);
    const tenDaysAgoFormatted = formatDate(tenDaysAgo);

    xhr.open(
        'GET',
        `http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?serviceKey=ne53vYZ%2FHctQxGJhVLlcKvtvzi%2FHNfY42exeWo4iiO%2FxrJTgFukzupa98bwUDM318BruDv8y8kWtQDh76hClvQ%3D%3D&_type=json&bgnde=${tenDaysAgoFormatted}&endde=${todayFormatted}&numOfRows=${itemsPerPage}&pageNo=${page}`
    );
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
                createPaginationButtons(totalCount);
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

function createPaginationButtons(totalCount) {
    const totalPages = Math.ceil(totalCount / itemsPerPage);
    const paginationContainer = document.getElementById('pagination');
    paginationContainer.innerHTML = '';

    const startPage = Math.max(1, currentPage - 3);
    const endPage = Math.min(totalPages, currentPage + 4);

    for (let i = startPage; i <= endPage; i++) {
        let pageButton = document.createElement('button');
        pageButton.innerText = i;
        pageButton.addEventListener('click', function () {
            currentPage = i;
            loadPageData(currentPage);
        });

        paginationContainer.appendChild(pageButton);
    }

    if (currentPage > 1) {
        let prevButton = document.createElement('button');
        prevButton.innerText = '이전 페이지';
        prevButton.addEventListener('click', function () {
            currentPage--;
            loadPageData(currentPage);
        });
        paginationContainer.appendChild(prevButton);
    }

    if (currentPage < totalPages) {
        let nextButton = document.createElement('button');
        nextButton.innerText = '다음 페이지';
        nextButton.addEventListener('click', function () {
            currentPage++;
            loadPageData(currentPage);
        });
        paginationContainer.appendChild(nextButton);
    }
}

function displayItems() {
    photoContainer.innerHTML = '';

    for (let row = 0; row < totalRows; row++) {
        let rowElement = document.createElement('div');
        rowElement.classList.add('photo-row');

        for (let i = 0; i < itemsPerRow; i++) {
            let itemIndex = (row * itemsPerRow) + i;
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
}

function displayInitialItems() {
    displayItems(); // 초기 페이지 로드 시 데이터 표시
}

