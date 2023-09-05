<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdoptReq</title>

</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String desertionNo = request.getParameter("desertionNo");
%>
<!-- 동물번호 전달 -->
<input type="hidden" value=<%=desertionNo%> id="desertionNo">
<h3>1차 입양조건 검사</h3>
<form action="">

<div>
<p>1. 반려동물 주 보호자의 나이는 몇살입니까?</p>
<input type="number" name="age">
</div>

<div>
<p>2. 현재 직업이 있습니까?</p>
<input type="radio" name="job" id="havejob" value="yes">
<label for="havejob">예</label>
<input type="radio" name="job" id="uhavejob" value="no">
<label for="uhavejob">아니오</label>
</div>
<!-- 현재직업 '아니오' 시 나타남 -->
<div id="hd1" style="display: none;">
<p>2-1. 모아둔 돈이 있거나 취업할 예정이 있습니까?</p>
<input type="radio" name="hvjob" id="hd1-1" value="yes">
<label for="hd1-1">예</label>
<input type="radio" name="hvjob" id="hd1-2" value="no">
<label for="hd1-2">아니오</label>
</div>

<div>
<p>3. 주 보호자의 월 소득은 어떤 수준입니까? </p>
<input type="radio" name="money" id="nomoney" value="0">
<label for="nomoney">수입 없음</label>
<input type="radio" name="money" id="hundred" value="100">
<label for="hundred">100만원</label>
<input type="radio" name="money" id="twohundred" value="200">
<label for="twohundred">200만원</label>
<input type="radio" name="money" id="trhundred" value="300">
<label for="trhundred">300만원</label>
<input type="radio" name="money" id="uphundred" value="up">
<label for="uphundred">300 이상</label>
</div>

<div>
<p>4. 동물에 대한 어떤 알레르기라도 있으십니까?</p>
<input type="radio" name="allergy" id="yallergy" value="yes">
<label for="yallergy">예</label>
<input type="radio" name="allergy" id="nallergy" value="no">
<label for="nallergy">아니오</label>
</div>

<div>
<p>5. 가족구성원이 어떻게 되십니까?</p>
<input type="checkbox" id="alone" name="family" value="alone">
<label for="alone">자취</label>
<input type="checkbox" id="parent" name="family" value="parent">
<label for="parent">부모님</label>
<input type="checkbox" id="marry" name="family" value="marry">
<label for="marry">배우자</label>
<input type="checkbox" id="child" name="family" value="child">
<label for="child">자식</label>
</div>

<div id="hd2" style="display: none;">
<p>5-1-1. 가족구성원들의 동의를 모두 받았습니까?</p>
<input type="radio" name="agree" id="yagree" value="all">
<label for="yagree">모두동의</label>
<input type="radio" name="agree" id="hagree" value="half">
<label for="hagree">부분동의</label>
<input type="radio" name="agree" id="nagree" value="no">
<label for="nagree">모두반대</label>
</div>

<div id="hd3" style="display: none;">
<p>5-1-2. 가족구성원이 동물에 대한 어떤 알레르기라도 있으십니까?</p>
<input type="radio" name="fallergy" id="fyallergy" value="yes">
<label for="fyallergy">예</label>
<input type="radio" name="fallergy" id="fnallergy" value="no">
<label for="fnallergy">아니오</label>
</div>

<div id="hd4" style="display: none;">
<p>5-2-1. 현재 자식 중, 가장 어린 자식의 나이는 몇살입니까?</p>
<input type="number" name="cage">
</div>

<p>6. 하루에 몇시간 이상씩 집을 비우십니까? </p>
<input type="radio" name="leave" id="noleave" value="0">
<label for="noleave">안비움</label>
<input type="radio" name="leave" id="ohleave" value="1">
<label for="ohleave">1시간</label>
<input type="radio" name="leave" id="thleave" value="2">
<label for="thleave">2시간</label>
<input type="radio" name="leave" id="fhleave" value="4">
<label for="fhleave">4시간</label>
<input type="radio" name="leave" id="ehleave" value="8">
<label for="ehleave">8시간</label>

<div>
<p>7. 하루 이상 집을 비우게될시, 반려동물을 맡길 공간이 존재합니까?</p>
<input type="radio" name="anihome" id="yhome" value="yes">
<label for="yhome">예</label>
<input type="radio" name="anihome" id="nhome" value="no">
<label for="nhome">아니오</label>
</div>

<div>
<p>8. 주거의 형태?</p>
<input type="radio" name="house" id="house1" value="1">
<label for="house1">아파트</label>
<input type="radio" name="house" id="house2" value="2">
<label for="house2">단독주택</label>
<input type="radio" name="house" id="house3" value="3">
<label for="house3">빌라</label>
<input type="radio" name="house" id="house4" value="4">
<label for="house4">집이 없음</label>
</div>

<hr>
<div>
<p>반려견은 10~15년 이상, 길면 20년 이상 삽니다. 결혼, 임신, 유학, 이사 등으로 가정환경이 바뀌어도 끝까지 책임지고 보살피겠다는 결심이 섰습니까?</p>
<input type="radio" name="form1" id="f1yes" value="yes">
<label for="f1yes">예</label>
<input type="radio" name="form1" id="f1no" value="no">
<label for="f1no">아니오</label>
</div>

<div>
<p>반려동물을 맞이할 환경적 준비, 마음의 각오는 되어 있습니까?</p>
<input type="radio" name="form2" id="f2yes" value="yes">
<label for="f2yes">예</label>
<input type="radio" name="form2" id="f2no" value="no">
<label for="f2no">아니오</label>
</div>

<div>
<p>강아지가 화내게 해도 화내지않을 자신이 있으십니까</p>
<input type="radio" name="form3" id="f3yes" value="yes">
<label for="f3yes">예</label>
<input type="radio" name="form3" id="f3no" value="no">
<label for="f3no">아니오</label>
</div>

<button onclick="req_test()" type="button">제출하기</button>
</form>
</body>
<script type="text/javascript" src = " ../js/adoptreq.js"></script>
</html>