<%@page import="dao.animalDao"%>
<%@page import="dto.Animal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");

    String desertionNo = request.getParameter("desertionNo");
    String kind = request.getParameter("kind");
    String breed = request.getParameter("breed");
    String neuterYn = request.getParameter("neuterYn");
    String processState = request.getParameter("processState");
    String happenDt = request.getParameter("happenDt");
    String age = request.getParameter("age");
    String filename = request.getParameter("filename");
    String weight = request.getParameter("weight");

    if (desertionNo != null) {
        // 데이터 변환
        Long desertionNoLong = Long.parseLong(desertionNo);
        // 데이터 유효성 검사
        if (kind != null && breed != null && neuterYn != null && processState != null
                && happenDt != null && age != null && filename != null && weight != null) {

            // Animal 객체 생성
            Animal animal = new Animal();
            animal.setDesertionNo(desertionNo);
            animal.setKind(kind);
            animal.setBreed(breed);
            animal.setNeuterYn(neuterYn);
            animal.setProcessState(processState);
            animal.setHappenDt(happenDt);
            animal.setAge(age);
            animal.setFilename(filename);
            animal.setWeight(weight);

            // 동물 정보 업데이트
            animalDao.getInstance().update(animal); // 수정 필요한 메서드로 변경

            %>
            <script type="text/javascript">
                alert("수정이 완료되었습니다.");
                location.href = "ShelterManage.jsp"
            </script>
            <%
        } else {
            %>
            <script type="text/javascript">
                alert("입력값이 유효하지 않습니다.");
                location.href = "ShelterManage.jsp"
            </script>
            <%
        }
    } else {
        %>
        <script type="text/javascript">
            alert("유효하지 않은 요청입니다.");
            location.href = "ShelterManage.jsp"
        </script>
        <%
    }
%>