//함수 정의(화살표 함수)
const testKaKao = () => {
	//초창기 데이터 api가 XML 제공만 했으므로 이름에 XML 이 있습니다.
	const xhr = new XMLHttpRequest()
	//요청 파라미터를 쿼리스트링 즉 하나의 문자열로 만들기
	
let serviceKey = 'ne53vYZ%2FHctQxGJhVLlcKvtvzi%2FHNfY42exeWo4iiO%2FxrJTgFukzupa98bwUDM318BruDv8y8kWtQDh76hClvQ%3D%3D'
	let pageNo = 1
	let numOfRows = 20
	let _type = 'json'
	//요청 url 설정 : 요청 방식 메서드 GET(조회), POST(저장) 
	xhr.open('GET',
`http://apis.data.go.kr/1543061/abandonmentPublicSrvc/sido?query=${query}&sort=${numOfRows}&page=${pageNo}&size=${_type}`)
	
	//요청 헤더 항목을 추가. 카카오 api에서 정함. 인증과 관련된 항목
	xhr.setRequestHeader('Authorization','ne53vYZ%2FHctQxGJhVLlcKvtvzi%2FHNfY42exeWo4iiO%2FxrJTgFukzupa98bwUDM318BruDv8y8kWtQDh76hClvQ%3D%3D')
	
	//요청을 보내는 메서드 
	xhr.send()
	
	let result = ''
	//onload는 응답이 오면  발생하는 이벤트. 이벤트 처리 함수 정의합니다.
	xhr.onload = function(){
		//요청 처리 결과에 대한 상태 코드 값은 status 로 확인. 
		if(xhr.status == 200){
			alert('검색 응답을 받았습니다.')
			// xhr.resoponse는 응답으로 받은 내용 저장하는 프로퍼티 
			// xhr.response은 json 문자열
			let $response = JSON.parse(xhr.response) // 문자열을 자바스크립트 객체로 변환
			result = $response.documents //객체의 documents 프로퍼티만 변수에 저장 
		}// if end
		
		console.log(result) //콘솔에 출력
		
	} // xhr.onload function end
}// testKakao 함수 end


