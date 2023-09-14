<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지 전송</title>
</head>
<body>
    <h1>메시지 전송</h1>
    <form id="messageForm" method="post" action="saveMessage.jsp">
    <div id="sender-info">
     	<input type="hidden" id="userid" name="userid" value="<%= request.getParameter("userid") %>">
        <input type="hidden" id="aniid" name="aniid" value="<%= request.getParameter("animalId") %>">
        <p><strong>받는 분 ID:</strong> <span id="userid"><%= request.getParameter("userid") %></span></p>
        <p><strong>동물 ID:</strong> <span id="animalId"><%= request.getParameter("animalId") %></span></p>
    </div>
        <label for="message"></label>
        <textarea id="message" name="message" rows="4" cols="50"></textarea><br>
        <button type="submit">메시지 전송</button>
        <button type="button" onclick="closeMessageWindow()">닫기</button>
    </form>
    <script>
        // URL에서 쿼리 매개변수를 읽어옵니다.
        const urlParams = new URLSearchParams(window.location.search);
        
        const animalId = urlParams.get("animalId");
        const userid = urlParams.get("userid");

        // 읽어온 데이터를 사용하거나 처리합니다.
        console.log("Animal ID:", animalId);
        console.log("User ID:", userid);
        
        messageForm.addEventListener("submit", function (event) {
            const message = document.getElementById("message").value;
            const userid = document.getElementById("userid").value;
            const aniid = document.getElementById("aniid").value;
            // 메시지 필드가 비어 있는 경우
            if (message.trim() === "") {
                event.preventDefault(); // 폼 제출을 취소합니다.
                alert("메시지를 입력하세요.");
            } else {
                // 메시지가 비어 있지 않은 경우, 폼을 제출하도록 그대로 진행합니다.
                console.log("Message: " + message);
            }
        });

        function closeMessageWindow() {
            window.close();
        }
    </script>
</body>
</html>
