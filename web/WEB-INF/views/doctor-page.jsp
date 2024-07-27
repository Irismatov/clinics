<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Doctor</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            position: relative;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        .back-link {
            position: absolute;
            top: 10px;
            left: 10px;
        }

        .button {
            margin: 10px;
        }

        .notification-bell {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 36px; /* Make the bell icon larger */
            transition: transform 0.2s ease;
        }

        .shake {
            animation: shake 0.5s ease;
        }

        @keyframes shake {
            0% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            50% { transform: translateX(5px); }
            75% { transform: translateX(-5px); }
            100% { transform: translateX(0); }
        }

        .badge {
            position: absolute;
            top: -10px;
            right: -10px;
            background-color: red;
            color: white;
            border-radius: 50%;
            padding: 5px 10px;
            font-size: 14px;
            font-weight: bold;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 50px;
        }
    </style>
</head>
<body>
<a href="${pageContext.request.contextPath}/" class="back-link">
    Back to Login
</a>
<div style="display: flex; justify-content: center; width: 100%;">
    <button class="button">
        <a href="${pageContext.request.contextPath}/requests">Incoming requests</a>
    </button>

    <button class="button">
        <a href="${pageContext.request.contextPath}/accepted-requests/show">New-diagnose</a>
    </button>
</div>

<c:choose>
    <c:when test="${not empty appointments}">
        <a href="${pageContext.request.contextPath}/appointment/new-appointments" class="notification-bell shake">
            <i class="fas fa-bell"></i>
            <span class="badge">${fn:length(appointments)}</span> <!-- Show number of new appointments -->
        </a>
    </c:when>
    <c:otherwise>
        <a href="${pageContext.request.contextPath}/appointment/new-appointments" class="notification-bell" style="color: red">
            <i class="fas fa-bell"></i>
        </a>
    </c:otherwise>
</c:choose>
</body>
</html>
