<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 22.07.2024
  Time: 18:11
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My appointments</title>
</head>

<body>

<c:choose>
    <c:when test="${not empty appointments}">
        <c:forEach var="appointment" items="${appointments}">
            <div class="projcard-subtitle">Doctor: ${appointment.doctor.firstname} ${appointment.doctor.lastname}</div>
            <div class="projcard-subtitle">Start time: ${appointment.startTime}</div>
            <div class="projcard-subtitle">End time: ${appointment.endTime}</div>
            <div class="projcard-subtitle">Status: ${appointment.status}</div>
        </c:forEach>
    </c:when>
    <c:otherwise>
        <div>No appointments</div>
    </c:otherwise>
</c:choose>

<div style="display: flex">
    <button class="button">
        <a href="${pageContext.request.contextPath}/appointment/choose-specialties">New appointment</a>
    </button>
</div>

<a href="${pageContext.request.contextPath}/admin/back-balance" class="back-link">
    <span>Back</span>
</a>

</body>
</html>
