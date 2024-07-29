<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Patient</title>
</head>
<style>
    .projcard-subtitle {
        font-size: 1.2em;
        color: #333;
        margin: 10px 0;
    }

    .appointment-container {
        border: 1px solid #ddd;
        border-radius: 5px;
        padding: 15px;
        margin: 15px 0;
        background-color: #f9f9f9;
    }

    .appointment-container:hover {
        background-color: #f1f1f1;
    }

    .select-button {
        background-color: #4CAF50; /* Green */
        border: none;
        color: white;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 1em;
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 4px;
    }

    .select-button:hover {
        background-color: #45a049;
    }

    .no-appointments {
        font-size: 1.2em;
        color: #888;
        text-align: center;
        margin-top: 20px;
    }
</style>
<body>

<c:choose>
    <c:when test="${not empty appointments}">
        <c:forEach var="appointment" items="${appointments}">
            <div class="projcard-subtitle">
                Doctor: ${appointment.doctor.firstname} ${appointment.doctor.lastname}
            </div>
            <div class="projcard-subtitle">
                Start time: ${appointment.startTime}
            </div>
            <div class="projcard-subtitle">
                End time: ${appointment.endTime}
            </div>
            <form action="${pageContext.request.contextPath}/accepted-requests/get-diagnosis" method="post">
                <input type="hidden" name="appointmentId" value="${appointment.id}" />
                <button type="submit">View diagnosis</button>
            </form>
        </c:forEach>
    </c:when>
    <c:otherwise>
        <div>No appointments</div>
    </c:otherwise>
</c:choose>

</body>
</html>
