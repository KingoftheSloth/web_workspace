<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
button {
	background-color: tomato;
	color:white;
	border: none;
	border-radius: 3px;
	padding : 5px;
}
</style>
</head>
<body>  <!-- GET 방식 : form  태그로 요청 보내기   -->
		<form action="">  <!-- action 속성값이 없을때 결과는??  현재 url -->
			<input name="type" type="hidden" value="${type}">   <!-- 기호 는 애트리뷰트 출력 -->
			<input name="searchtext" value="${search}">
			<button>검색하기</button>
		</form><br>
		<!-- GET 방식 : 자바스크립트에서 location.href 로 요청 전달합니다. -->
		<button class="search">전체</button>  <!-- type 값은  -->
		<button class="search">예매</button>  <!-- type 값은  -->
		<button class="search">결제</button>  <!-- type 값은  -->
		<button class="search">멤버십</button> <!-- type 값은  -->
		<button class="search">할인</button>  <!-- type 값은  -->
		<hr>
		<p>카테고리 type=${type} , 검색어 searchtext=${search}  조회 됩니다.</p>
<script type="text/javascript">
const frm = document.forms[0]
console.log(document.querySelectorAll(".search"))
//search class 버튼 모두 가져오기:배열		//  버튼태그한개 , 버튼의 위치
document.querySelectorAll(".search").forEach((btn,index)=>{
	btn.type='button'
	console.log(btn)
	console.log(index)
	let typeV
	btn.addEventListener('click',()=>{
		switch(index){
			case 0: typeV=1; break;
			case 1: typeV=2; break;
			case 2: typeV=3; break;
			case 3: typeV=4; break;
			case 4: typeV=5; break;
		}
		frm.type.value=typeV
		const searchV=frm.searchtext.value
		//get 요청 보내기.? 앞에 생략된 url 현재 url 과 동일함. 
		location.href='?type='+typeV+'&searchtext='+searchV     /* ?앞에 없으면 현재 url */
		
	})
})
/*  jsp 파일 ->  .java 파일로 변환  ->  .class로 변환되고 여기서 PrintWriter로 document 생성하고 응답*/



</script>		
		
		
</body>
</html>