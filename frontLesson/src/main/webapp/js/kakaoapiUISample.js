/**
 * 
 */
 const testKaKao = () => {
	//초창기 데이터 api가 XML 제공만 했으므로 이름에 XML 이 있습니다.
	const xhr = new XMLHttpRequest()
	//요청 파라미터를 쿼리스트링 즉 하나의 문자열로 만들기
	let query = document.getElementById('query').value
	let page = document.getElementById('pageno').value
	let size = document.getElementById('size').value
	let sort = document.getElementById('accuracy').checked
	if(sort) //true 또는 false => 즉 boolean 타입 
	sort = 'accuracy'
	else
	sort = 'recency'
	
	//'recency' //accuracy recency
	
	//요청 url 설정 : 요청 방식 메서드 GET(조회), POST(저장) 
	xhr.open('GET',
`https://dapi.kakao.com/v2/search/vclip?query=${query}&sort=${sort}&page=${page}&size=${size}`)
	//요청 헤더 항목을 추가. 카카오 api에서 정함. 인증과 관련된 항목
	xhr.setRequestHeader('Authorization','KakaoAK e89de735ea1698bf1d0d81cfe14aec48')
	//요청을 보내는 메서드 
	xhr.send()
	let result = ''
	//onload는 응답이 오면  발생하는 이벤트. 이벤트 처리 함수 정의합니다.
	let $response
	xhr.onload = function(){
		//요청 처리 결과에 대한 상태 코드 값은 status 로 확인. 
		if(xhr.status == 200){
			alert('kakao 검색 응답을 받았습니다.')
			// xhr.resoponse는 응답으로 받은 내용 저장하는 프로퍼티 
			// xhr.response은 json 문자열
			$response = JSON.parse(xhr.response) // 문자열을 자바스크립트 객체로 변환
			console.log('응답 받은 전체 값 :')
			console.log($response)
			
			result = $response.documents //객체의 documents 프로퍼티만 변수에 저장 
		}// if end
		console.log('documents 프로퍼티')
		console.log(result) //콘솔에 출력
		//result를 화면에 목록으로 보여주기. item 매개변수는 배열 요소를 순차적으로 저장.
		
		document.getElementById('list').innerHTML=''
		
		
		result.forEach((item)=>{
			const $ul = document.createElement('ul')
			const temp = `
			<li>${item.author}</li>
			<li>${item.title}</li>
			<li>${item.play_time}</li>
			<li>${item.datetime}</li>
			<li><a href='${item.url}' target='_blank'>
			<img src='${item.thumbnail}' width='200px'></a>
			</li>
			`
			
			$ul.innerHTML=temp
			document.getElementById('count').innerHTML = $response.meta.total_count
			document.getElementById('page_count').innerHTML = $response.meta.pageable_count
			document.getElementById('list').appendChild($ul)
		})
	} // xhr.onload function end
}// testKakao 함수 end

document.getElementById('search').addEventListener('click',testKaKao)






