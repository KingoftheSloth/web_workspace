<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=fd0458dd2581769bcd6f4a1afd2cc428&libraries=services"></script>
    <meta charset="utf-8"/>
    <title>Kakao 지도 시작하기</title>
</head>
<body>
    <div id="map" style="width:500px;height:400px;"></div>
    <script>
    var container = document.getElementById('map');
    var options = {
        center: new kakao.maps.LatLng(latitude,longitude),
        level: 3
    };

    var map = new kakao.maps.Map(container, options);
    
    var geocoder = new kakao.maps.services.Geocoder();
    var addr = '경기도 부천시 소사로 779 (원종동) 201호';

    var latitude = null; // 위도
    var longitude = null; // 경도
    
    var callback = function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            console.log(result);
        
             latitude = result[0].y; // 위도
             longitude = result[0].x; // 경도

            console.log("위도: " + latitude);
            console.log("경도: " + longitude);
        }
    };
    
    geocoder.addressSearch(addr, callback);
 
  
    </script>
</body>
</html>
