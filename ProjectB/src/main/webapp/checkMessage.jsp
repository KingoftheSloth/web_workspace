<%@page import="projectB.dto.Message"%>
<%@page import="projectB.dao.usersDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="projectB.dto.Message"%>
<%@page import="projectB.dao.usersDao"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메세지 확인</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        }
        .message {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 10px;
            background-color: #fff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>메세지 확인</h1>
        <%
            List<Message> messages = usersDao.getInstance().checkMessage();
            for (Message item : messages) {
        %>
        <div class="message">
            <p><strong>ID:</strong> <%= item.getUserid() %></p>
            <p><strong>메세지:</strong> <%= item.getMessage() %></p>
            <p><strong>동물ID:</strong> <%= item.getAniid() %></p>
        </div>
        <%
            }
        %>
    </div>
</body>
</html>
