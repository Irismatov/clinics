<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 24.07.2024
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Patient</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .button {
            margin: 10px;
            padding: 10px 20px;
            background-color: #4CAF50; /* Green */
            border: none;
            color: black;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            transition-duration: 0.4s;
            cursor: pointer;
        }
        .button a {
            color: white;
            text-decoration: none;
        }
        .button:hover {
            background-color: white;
            color: black;
        }
        .button a:hover {
            color: black;
        }
    </style>
</head>
<body>
<div style="display: flex">
    <button class="button">
        <a href="${pageContext.request.contextPath}/appointment/show">My appointments</a>
    </button>

    <button class="button">
        <a href="${pageContext.request.contextPath}/admin/balance">Balance</a>
    </button>

    <button class="button">
        <a href="${pageContext.request.contextPath}/user-profile">My Profile</a>
    </button>
</div>
<c:forEach items="${notifications}" var="notification">
     <strong>${notification.doctor_fio}</strong>
    <strong>${notification.appointment_start}</strong>
    <strong>${notification.appointment_end}</strong>
</c:forEach>


</body>
</html>
