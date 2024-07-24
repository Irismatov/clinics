<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Available Time Slots</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
        }
        h2 {
            color: #333;
        }
        .slots-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        button.slot-button {
            background-color: lawngreen;
            border: 1px solid #b3daff;
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
            font-size: 18px;
            color: white;
            cursor: pointer;
            width: 200px;
            text-align: center;
        }
        button.slot-button:hover {
            background-color: green;
        }
        button.not-available {
            background-color: #ec3535;
            color: white;
            border: 1px solid #ddd;
            cursor: default;
            pointer-events: none; /* Отключает возможность клика */
        }
        button.not-available:hover {
            background-color: red;
        }
    </style>
</head>
<body>
<h2>Available Time Slots for ${selectedDate}</h2>

<div class="slots-container">
    <c:forEach var="slot" items="${timeSlots}">
        <c:choose>
            <c:when test="${slot.available}">
                <form method="post" action="${pageContext.request.contextPath}/appointment/create">
                    <input type="hidden" name="start" value="${slot.start}">
                    <input type="hidden" name="end" value="${slot.end}">
                    <button class="slot-button" type="submit">${slot}</button>
                </form>
            </c:when>
            <c:otherwise>
                <button class="slot-button not-available">${slot} (Not Available)</button>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</div>
</body>
</html>


