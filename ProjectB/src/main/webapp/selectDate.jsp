<%@page import="projectB.dto.Animal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문예약하기</title>
</head>
<body>
<%
// 세션에서 변수 읽기
Animal animal = (Animal) session.getAttribute("Animal");

// 변수가 null인지 확인하고 사용
String desertionNo = "";
String age = "";
String careAddr = "";
String careNm = "";
String filename= "";

if (animal != null) {
    desertionNo = animal.getDesertionNo();
    age = animal.getAge();
    careAddr = animal.getCareAddr();
    careNm = animal.getCareNm();
    filename = animal.getFilename();
    // 이하 변수들을 사용하십시오.
} else {
   out.print("오류");
}
%>

<p>동물 번호: <%= desertionNo %></p>
<p>보호소 주소: <%= careAddr %></p>
<p>보호소 이름: <%= careNm %></p>

<div id="map" style="width:550px;height:350px;"></div>
    
<!-- selectedItem 정보를 파라미터로 전달 -->
<form action="SaveToDB.jsp" method="post">
    <input type="hidden" name="desertionNo" value=<%= desertionNo %>>
    <input type="hidden" name="careAddr" value=<%= careAddr %>>
    <input type="hidden" name="filename" value=<%= filename %>>
    
    <!-- selectedItem 정보를 추가 -->
    
    <label for="selectedDate">날짜 선택:</label> <input type="date" id="selectedDate" name="selectedDate">
    <button>저장하기</button>
</form>
</body>
<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=fd0458dd2581769bcd6f4a1afd2cc428&libraries=services"></script>
	<script>
		var geocoder = new kakao.maps.services.Geocoder();
	    var addr = '<%= careAddr %>';
	    var latitude = null; // 위도
	    var longitude = null; // 경도
	    
	    var callback = function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	            console.log(result);
	        
	             latitude = result[0].y; // 위도
	             longitude = result[0].x; // 경도

	        }
	    };
	    
	    geocoder.addressSearch(addr, function(result, status) {

	        // 정상적으로 검색이 완료됐으면
	        if (status === kakao.maps.services.Status.OK) {
	          var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	          // 결과값으로 받은 위치를 마커로 표시합니다
	          var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	          });

	          // 인포윈도우로 장소에 대한 설명을 표시합니다
	          var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%= careNm %></div>'
	          });
	          infowindow.open(map, marker);

	          // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	          map.setCenter(coords);
	        }
	      });

        var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		var mapOption = {
		        center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
		        level: 4, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
	</script>
</html>
